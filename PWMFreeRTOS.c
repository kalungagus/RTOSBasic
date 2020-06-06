//******************************************************************************
//                                PWM
//
// Data:       31/05/2020
// Descrição:  Utilização de porta PWM
//******************************************************************************
#include <xc.h>
#include "PWMFreeRTOS.h"

//******************************************************************************
// Protótipo de funções do módulo
//******************************************************************************
void initPWM(PWMModule_t *pwmModule);
void setPwmPort(PWMModule_t *pwmModule);

//******************************************************************************
// Funções
//******************************************************************************
void initPWM(PWMModule_t *pwmModule)
{
    int8_t dutyPeriod;
    
    dutyPeriod = (0x00C8 * pwmModule->DutyCycle) / 100;
    switch(pwmModule->OC)
    {
        case 1:
            OC1CON = 0x0000;
            OC1R = dutyPeriod;
            OC1RS = dutyPeriod;
            OC1CON = 0x0006;
            setPwmPort(pwmModule);
            OC1CONbits.ON = 1;
            break;
        case 2:
            OC2CON = 0x0000;
            OC2R = dutyPeriod;
            OC2RS = dutyPeriod;
            OC2CON = 0x0006;
            setPwmPort(pwmModule);
            OC2CONbits.ON = 1;
            break;
        case 3:
            OC3CON = 0x0000;
            OC3R = dutyPeriod;
            OC3RS = dutyPeriod;
            OC3CON = 0x0006;
            setPwmPort(pwmModule);
            OC3CONbits.ON = 1;
            break;
        case 4:
            OC4CON = 0x0000;
            OC4R = dutyPeriod;
            OC4RS = dutyPeriod;
            OC4CON = 0x0006;
            setPwmPort(pwmModule);
            OC4CONbits.ON = 1;
            break;
        case 5:
            OC5CON = 0x0000;
            OC5R = dutyPeriod;
            OC5RS = dutyPeriod;
            OC5CON = 0x0006;
            setPwmPort(pwmModule);
            OC5CONbits.ON = 1;
            break;
        case 6:
            OC6CON = 0x0000;
            OC6R = dutyPeriod;
            OC6RS = dutyPeriod;
            OC6CON = 0x0006;
            setPwmPort(pwmModule);
            OC6CONbits.ON = 1;
            break;
        case 7:
            OC7CON = 0x0000;
            OC7R = dutyPeriod;
            OC7RS = dutyPeriod;
            OC7CON = 0x0006;
            setPwmPort(pwmModule);
            OC7CONbits.ON = 1;
            break;
        case 8:
            OC8CON = 0x0000;
            OC8R = dutyPeriod;
            OC8RS = dutyPeriod;
            OC8CON = 0x0006;
            setPwmPort(pwmModule);
            OC8CONbits.ON = 1;
            break;
        case 9:
            OC9CON = 0x0000;
            OC9R = dutyPeriod;
            OC9RS = dutyPeriod;
            OC9CON = 0x0006;
            setPwmPort(pwmModule);
            OC9CONbits.ON = 1;
            break;
        default:
            break;
    }
    if(!T2CONbits.ON)
    {
        PR2 = 0x00C7;
        IFS0CLR = 0x00000100;
        IFS0SET = 0x00000000;
        IPC2SET = 0x0000001C;
        T2CONbits.ON = 1;
    }
}

