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

//******************************************************************************
// Definições da task
//******************************************************************************
#define PACKET_SIZE             200
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

//******************************************************************************
// </editor-fold>

#pragma pack(2)
typedef struct
{
    uint8_t  header1;
    uint8_t  header2;
    uint16_t size;
    uint16_t command;
    uint16_t signal[SIGNAL_MAX_SAMPLES];
} SamplesPacket_t;
#pragma pack()

SamplesPacket_t samples;
unsigned char buffer[PACKET_SIZE];
unsigned char buffer2[PACKET_SIZE];

void USBPacketManagerInit(void)
{
    initUSB();
    xTaskCreate(taskUSBPacketManagerControl, "usbPacketManagerControl", 8500, NULL, tskIDLE_PRIORITY+1, NULL);
}

static void taskUSBPacketManagerControl(void *pvParameters)
{
    uint8_t tmpData;
    uint16_t tmpData16, packetSize, command;
    
    for(;;)
    {
        tmpData = getUSBByte();
        if(tmpData != HEADER1) continue;
        tmpData = getUSBByte();
        if(tmpData != HEADER2) continue;
        ((uint8_t *)(&packetSize))[0] = getUSBByte();
        ((uint8_t *)(&packetSize))[1] = getUSBByte();
        if(packetSize > PACKET_SIZE) packetSize = PACKET_SIZE;
        tmpData16 = getUSBPacket(buffer, packetSize);
        if(tmpData16 != packetSize) continue;
        ((uint8_t *)(&command))[0] = buffer[0];
        ((uint8_t *)(&command))[1] = buffer[1];
        switch(command)
        {
            case 0x8000:
                ((uint8_t *)(&tmpData16))[0] = buffer[2];
                ((uint8_t *)(&tmpData16))[1] = buffer[3];
                if(tmpData16 > SIGNAL_MAX_SAMPLES)
                    tmpData16 = SIGNAL_MAX_SAMPLES;
                getSamplesFromSignal((uint16_t *)(&(samples.signal[0])), tmpData16);
                samples.header1 = HEADER1;
                samples.header2 = HEADER2;
                samples.size = tmpData16*sizeof(int16_t)+2;
                samples.command = 0x8000;
                sendUSBPacket((uint8_t *)&samples, samples.size + 4);
                break;
            case 0x8001:
                buffer2[0] = HEADER1;
                buffer2[1] = HEADER2;
                buffer2[2] = ((uint8_t *)(&packetSize))[0];
                buffer2[3] = ((uint8_t *)(&packetSize))[1];
                for(tmpData16 = 0; tmpData16 < packetSize; tmpData16++)
                {
                    buffer2[4+tmpData16] = buffer[tmpData16];
                }
                sendUSBPacket(buffer2, packetSize+4);
                break;
            case 0x8002:
                buffer2[0] = HEADER1;
                buffer2[1] = HEADER2;
                buffer2[2] = 4;
                buffer2[3] = 0;
                buffer2[4] = ((uint8_t *)(&command))[0];
                buffer2[5] = ((uint8_t *)(&command))[1];
                tmpData16 = getAdcValue();
                buffer2[6] = ((uint8_t *)(&tmpData16))[0];
                buffer2[7] = ((uint8_t *)(&tmpData16))[1];
                sendUSBPacket(buffer2, 8);
                break;
            default:
                break;
        }
    }
}

//******************************************************************************