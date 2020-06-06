//******************************************************************************
//                             LED INTERFACE
//
// Data:       04/04/2020
// Descrição:  Controle de acionamento de leds
//******************************************************************************
#ifndef _LED_INTERFACE_
    #define _LED_INTERFACE_

typedef struct
{
    uint8_t portID;
    uint8_t status;
} LedInfo;

void LEDInterfaceInit(void);
void setLedInfo(LedInfo *);

#endif
//******************************************************************************