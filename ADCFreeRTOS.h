//******************************************************************************
//                                ADC
//
// Data:       06/05/2020
// Descrição:  Utilização do ADC para amostragem de sinais
//******************************************************************************
#ifndef _ADC_FREERTOS_H
#define _ADC_FREERTOS_H

extern void initADC(void);
extern void getSamplesFromSignal(int16_t *sampleCollection, int16_t sizeOfCollection);
extern int16_t getAdcValue(void);

#endif
//******************************************************************************