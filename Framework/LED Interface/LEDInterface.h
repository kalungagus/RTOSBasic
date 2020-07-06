//******************************************************************************
//                             LED INTERFACE
//
// Data:       04/04/2020
// Descrição:  Controle de acionamento de leds
//******************************************************************************
#ifndef _LED_INTERFACE_
    #define _LED_INTERFACE_

#include "../IO Ports/IOPorts.h"

#define LED_ON               1
#define LED_OFF              0

typedef struct
{
    IOPort_t port;
    uint8_t status;
} LedInfo;

extern void setupLed(LedInfo *led);
extern void LEDInterfaceInit(void);
extern void setLedInfo(LedInfo *);

#endif
//******************************************************************************