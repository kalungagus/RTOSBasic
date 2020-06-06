//******************************************************************************
//                                PWM
//
// Data:       31/05/2020
// Descrição:  Utilização de porta PWM
//******************************************************************************
#ifndef _PWM_FREERTOS_H
#define _PWM_FREERTOS_H

#define PORT_RPA14      0
#define PORT_RPA15      1
#define PORT_RPB0       2
#define PORT_RPB1       3
#define PORT_RPB2       4
#define PORT_RPB3       5
#define PORT_RPB5       6
#define PORT_RPB6       7
#define PORT_RPB7       8
#define PORT_RPB8       9
#define PORT_RPB9       10
#define PORT_RPB10      11
#define PORT_RPB14      12
#define PORT_RPB15      13
#define PORT_RPC1       14
#define PORT_RPC2       15
#define PORT_RPC3       16
#define PORT_RPC4       17
#define PORT_RPC13      18
#define PORT_RPC14      19
#define PORT_RPD0       20
#define PORT_RPD1       21
#define PORT_RPD2       22
#define PORT_RPD3       23
#define PORT_RPD4       24
#define PORT_RPD5       25
#define PORT_RPD9       26
#define PORT_RPD10      27
#define PORT_RPD11      28
#define PORT_RPD12      29
#define PORT_RPD14      30
#define PORT_RPD15      31
#define PORT_RPE3       32
#define PORT_RPE5       33
#define PORT_RPE8       34
#define PORT_RPE9       35
#define PORT_RPF13      36
#define PORT_RPF0       37
#define PORT_RPF1       38
#define PORT_RPF2       39
#define PORT_RPF3       40
#define PORT_RPF4       41
#define PORT_RPF5       42
#define PORT_RPF8       43
#define PORT_RPF12      44
#define PORT_RPG0       45
#define PORT_RPG1       46
#define PORT_RPG6       47
#define PORT_RPG7       48
#define PORT_RPG8       49
#define PORT_RPG9       50

typedef struct
{
    int8_t OC;
    int8_t DutyCycle;
    int8_t Port;
} PWMModule_t;

extern void initPWM(PWMModule_t *pwmModule);

#endif
//******************************************************************************