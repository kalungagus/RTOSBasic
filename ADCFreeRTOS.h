//******************************************************************************
//                                ADC
//
// Data:       06/05/2020
// Descrição:  Utilização do ADC para amostragem de sinais
//******************************************************************************
#include "HardwareConfig.h"

#ifndef _ADC_FREERTOS_H
#define _ADC_FREERTOS_H

//******************************************************************************
// Definições
//******************************************************************************
// Definição do ID dos DAQs
#ifdef DAQ_1_ADC
#define DAQ_1                    0xD1
#endif
#ifdef DAQ_2_ADC
#define DAQ_2                    0xD2
#endif
#ifdef DAQ_3_ADC
#define DAQ_3                    0xD3
#endif
#ifdef DAQ_4_ADC
#define DAQ_4                    0xD4
#endif

#ifdef ANALOG_INPUT_1_ADC
#define ANALOG_INPUT_1           0xA1
#endif

//******************************************************************************
// Funções
//******************************************************************************
extern void initADC(void);
extern void dataAcquire(uint8_t DAQ, uint16_t *sampleCollection, uint16_t sizeOfCollection);
extern uint16_t getAdcValue(int8_t ADC);

#endif
//******************************************************************************