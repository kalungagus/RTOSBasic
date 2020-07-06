//******************************************************************************
//                             LED INTERFACE
//
// Data:       04/04/2020
// Descrição:  Controle de acionamento de leds
//******************************************************************************
#include <xc.h>
#include "FreeRTOS.h"
#include "task.h"
#include "Framework/USB/USB.h"
#include "Framework/ADC/ADC.h"
#include "Framework/PWM/PWM.h"
#include "Framework/INA219/INA219.h"
#include "Framework/HC-SR04/HC-SR04.h"
#include "Framework/HX711/HX711.h"

//******************************************************************************
// Definições da task
//******************************************************************************
#define PACKET_MAXIMUM_SIZE     200
#define HEADER1                 0xAA
#define HEADER2                 0x55
#define SIGNAL_MAX_SAMPLES      8000
#define MAX_SAMPLE_FREQ         500000

//******************************************************************************
// Definição de comandos utilizados pelos módulos
//******************************************************************************
#define CMD_ECHO                     0x8000
#define CMD_GET_SIGNAL               0x8001
#define CMD_GET_ANALOG_VALUE         0x8002
#define CMD_SET_PWM                  0x8003
#define CMD_GET_VOLTAGE              0x8004
#define CMD_GET_CURRENT              0x8005
#define CMD_GET_POWER                0x8006
#define CMD_GET_DISTANCE             0x8007
#define CMD_GET_WEIGHT               0x8008

//******************************************************************************

// <editor-fold defaultstate="collapsed" desc="Function declarations">
//******************************************************************************
// A declaração de funções aqui permite melhor organização das funções no
// arquivo fonte
//******************************************************************************
static void taskUSBPacketManagerControl(void *);
void usbWaitForPacketHeader(void);
uint16_t usbGetInterger(void);
uint16_t convertToUInt16(unsigned char *buffer, uint8_t ind);
uint32_t convertToUInt32(unsigned char *buffer, uint8_t ind);
void usbPacketManager(unsigned char *packet, uint16_t packetSize);

//******************************************************************************
// </editor-fold>

uint16_t signalSamples[SIGNAL_MAX_SAMPLES];
DAQModule_t myDAQ =
{
    .Timer.ID = TIMER_5_ID,
};

HCSR04Sensor_t sensor1 =
{
    .IC = 
    {
        .ID = 2,
        .Port = IO_B15,
    },
    .Trigger = IO_E1,
};

INA219Sensor_t sensor2 =
{
    .I2CID = 1,
};

ADCModule_t myADC;
PWMModule_t myPWM;

void USBPacketManagerInit(void)
{
    initUSB();
    xTaskCreate(taskUSBPacketManagerControl, "usbPacketManagerControl", 8500, NULL, tskIDLE_PRIORITY+1, NULL);
}

static void taskUSBPacketManagerControl(void *pvParameters)
{
    uint16_t receivedBytes, packetSize;
    unsigned char packet[PACKET_MAXIMUM_SIZE];
    
    for(;;)
    {
        usbWaitForPacketHeader();
        packetSize = usbGetInterger();
        if(packetSize > PACKET_MAXIMUM_SIZE) packetSize = PACKET_MAXIMUM_SIZE;
        receivedBytes = getUSBPacket(packet, packetSize);
        if(receivedBytes != packetSize) continue;
        usbPacketManager(packet, packetSize);
    }
}

void usbWaitForPacketHeader(void)
{
    uint8_t tmpData;

    tmpData = 0;
    while(tmpData != HEADER1)
        tmpData = getUSBByte();
    tmpData = 0;
    while(tmpData != HEADER2)
        tmpData = getUSBByte();
}

uint16_t usbGetInterger(void)
{
    uint16_t tmpData;
    
    ((uint8_t *)(&tmpData))[0] = getUSBByte();
    ((uint8_t *)(&tmpData))[1] = getUSBByte();

    return(tmpData);
}

uint16_t convertToUInt16(unsigned char *buffer, uint8_t ind)
{
    uint16_t val;
    
    ((uint8_t *)(&val))[0] = buffer[ind];
    ((uint8_t *)(&val))[1] = buffer[ind+1];
    return(val);
}

uint32_t convertToUInt32(unsigned char *buffer, uint8_t ind)
{
    uint32_t val;
    
    ((uint8_t *)(&val))[0] = buffer[ind];
    ((uint8_t *)(&val))[1] = buffer[ind+1];
    ((uint8_t *)(&val))[2] = buffer[ind+2];
    ((uint8_t *)(&val))[3] = buffer[ind+3];
    return(val);
}


