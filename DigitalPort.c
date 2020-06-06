//******************************************************************************
//                                DIGITAL PORT
//
// Data:         05/06/2020
// Descrição:    Definições utilizadas para modularização de Portas Digitais
// Dependências: Nenhuma
//******************************************************************************
#include <xc.h>
#include "DigitalPort.h"

//******************************************************************************
// Definições espefícicas deste módulo
//******************************************************************************
#define _OUT                             0x00
#define _IN                              0x80

//******************************************************************************
// Macros espefícicas deste módulo
//******************************************************************************
#define _SetDigitalPortDirection(a,b)    PASTE5(TRIS,a,bits.TRIS,a,b)
#define SetDigitalPortDirection(a, b)    _SetDigitalPortDirection(a##_PORT,a##_PIN) = b
#define EnableInput(a)                   _SetDigitalPortDirection(a##_PORT,a##_PIN) = 1
#define EnableOutPut(a)                  _SetDigitalPortDirection(a##_PORT,a##_PIN) = 0

//******************************************************************************
// Funções
//******************************************************************************
void initDigitalPorts(void)
{
    #ifdef DIGITAL_INPUT_1
    EnableInput(DIGITAL_INPUT_1);
    #endif
    #ifdef DIGITAL_INPUT_2
    EnableInput(DIGITAL_INPUT_2);
    #endif
    #ifdef DIGITAL_INPUT_3
    EnableInput(DIGITAL_INPUT_3);
    #endif
    #ifdef DIGITAL_INPUT_4
    EnableInput(DIGITAL_INPUT_4);
    #endif
    #ifdef DIGITAL_INPUT_5
    EnableInput(DIGITAL_INPUT_5);
    #endif
    #ifdef DIGITAL_INPUT_6
    EnableInput(DIGITAL_INPUT_6);
    #endif
    #ifdef DIGITAL_INPUT_7
    EnableInput(DIGITAL_INPUT_7);
    #endif
    #ifdef DIGITAL_INPUT_8
    EnableInput(DIGITAL_INPUT_8);
    #endif

    #ifdef DIGITAL_OUTPUT_1
    EnableOutPut(DIGITAL_OUTPUT_1);
    #endif
    #ifdef DIGITAL_OUTPUT_2
    EnableOutPut(DIGITAL_OUTPUT_2);
    #endif
    #ifdef DIGITAL_OUTPUT_3
    EnableOutPut(DIGITAL_OUTPUT_3);
    #endif
    #ifdef DIGITAL_OUTPUT_4
    EnableOutPut(DIGITAL_OUTPUT_4);
    #endif
    #ifdef DIGITAL_OUTPUT_5
    EnableOutPut(DIGITAL_OUTPUT_5);
    #endif
    #ifdef DIGITAL_OUTPUT_6
    EnableOutPut(DIGITAL_OUTPUT_6);
    #endif
    #ifdef DIGITAL_OUTPUT_7
    EnableOutPut(DIGITAL_OUTPUT_7);
    #endif
    #ifdef DIGITAL_OUTPUT_8
    EnableOutPut(DIGITAL_OUTPUT_8);
    #endif
}