void setPwmPort(PWMModule_t *pwmModule)
{
    int8_t portSelectionValue;
    
    if(pwmModule->OC == 1 || pwmModule->OC == 2 || pwmModule->OC == 9)
    {
        portSelectionValue = (pwmModule->OC == 1) ? 0x000a : ((pwmModule->OC == 2) ? 0x000C : 0x000B);
        switch(pwmModule->Port)
        {
            case PORT_RPD1:
                RPD1R = portSelectionValue;
                break;
            case PORT_RPG9:
                RPG9R = portSelectionValue;
                break;
            case PORT_RPB14:
                RPB14R = portSelectionValue;
                break;
            case PORT_RPD0:
                RPD0R = portSelectionValue;
                break;
            case PORT_RPB6:
                RPB6R = portSelectionValue;
                break;
            case PORT_RPD5:
                RPD5R = portSelectionValue;
                break;
            case PORT_RPB2:
                RPB2R = portSelectionValue;
                break;
            case PORT_RPF3:
                RPF3R = portSelectionValue;
                break;
            case PORT_RPF13:
                RPF13R = portSelectionValue;
                break;
            case PORT_RPC2:
                RPC2R = portSelectionValue;
                break;
            case PORT_RPE8:
                RPE8R = portSelectionValue;
                break;
            case PORT_RPF2:
                RPF2R = portSelectionValue;
                break;
            default:
                break;
        }
    }

    if(pwmModule->OC == 3 || pwmModule->OC == 6)
    {
        portSelectionValue = (pwmModule->OC == 3) ? 0x000B : 0x000C;
        switch(pwmModule->Port)
        {
            case PORT_RPD2:
                RPD2R = portSelectionValue;
                break;
            case PORT_RPG8:
                RPG8R = portSelectionValue;
                break;
            case PORT_RPF4:
                RPF4R = portSelectionValue;
                break;
            case PORT_RPD10:
                RPD10R = portSelectionValue;
                break;
            case PORT_RPF1:
                RPF1R = portSelectionValue;
                break;
            case PORT_RPB9:
                RPB9R = portSelectionValue;
                break;
            case PORT_RPB10:
                RPB10R = portSelectionValue;
                break;
            case PORT_RPC14:
                RPC14R = portSelectionValue;
                break;
            case PORT_RPB5:
                RPB5R = portSelectionValue;
                break;
            case PORT_RPC1:
                RPC1R = portSelectionValue;
                break;
            case PORT_RPD14:
                RPD14R = portSelectionValue;
                break;
            case PORT_RPG1:
                RPG1R = portSelectionValue;
                break;
            case PORT_RPA14:
                RPA14R = portSelectionValue;
                break;
            default:
                break;
        }
    }
    
    if(pwmModule->OC == 4 || pwmModule->OC == 7)
    {
        portSelectionValue = (pwmModule->OC == 4) ? 0x000B : 0x000C;
        switch(pwmModule->Port)
        {
            case PORT_RPD3:
                RPD3R = portSelectionValue;
                break;
            case PORT_RPG7:
                RPG7R = portSelectionValue;
                break;
            case PORT_RPF5:
                RPF5R = portSelectionValue;
                break;
            case PORT_RPD11:
                RPD11R = portSelectionValue;
                break;
            case PORT_RPF0:
                RPF0R = portSelectionValue;
                break;
            case PORT_RPB1:
                RPB1R = portSelectionValue;
                break;
            case PORT_RPE5:
                RPE5R = portSelectionValue;
                break;
            case PORT_RPC13:
                RPC13R = portSelectionValue;
                break;
            case PORT_RPB3:
                RPB3R = portSelectionValue;
                break;
            case PORT_RPC4:
                RPC4R = portSelectionValue;
                break;
            case PORT_RPD15:
                RPD15R = portSelectionValue;
                break;
            case PORT_RPG0:
                RPG0R = portSelectionValue;
                break;
            case PORT_RPA15:
                RPA15R = portSelectionValue;
                break;
            default:
                break;
        }
    }
    
    if(pwmModule->OC == 5 || pwmModule->OC == 8)
    {
        portSelectionValue = (pwmModule->OC == 5) ? 0x000B : 0x000C;
        switch(pwmModule->Port)
        {
            case PORT_RPD9:
                RPD9R = portSelectionValue;
                break;
            case PORT_RPG6:
                RPG6R = portSelectionValue;
                break;
            case PORT_RPB8:
                RPB8R = portSelectionValue;
                break;
            case PORT_RPB15:
                RPB15R = portSelectionValue;
                break;
            case PORT_RPD4:
                RPD4R = portSelectionValue;
                break;
            case PORT_RPB0:
                RPB0R = portSelectionValue;
                break;
            case PORT_RPE3:
                RPE3R = portSelectionValue;
                break;
            case PORT_RPB7:
                RPB7R = portSelectionValue;
                break;
            case PORT_RPF12:
                RPF12R = portSelectionValue;
                break;
            case PORT_RPD12:
                RPD12R = portSelectionValue;
                break;
            case PORT_RPF8:
                RPF8R = portSelectionValue;
                break;
            case PORT_RPC3:
                RPC3R = portSelectionValue;
                break;
            case PORT_RPE9:
                RPE9R = portSelectionValue;
                break;
            default:
                break;
        }
    }
}

//******************************************************************************