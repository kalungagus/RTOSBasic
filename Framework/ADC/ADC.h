//******************************************************************************
//                                ADC
//
// Data:       06/05/2020
// Descrição:  Utilização do ADC para amostragem de sinais
//******************************************************************************
#include "HardwareConfig.h"
#include "FreeRTOS.h"
#include "queue.h"
#include "semphr.h"
#include "../IO Ports/IOPorts.h"
#include "../Timer/Timer.h"

#ifndef _ADC_FREERTOS_H
#define _ADC_FREERTOS_H

//******************************************************************************
// Definições
//******************************************************************************
// Fontes de Trigger
#define ADC_TRIGG_NO_TRIGGER               0x00
#define ADC_TRIGG_GLOB_EDGE_TRIGG          0x01
#define ADC_TRIGG_GLOB_LEVEL_TRIGG         0x02
#define ADC_TRIGG_STRIG                    0x03
#define ADC_TRIGG_INT0                     0x04
#define ADC_TRIGG_TMR1                     0x05
#define ADC_TRIGG_TMR3                     0x06
#define ADC_TRIGG_TMR5                     0x07
#define ADC_TRIGG_OCMP1                    0x08
#define ADC_TRIGG_OCMP3                    0x09
#define ADC_TRIGG_OCMP5                    0x0A
#define ADC_TRIGG_COMPARATOR1              0x0B
#define ADC_TRIGG_COMPARATOR2              0x0C

//******************************************************************************
// Estruturas
//******************************************************************************
typedef struct
{
    uint8_t ID;
    uint8_t TriggerSource;
    IOPort_t Pin;
} ADCModule_t;

typedef struct
{
    ADCModule_t ADC;
    Timer_t Timer;
} DAQModule_t;

//******************************************************************************
// Funções
//******************************************************************************
extern void initADC(void);
extern void setupDAQ(DAQModule_t *module, int32_t sampleFreq);
extern void turnDAQOff(DAQModule_t *module);
extern void setupADC(ADCModule_t *module);
extern void turnADCOff(ADCModule_t *module);
extern void dataAcquire(DAQModule_t *module, uint16_t *sampleCollection, uint16_t sizeOfCollection);
extern uint16_t readAnalogValue(ADCModule_t *ADC);

#endif
//******************************************************************************