void setDigitalOutByID(uint8_t ID, int8_t value)
{
    switch(ID)
    {
        #ifdef DIGITAL_OUTPUT_1
        case DIGITAL_OUTPUT_1: DigitalPortWrite(DIGITAL_OUTPUT_1, value); break;
        #endif
        #ifdef DIGITAL_OUTPUT_2
        case DIGITAL_OUTPUT_2: DigitalPortWrite(DIGITAL_OUTPUT_2, value); break;
        #endif
        #ifdef DIGITAL_OUTPUT_3
        case DIGITAL_OUTPUT_3: DigitalPortWrite(DIGITAL_OUTPUT_3, value); break;
        #endif
        #ifdef DIGITAL_OUTPUT_4
        case DIGITAL_OUTPUT_4: DigitalPortWrite(DIGITAL_OUTPUT_4, value); break;
        #endif
        #ifdef DIGITAL_OUTPUT_5
        case DIGITAL_OUTPUT_5: DigitalPortWrite(DIGITAL_OUTPUT_5, value); break;
        #endif
        #ifdef DIGITAL_OUTPUT_6
        case DIGITAL_OUTPUT_6: DigitalPortWrite(DIGITAL_OUTPUT_6, value); break;
        #endif
        #ifdef DIGITAL_OUTPUT_7
        case DIGITAL_OUTPUT_7: DigitalPortWrite(DIGITAL_OUTPUT_7, value); break;
        #endif
        #ifdef DIGITAL_OUTPUT_8
        case DIGITAL_OUTPUT_8: DigitalPortWrite(DIGITAL_OUTPUT_8, value); break;
        #endif
        default: break;
    }
}

void invertDigitalOutByID(uint8_t ID)
{
    switch(ID)
    {
        #ifdef DIGITAL_OUTPUT_1
        case DIGITAL_OUTPUT_1: DigitalPortInvert(DIGITAL_OUTPUT_1); break;
        #endif
        #ifdef DIGITAL_OUTPUT_2
        case DIGITAL_OUTPUT_2: DigitalPortInvert(DIGITAL_OUTPUT_2); break;
        #endif
        #ifdef DIGITAL_OUTPUT_3
        case DIGITAL_OUTPUT_3: DigitalPortInvert(DIGITAL_OUTPUT_3); break;
        #endif
        #ifdef DIGITAL_OUTPUT_4
        case DIGITAL_OUTPUT_4: DigitalPortInvert(DIGITAL_OUTPUT_4); break;
        #endif
        #ifdef DIGITAL_OUTPUT_5
        case DIGITAL_OUTPUT_5: DigitalPortInvert(DIGITAL_OUTPUT_5); break;
        #endif
        #ifdef DIGITAL_OUTPUT_6
        case DIGITAL_OUTPUT_6: DigitalPortInvert(DIGITAL_OUTPUT_6); break;
        #endif
        #ifdef DIGITAL_OUTPUT_7
        case DIGITAL_OUTPUT_7: DigitalPortInvert(DIGITAL_OUTPUT_7); break;
        #endif
        #ifdef DIGITAL_OUTPUT_8
        case DIGITAL_OUTPUT_8: DigitalPortInvert(DIGITAL_OUTPUT_8); break;
        #endif
        default: break;
    }
}

int8_t readDigitalPortByID(uint8_t ID)
{
    switch(ID)
    {
        #ifdef DIGITAL_INPUT_1
        case DIGITAL_INPUT_1: return(DigitalPortRead(DIGITAL_INPUT_1));
        #endif
        #ifdef DIGITAL_INPUT_2
        case DIGITAL_INPUT_2: return(DigitalPortRead(DIGITAL_INPUT_2));
        #endif
        #ifdef DIGITAL_INPUT_3
        case DIGITAL_INPUT_3: return(DigitalPortRead(DIGITAL_INPUT_3));
        #endif
        #ifdef DIGITAL_INPUT_4
        case DIGITAL_INPUT_4: return(DigitalPortRead(DIGITAL_INPUT_4));
        #endif
        #ifdef DIGITAL_INPUT_5
        case DIGITAL_INPUT_5: return(DigitalPortRead(DIGITAL_INPUT_5));
        #endif
        #ifdef DIGITAL_INPUT_6
        case DIGITAL_INPUT_6: return(DigitalPortRead(DIGITAL_INPUT_6));
        #endif
        #ifdef DIGITAL_INPUT_7
        case DIGITAL_INPUT_7: return(DigitalPortRead(DIGITAL_INPUT_7));
        #endif
        #ifdef DIGITAL_INPUT_8
        case DIGITAL_INPUT_8: return(DigitalPortRead(DIGITAL_INPUT_8));
        #endif
        default: return(0);
    }
}
//******************************************************************************