void usbPacketManager(unsigned char *packet, uint16_t packetSize)
{
    unsigned char header[2] = {HEADER1 , HEADER2};
    uint16_t command, tmpData16;
    uint32_t tmpData32;
    
    command = convertToUInt16(packet, 0);
    switch(command)
    {
        case CMD_ECHO:
            startLoadingUSBPacket();
            loadUSBPacket(header, sizeof(header));
            loadUSBPacket((uint8_t *)(&packetSize), sizeof(packetSize));
            loadUSBPacket(packet, packetSize);
            endLoadingUSBPacket();
            break;

        case CMD_GET_SIGNAL:
            // Este projeto só aceita os ADCs 2 e 3
            if((packet[2] == 2) || (packet[2] == 3))
            {
                myDAQ.ADC.ID = packet[2];

                tmpData32 = convertToUInt32(packet, 3);
                if(tmpData32 > MAX_SAMPLE_FREQ)
                    tmpData32 = MAX_SAMPLE_FREQ;

                tmpData16 = convertToUInt16(packet, 7);
                if(tmpData16 > SIGNAL_MAX_SAMPLES)
                    tmpData16 = SIGNAL_MAX_SAMPLES;

                setupDAQ(&myDAQ, tmpData32);
                dataAcquire(&myDAQ, signalSamples, tmpData16);
                turnDAQOff(&myDAQ);
            }
            else
            {
                tmpData16 = 1;
                signalSamples[0] = 0x0000;
            }

            startLoadingUSBPacket();
            loadUSBPacket(header, sizeof(header));
            tmpData16 = tmpData16*sizeof(int16_t)+2;
            loadUSBPacket((uint8_t *)(&tmpData16), sizeof(tmpData16));
            loadUSBPacket((uint8_t *)(&command), sizeof(command));
            loadUSBPacket((uint8_t *)signalSamples, tmpData16+4);
            endLoadingUSBPacket();
            break;

        case CMD_GET_ANALOG_VALUE:
            startLoadingUSBPacket();
            loadUSBPacket(header, sizeof(header));
            tmpData16 = 4;
            loadUSBPacket((uint8_t *)(&tmpData16), sizeof(tmpData16));
            loadUSBPacket((uint8_t *)(&command), sizeof(command));
            if((packet[2] == 2) || (packet[2] == 3) || (packet[2] == 10))
            {
                myADC.ID = packet[2];
                myADC.TriggerSource = ADC_TRIGG_GLOB_EDGE_TRIGG;
                setupADC(&myADC);
                tmpData16 = readAnalogValue(&myADC);
                turnADCOff(&myADC);
            }
            else
            {
                tmpData16 = 0x0000;
            }
            loadUSBPacket((uint8_t *)(&tmpData16), sizeof(tmpData16));
            endLoadingUSBPacket();
            break;
            
        case CMD_SET_PWM:
            tmpData16 = convertToUInt16(packet, 3);
            if(((packet[2] == 3) && (tmpData16 == IO_B5)) || 
               ((packet[2] == 4) && (tmpData16 == IO_B1)) ||
               ((packet[2] == 5) && (tmpData16 == IO_B0))
              )
            {
                myPWM.OC = packet[2];
                myPWM.Port.ID = tmpData16;
                myPWM.DutyCycle = packet[5];
                setupPWM(&myPWM);
                if(packet[5] != 0)
                    startPwm(&myPWM);
                else
                    stopPwm(&myPWM);
            }
            break;
        case CMD_GET_VOLTAGE:
            startLoadingUSBPacket();
            loadUSBPacket(header, sizeof(header));
            tmpData16 = 4;
            loadUSBPacket((uint8_t *)(&tmpData16), sizeof(tmpData16));
            loadUSBPacket((uint8_t *)(&command), sizeof(command));
            setupINA219(&sensor2);
            tmpData16 = ina219GetBusVoltage(&sensor2);
            setINA219Off(&sensor2);
            loadUSBPacket((uint8_t *)(&tmpData16), sizeof(tmpData16));
            endLoadingUSBPacket();
            break;
        case CMD_GET_CURRENT:
            startLoadingUSBPacket();
            loadUSBPacket(header, sizeof(header));
            tmpData16 = 4;
            loadUSBPacket((uint8_t *)(&tmpData16), sizeof(tmpData16));
            loadUSBPacket((uint8_t *)(&command), sizeof(command));
            setupINA219(&sensor2);
            tmpData16 = ina219GetGurrent(&sensor2);
            setINA219Off(&sensor2);
            loadUSBPacket((uint8_t *)(&tmpData16), sizeof(tmpData16));
            endLoadingUSBPacket();
            break;
        case CMD_GET_POWER:
            startLoadingUSBPacket();
            loadUSBPacket(header, sizeof(header));
            tmpData16 = 4;
            loadUSBPacket((uint8_t *)(&tmpData16), sizeof(tmpData16));
            loadUSBPacket((uint8_t *)(&command), sizeof(command));
            setupINA219(&sensor2);
            tmpData16 = ina219GetPower(&sensor2);
            setINA219Off(&sensor2);
            loadUSBPacket((uint8_t *)(&tmpData16), sizeof(tmpData16));
            endLoadingUSBPacket();
            break;
        case CMD_GET_DISTANCE:
            startLoadingUSBPacket();
            loadUSBPacket(header, sizeof(header));
            tmpData16 = 4;
            loadUSBPacket((uint8_t *)(&tmpData16), sizeof(tmpData16));
            loadUSBPacket((uint8_t *)(&command), sizeof(command));
            setupHCSR04(&sensor1);
            tmpData16 = getDistanceCM(&sensor1);
            setHCSR04Off(&sensor1);
            loadUSBPacket((uint8_t *)(&tmpData16), sizeof(tmpData16));
            endLoadingUSBPacket();
            break;
        case CMD_GET_WEIGHT:
            startLoadingUSBPacket();
            loadUSBPacket(header, sizeof(header));
            tmpData16 = 6;
            loadUSBPacket((uint8_t *)(&tmpData16), sizeof(tmpData16));
            loadUSBPacket((uint8_t *)(&command), sizeof(command));
            //tmpData32 = hx711Read();
            loadUSBPacket((uint8_t *)(&tmpData32), sizeof(tmpData32));
            endLoadingUSBPacket();
            break;
        default:
            break;
    }
}

//******************************************************************************