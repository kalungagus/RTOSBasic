//******************************************************************************
//                                PWM
//
// Data:       31/05/2020
// Descrição:  Utilização de porta PWM
//******************************************************************************
#ifndef _PWM_FREERTOS_H
#define _PWM_FREERTOS_H

#include "IOPorts.h"

typedef struct
{
    int8_t OC;
    int8_t DutyCycle;
    IOPort_t Port;
} PWMModule_t;

extern void initPWM(PWMModule_t *pwmModule);
extern void setDutyCycle(PWMModule_t *pwmModule, int8_t dutyCycle);
extern void startPwm(PWMModule_t *pwmModule);
void stopPwm(PWMModule_t *pwmModule);

#endif
//******************************************************************************