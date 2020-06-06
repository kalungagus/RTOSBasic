//******************************************************************************
//                                DIGITAL PORT
//
// Data:         05/06/2020
// Descrição:    Definições utilizadas para modularização de Portas Digitais
// Dependências: Nenhuma
//******************************************************************************
#include "HardwareConfig.h"

#ifndef _DIGITAL_PORT_H
#define _DIGITAL_PORT_H

//******************************************************************************
// Definições
//******************************************************************************
// Definição do ID de pinos de entrada
#if defined(DIGITAL_INPUT_1_PORT) && defined(DIGITAL_INPUT_1_PIN)
#define DIGITAL_INPUT_1                  0x81
#endif
#if defined(DIGITAL_INPUT_2_PORT) && defined(DIGITAL_INPUT_2_PIN)
#define DIGITAL_INPUT_2                  0x82
#endif
#if defined(DIGITAL_INPUT_3_PORT) && defined(DIGITAL_INPUT_3_PIN)
#define DIGITAL_INPUT_3                  0x83
#endif
#if defined(DIGITAL_INPUT_4_PORT) && defined(DIGITAL_INPUT_4_PIN)
#define DIGITAL_INPUT_4                  0x84
#endif
#if defined(DIGITAL_INPUT_5_PORT) && defined(DIGITAL_INPUT_5_PIN)
#define DIGITAL_INPUT_5                  0x85
#endif
#if defined(DIGITAL_INPUT_6_PORT) && defined(DIGITAL_INPUT_6_PIN)
#define DIGITAL_INPUT_6                  0x86
#endif
#if defined(DIGITAL_INPUT_7_PORT) && defined(DIGITAL_INPUT_7_PIN)
#define DIGITAL_INPUT_7                  0x87
#endif
#if defined(DIGITAL_INPUT_8_PORT) && defined(DIGITAL_INPUT_8_PIN)
#define DIGITAL_INPUT_8                  0x88
#endif

// Definição do ID de pinos de saída
#if defined(DIGITAL_OUTPUT_1_PORT) && defined(DIGITAL_OUTPUT_1_PIN)
#define DIGITAL_OUTPUT_1                 0x01
#endif
#if defined(DIGITAL_OUTPUT_2_PORT) && defined(DIGITAL_OUTPUT_2_PIN)
#define DIGITAL_OUTPUT_2                 0x02
#endif
#if defined(DIGITAL_OUTPUT_3_PORT) && defined(DIGITAL_OUTPUT_3_PIN)
#define DIGITAL_OUTPUT_3                 0x03
#endif
#if defined(DIGITAL_OUTPUT_4_PORT) && defined(DIGITAL_OUTPUT_4_PIN)
#define DIGITAL_OUTPUT_4                 0x04
#endif
#if defined(DIGITAL_OUTPUT_5_PORT) && defined(DIGITAL_OUTPUT_5_PIN)
#define DIGITAL_OUTPUT_5                 0x05
#endif
#if defined(DIGITAL_OUTPUT_6_PORT) && defined(DIGITAL_OUTPUT_6_PIN)
#define DIGITAL_OUTPUT_6                 0x06
#endif
#if defined(DIGITAL_OUTPUT_7_PORT) && defined(DIGITAL_OUTPUT_7_PIN)
#define DIGITAL_OUTPUT_7                 0x07
#endif
#if defined(DIGITAL_OUTPUT_8_PORT) && defined(DIGITAL_OUTPUT_8_PIN)
#define DIGITAL_OUTPUT_8                 0x08
#endif

//******************************************************************************
// Macros
//******************************************************************************
#define PASTE3(a,b,c)                    a##b##c
#define PASTE5(a,b,c,d,e)                a##b##c##d##e

#define _DigitalPortRead(a,b)            PASTE5(PORT,a,bits.R,a,b)
#define DigitalPortRead(a)               _DigitalPortRead(a##_PORT,a##_PIN)
#define _DigitalPortWrite(a,b)           PASTE5(LAT,a,bits.LAT,a,b)
#define DigitalPortWrite(a, b)           _DigitalPortWrite(a##_PORT,a##_PIN) = b

#define _DigitalPortInvert(a,b)          PASTE3(LAT,a,INV) = 1<<b
#define DigitalPortInvert(a)             _DigitalPortInvert(a##_PORT,a##_PIN)

#define GetDigitalPortID(a)              a

//******************************************************************************
// Funções
//******************************************************************************
extern void initDigitalPorts(void);
extern void setDigitalOutByID(uint8_t ID, int8_t value);
extern void invertDigitalOutByID(uint8_t ID);
extern int8_t readDigitalPortByID(uint8_t ID);

#endif
//******************************************************************************