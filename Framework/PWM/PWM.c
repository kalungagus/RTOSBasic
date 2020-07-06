//******************************************************************************
//                                PWM
//
// Data:       31/05/2020
// Descrição:  Utilização de porta PWM
//******************************************************************************
#include <xc.h>
#include "PWM.h"

//******************************************************************************
// Protótipo de funções do módulo
//******************************************************************************
void initPWM(PWMModule_t *pwmModule);
void setDutyCycle(PWMModule_t *pwmModule, int8_t dutyCycle);
void setPwmPort(PWMModule_t *pwmModule);

//******************************************************************************
// Funções
//******************************************************************************
void setupPWM(PWMModule_t *pwmModule)
{
    pwmModule->Timer.countInterrupt = 0;
    pwmModule->Timer.period = 0x00C7;
    setDutyCycle(pwmModule, pwmModule->DutyCycle);
    setPwmPort(pwmModule);
    pwmModule->Timer.ID = 2;
    if(getTimerState(&pwmModule->Timer) == TIMER_OFF)
    {
        setupTimer(&pwmModule->Timer);
        setTimerState(&pwmModule->Timer, TIMER_ON);
    }
}

void setDutyCycle(PWMModule_t *pwmModule, int8_t dutyCycle)
{
    uint32_t dutyPeriod;
    
    pwmModule->DutyCycle = dutyCycle;
    dutyPeriod = ((pwmModule->Timer.period + 1) * pwmModule->DutyCycle) / 100;
    switch(pwmModule->OC)
    {
        case 1:
            OC1CON = 0x0000;
            OC1R = dutyPeriod;
            OC1RS = dutyPeriod;
            OC1CON = 0x0006;
            break;
        case 2:
            OC2CON = 0x0000;
            OC2R = dutyPeriod;
            OC2RS = dutyPeriod;
            OC2CON = 0x0006;
            break;
        case 3:
            OC3CON = 0x0000;
            OC3R = dutyPeriod;
            OC3RS = dutyPeriod;
            OC3CON = 0x0006;
            break;
        case 4:
            OC4CON = 0x0000;
            OC4R = dutyPeriod;
            OC4RS = dutyPeriod;
            OC4CON = 0x0006;
            break;
        case 5:
            OC5CON = 0x0000;
            OC5R = dutyPeriod;
            OC5RS = dutyPeriod;
            OC5CON = 0x0006;
            break;
        case 6:
            OC6CON = 0x0000;
            OC6R = dutyPeriod;
            OC6RS = dutyPeriod;
            OC6CON = 0x0006;
            break;
        case 7:
            OC7CON = 0x0000;
            OC7R = dutyPeriod;
            OC7RS = dutyPeriod;
            OC7CON = 0x0006;
            break;
        case 8:
            OC8CON = 0x0000;
            OC8R = dutyPeriod;
            OC8RS = dutyPeriod;
            OC8CON = 0x0006;
            break;
        case 9:
            OC9CON = 0x0000;
            OC9R = dutyPeriod;
            OC9RS = dutyPeriod;
            OC9CON = 0x0006;
            break;
        default:
            break;
    }
}

void setPwmPort(PWMModule_t *pwmModule)
{
    int8_t OutputPinMap[9] = {PPS_OUT_OC1, PPS_OUT_OC2, PPS_OUT_OC3, PPS_OUT_OC4, PPS_OUT_OC5, PPS_OUT_OC6, PPS_OUT_OC7, PPS_OUT_OC8, PPS_OUT_OC9};
    int8_t portSelectionValue;

    portSelectionValue = OutputPinMap[pwmModule->OC - 1];
    setOutputPinSelection(pwmModule->Port, portSelectionValue);
}

void setPWMOff(PWMModule_t *pwmModule)
{
    switch(pwmModule->OC)
    {
        case 1:
            OC1CON = 0x0000;
            break;
        case 2:
            OC2CON = 0x0000;
            break;
        case 3:
            OC3CON = 0x0000;
            break;
        case 4:
            OC4CON = 0x0000;
            break;
        case 5:
            OC5CON = 0x0000;
            break;
        case 6:
            OC6CON = 0x0000;
            break;
        case 7:
            OC7CON = 0x0000;
            break;
        case 8:
            OC8CON = 0x0000;
            break;
        case 9:
            OC9CON = 0x0000;
            break;
        default:
            break;
    }
}

void startPwm(PWMModule_t *pwmModule)
{
    switch(pwmModule->OC)
    {
        case 1:
            OC1CONbits.ON = 1;
            break;
        case 2:
            OC2CONbits.ON = 1;
            break;
        case 3:
            OC3CONbits.ON = 1;
            break;
        case 4:
            OC4CONbits.ON = 1;
            break;
        case 5:
            OC5CONbits.ON = 1;
            break;
        case 6:
            OC6CONbits.ON = 1;
            break;
        case 7:
            OC7CONbits.ON = 1;
            break;
        case 8:
            OC8CONbits.ON = 1;
            break;
        case 9:
            OC9CONbits.ON = 1;
            break;
        default:
            break;
    }
}

void stopPwm(PWMModule_t *pwmModule)
{
    switch(pwmModule->OC)
    {
        case 1:
            OC1CONbits.ON = 0;
            break;
        case 2:
            OC2CONbits.ON = 0;
            break;
        case 3:
            OC3CONbits.ON = 0;
            break;
        case 4:
            OC4CONbits.ON = 0;
            break;
        case 5:
            OC5CONbits.ON = 0;
            break;
        case 6:
            OC6CONbits.ON = 0;
            break;
        case 7:
            OC7CONbits.ON = 0;
            break;
        case 8:
            OC8CONbits.ON = 0;
            break;
        case 9:
            OC9CONbits.ON = 0;
            break;
        default:
            break;
    }
}

//******************************************************************************