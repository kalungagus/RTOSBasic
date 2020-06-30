//******************************************************************************
//                             LED INTERFACE
//
// Data:       04/04/2020
// Descrição:  Controle de acionamento de leds
//******************************************************************************
#include <xc.h>
#include "FreeRTOS.h"
#include "task.h"
#include "USBFreeRTOS.h"
#include "ADCFreeRTOS.h"
#include "PWMFreeRTOS.h"
#include "INA219.h"
#include "HC-SR04.h"
#include "HX711.h"

//******************************************************************************
// Definições da task
//******************************************************************************
#define PACKET_MAXIMUM_SIZE     200
#define HEADER1                 0xAA
#define HEADER2                 0x55
#define SIGNAL_MAX_SAMPLES      8000

//******************************************************************************

// <editor-fold defaultstate="collapsed" desc="Function declarations">
//******************************************************************************
// A declaração de funções aqui permite melhor organização das funções no
// arquivo fonte
//******************************************************************************
static void taskUSBPacketManagerControl(void *);
void usbWaitForPacketHeader(void);
uint16_t usbGetInterger(void);
uint16_t convertToUInt16(unsigned char *buffer, uint16_t ind);
void usbPacketManager(unsigned char *packet, uint16_t packetSize);

//******************************************************************************
// </editor-fold>

uint16_t signalSamples[SIGNAL_MAX_SAMPLES];

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

uint16_t convertToUInt16(unsigned char *buffer, uint16_t ind)
{
    uint16_t val;
    
    ((uint8_t *)(&val))[0] = buffer[ind];
    ((uint8_t *)(&val))[1] = buffer[ind+1];
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
        case 0x8000:
            tmpData16 = convertToUInt16(packet, 2);
            if(tmpData16 > SIGNAL_MAX_SAMPLES)
                tmpData16 = SIGNAL_MAX_SAMPLES;
            dataAcquire(DAQ_1, signalSamples, tmpData16);

            startLoadingUSBPacket();
            loadUSBPacket(header, sizeof(header));
            tmpData16 = tmpData16*sizeof(int16_t)+2;
            loadUSBPacket((uint8_t *)(&tmpData16), sizeof(tmpData16));
            loadUSBPacket((uint8_t *)(&command), sizeof(command));
            loadUSBPacket((uint8_t *)signalSamples, tmpData16+4);
            endLoadingUSBPacket();
            break;
        case 0x8001:
            startLoadingUSBPacket();
            loadUSBPacket(header, sizeof(header));
            loadUSBPacket((uint8_t *)(&packetSize), sizeof(packetSize));
            loadUSBPacket(packet, packetSize);
            endLoadingUSBPacket();
            break;
        case 0x8002:
            startLoadingUSBPacket();
            loadUSBPacket(header, sizeof(header));
            tmpData16 = 4;
            loadUSBPacket((uint8_t *)(&tmpData16), sizeof(tmpData16));
            loadUSBPacket((uint8_t *)(&command), sizeof(command));
            tmpData16 = getAdcValue(ANALOG_INPUT_1);
            loadUSBPacket((uint8_t *)(&tmpData16), sizeof(tmpData16));
            endLoadingUSBPacket();
            break;
        case 0x8003:
            startLoadingUSBPacket();
            loadUSBPacket(header, sizeof(header));
            tmpData16 = 4;
            loadUSBPacket((uint8_t *)(&tmpData16), sizeof(tmpData16));
            loadUSBPacket((uint8_t *)(&command), sizeof(command));
            //tmpData16 = ina219GetPower();
            loadUSBPacket((uint8_t *)(&tmpData16), sizeof(tmpData16));
            endLoadingUSBPacket();
            break;
        case 0x8004:
            startLoadingUSBPacket();
            loadUSBPacket(header, sizeof(header));
            tmpData16 = 4;
            loadUSBPacket((uint8_t *)(&tmpData16), sizeof(tmpData16));
            loadUSBPacket((uint8_t *)(&command), sizeof(command));
            tmpData16 = getDistanceCM();
            loadUSBPacket((uint8_t *)(&tmpData16), sizeof(tmpData16));
            endLoadingUSBPacket();
            break;
        case 0x8005:
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