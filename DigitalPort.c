//******************************************************************************
//                                DIGITAL PORT
//
// Data:         05/06/2020
// Descrição:    Definições utilizadas para modularização de Portas Digitais
// Dependências: Nenhuma
//******************************************************************************
#include <xc.h>
#include "FreeRTOS.h"
#include "semphr.h"
#include "DigitalPort.h"

//******************************************************************************
// Definições espefícicas deste módulo
//******************************************************************************
#define _OUT                             0x00
#define _IN                              0x80

#define PORTA_CHANGE_INTERRUPT_REG       IEC3
#define PORTA_CHANGE_INTERRUPT_BIT       22
#define PORTA_CHANGE_PRIORITY_REG        IPC29
#define PORTB_CHANGE_INTERRUPT_REG       IEC3
#define PORTB_CHANGE_INTERRUPT_BIT       23
#define PORTB_CHANGE_PRIORITY_REG        IPC29
#define PORTC_CHANGE_INTERRUPT_REG       IEC3
#define PORTC_CHANGE_INTERRUPT_BIT       24
#define PORTC_CHANGE_PRIORITY_REG        IPC30
#define PORTD_CHANGE_INTERRUPT_REG       IEC3
#define PORTD_CHANGE_INTERRUPT_BIT       25
#define PORTD_CHANGE_PRIORITY_REG        IPC30
#define PORTE_CHANGE_INTERRUPT_REG       IEC3
#define PORTE_CHANGE_INTERRUPT_BIT       26
#define PORTE_CHANGE_PRIORITY_REG        IPC30
#define PORTF_CHANGE_INTERRUPT_REG       IEC3
#define PORTF_CHANGE_INTERRUPT_BIT       27
#define PORTF_CHANGE_PRIORITY_REG        IPC30
#define PORTG_CHANGE_INTERRUPT_REG       IEC3
#define PORTG_CHANGE_INTERRUPT_BIT       28
#define PORTG_CHANGE_PRIORITY_REG        IPC31

//******************************************************************************
// Macros espefícicas deste módulo
//******************************************************************************
#define _SetDigitalPortDirection(a,b)    PASTE5(TRIS,a,bits.TRIS,a,b)
#define SetDigitalPortDirection(a, b)    _SetDigitalPortDirection(a##_PORT,a##_PIN) = b
#define _GetSetRegister(a)               PASTE2(a,SET)
#define GetSetRegister(a,b,c)            _GetSetRegister(a##b##c)

#define _SetOnChangePriorityBits(a,b)    PASTE4(a,bits.CN,b,IP)
#define _SetOnChangePriority(a,b,c)      _SetOnChangePriorityBits(a##b##c,b)
#define SetOnChangePriority(a)           _SetOnChangePriority(PORT,a,_CHANGE_PRIORITY_REG) = 1

#define _SetOnChangeSubPriorityBits(a,b) PASTE4(a,bits.CN,b,IS)
#define _SetOnChangeSubPriority(a,b,c)   _SetOnChangeSubPriorityBits(a##b##c,b)
#define SetOnChangeSubPriority(a)        _SetOnChangeSubPriority(PORT,a,_CHANGE_PRIORITY_REG) = 1

#define SetInterruptOnChange(a)          GetSetRegister(PORT,a,_CHANGE_INTERRUPT_REG) = 1<<PASTE3(PORT,a,_CHANGE_INTERRUPT_BIT)
#define ChangeNoticeControl(a)           PASTE3(CNCON,a,SET)
#define ChangeNoticeEnable(a)            PASTE3(CNEN,a,SET)
#define EnableInterruptOnChange(a)       {                                               \
                                           ChangeNoticeEnable(a##_PORT) = 1<<a##_PIN;    \
                                           ChangeNoticeControl(a##_PORT) = 0x8000;       \
                                           SetOnChangePriority(a##_PORT);                \
                                           SetOnChangeSubPriority(a##_PORT);             \
                                           SetInterruptOnChange(a##_PORT);               \
                                         }

#define NoticePullUpEnable(a)            PASTE3(CNPU,a,SET)
#define NoticePullDownEnable(a)          PASTE3(CNPD,a,SET)
#define NoticePullUpDisable(a)           PASTE3(CNPU,a,CLR)
#define NoticePullDownDisable(a)         PASTE3(CNPD,a,CLR)
#define EnablePullUp(a)                  {                                               \
                                           NoticePullDownDisable(a##_PORT) = 1<<a##_PIN; \
                                           NoticePullUpEnable(a##_PORT) = 1<<a##_PIN;    \
                                         }

#define EnablePullDown(a)                {                                               \
                                           NoticePullUpDisable(a##_PORT) = 1<<a##_PIN;   \
                                           NoticePullDownEnable(a##_PORT) = 1<<a##_PIN;  \
                                         }

#define EnableInput(a)                   _SetDigitalPortDirection(a##_PORT,a##_PIN) = 1
#define EnableOutPut(a)                  _SetDigitalPortDirection(a##_PORT,a##_PIN) = 0

//******************************************************************************
// Variáveis Globais
//******************************************************************************
SemaphoreHandle_t inputOnChangeSemaphore;

//******************************************************************************
// Funções
//******************************************************************************
void initDigitalPorts(void)
{
    #ifdef DIGITAL_INPUT_1
        EnableInput(DIGITAL_INPUT_1);
        #ifdef DIGITAL_INPUT_1_CHANGE_NOTIFICATION_EN
            EnableInterruptOnChange(DIGITAL_INPUT_1);
        #endif
        #ifdef DIGITAL_INPUT_1_PULLDOWN_EN
            EnablePullDown(DIGITAL_INPUT_1);
        #endif
        #ifdef DIGITAL_INPUT_1_PULLUP_EN
            EnablePullUp(DIGITAL_INPUT_1);
        #endif
    #endif
    #ifdef DIGITAL_INPUT_2
        EnableInput(DIGITAL_INPUT_2);
        #ifdef DIGITAL_INPUT_2_CHANGE_NOTIFICATION_EN
            EnableInterruptOnChange(DIGITAL_INPUT_2);
        #endif
        #ifdef DIGITAL_INPUT_2_PULLDOWN_EN
            EnablePullDown(DIGITAL_INPUT_2);
        #endif
        #ifdef DIGITAL_INPUT_2_PULLUP_EN
            EnablePullUp(DIGITAL_INPUT_2);
        #endif
    #endif
    #ifdef DIGITAL_INPUT_3
        EnableInput(DIGITAL_INPUT_3);
        #ifdef DIGITAL_INPUT_3_CHANGE_NOTIFICATION_EN
            EnableInterruptOnChange(DIGITAL_INPUT_3);
        #endif
        #ifdef DIGITAL_INPUT_3_PULLDOWN_EN
            EnablePullDown(DIGITAL_INPUT_3);
        #endif
        #ifdef DIGITAL_INPUT_3_PULLUP_EN
            EnablePullUp(DIGITAL_INPUT_3);
        #endif
    #endif
    #ifdef DIGITAL_INPUT_4
        EnableInput(DIGITAL_INPUT_4);
        #ifdef DIGITAL_INPUT_4_CHANGE_NOTIFICATION_EN
            EnableInterruptOnChange(DIGITAL_INPUT_4);
        #endif
        #ifdef DIGITAL_INPUT_4_PULLDOWN_EN
            EnablePullDown(DIGITAL_INPUT_4);
        #endif
        #ifdef DIGITAL_INPUT_4_PULLUP_EN
            EnablePullUp(DIGITAL_INPUT_4);
        #endif
    #endif
    #ifdef DIGITAL_INPUT_5
        EnableInput(DIGITAL_INPUT_5);
        #ifdef DIGITAL_INPUT_5_CHANGE_NOTIFICATION_EN
            EnableInterruptOnChange(DIGITAL_INPUT_5);
        #endif
        #ifdef DIGITAL_INPUT_5_PULLDOWN_EN
            EnablePullDown(DIGITAL_INPUT_5);
        #endif
        #ifdef DIGITAL_INPUT_5_PULLUP_EN
            EnablePullUp(DIGITAL_INPUT_5);
        #endif
    #endif
    #ifdef DIGITAL_INPUT_6
        EnableInput(DIGITAL_INPUT_6);
        #ifdef DIGITAL_INPUT_6_CHANGE_NOTIFICATION_EN
            EnableInterruptOnChange(DIGITAL_INPUT_6);
        #endif
        #ifdef DIGITAL_INPUT_6_PULLDOWN_EN
            EnablePullDown(DIGITAL_INPUT_6);
        #endif
        #ifdef DIGITAL_INPUT_6_PULLUP_EN
            EnablePullUp(DIGITAL_INPUT_6);
        #endif
    #endif
    #ifdef DIGITAL_INPUT_7
        EnableInput(DIGITAL_INPUT_7);
        #ifdef DIGITAL_INPUT_7_CHANGE_NOTIFICATION_EN
            EnableInterruptOnChange(DIGITAL_INPUT_7);
        #endif
        #ifdef DIGITAL_INPUT_7_PULLDOWN_EN
            EnablePullDown(DIGITAL_INPUT_7);
        #endif
        #ifdef DIGITAL_INPUT_7_PULLUP_EN
            EnablePullUp(DIGITAL_INPUT_7);
        #endif
    #endif
    #ifdef DIGITAL_INPUT_8
        EnableInput(DIGITAL_INPUT_8);
        #ifdef DIGITAL_INPUT_8_CHANGE_NOTIFICATION_EN
            EnableInterruptOnChange(DIGITAL_INPUT_8);
        #endif
        #ifdef DIGITAL_INPUT_8_PULLDOWN_EN
            EnablePullDown(DIGITAL_INPUT_8);
        #endif
        #ifdef DIGITAL_INPUT_8_PULLUP_EN
            EnablePullUp(DIGITAL_INPUT_8);
        #endif
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

    inputOnChangeSemaphore = xSemaphoreCreateBinary();
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

void waitInputOnChangeEvent(void)
{
    xSemaphoreTake(inputOnChangeSemaphore, portMAX_DELAY);
}

//******************************************************************************
// Interrupções
//******************************************************************************
void __attribute__((interrupt(IPL0AUTO), vector(_CHANGE_NOTICE_A_VECTOR))) vChangeNoticeAInterruptWrapper( void );

void vChangeNoticeAInterruptHandler(void)
{
    BaseType_t xHigherPriorityTaskWoken = pdFALSE;
    int32_t status;
    
    status = PORTA;
    IFS3bits.CNAIF = 0;
    xSemaphoreGiveFromISR(inputOnChangeSemaphore, &xHigherPriorityTaskWoken);
    portEND_SWITCHING_ISR(xHigherPriorityTaskWoken);
}

void __attribute__((interrupt(IPL0AUTO), vector(_CHANGE_NOTICE_B_VECTOR))) vChangeNoticeBInterruptWrapper( void );

void vChangeNoticeBInterruptHandler(void)
{
    BaseType_t xHigherPriorityTaskWoken = pdFALSE;
    int32_t status;
    
    status = PORTB;
    IFS3bits.CNBIF = 0;
    xSemaphoreGiveFromISR(inputOnChangeSemaphore, &xHigherPriorityTaskWoken);
    portEND_SWITCHING_ISR(xHigherPriorityTaskWoken);
}

void __attribute__((interrupt(IPL0AUTO), vector(_CHANGE_NOTICE_C_VECTOR))) vChangeNoticeCInterruptWrapper( void );

void vChangeNoticeCInterruptHandler(void)
{
    BaseType_t xHigherPriorityTaskWoken = pdFALSE;
    int32_t status;
    
    status = PORTC;
    IFS3bits.CNCIF = 0;
    xSemaphoreGiveFromISR(inputOnChangeSemaphore, &xHigherPriorityTaskWoken);
    portEND_SWITCHING_ISR(xHigherPriorityTaskWoken);
}

void __attribute__((interrupt(IPL0AUTO), vector(_CHANGE_NOTICE_D_VECTOR))) vChangeNoticeDInterruptWrapper( void );

void vChangeNoticeDInterruptHandler(void)
{
    BaseType_t xHigherPriorityTaskWoken = pdFALSE;
    int32_t status;
    
    status = PORTD;
    IFS3bits.CNDIF = 0;
    xSemaphoreGiveFromISR(inputOnChangeSemaphore, &xHigherPriorityTaskWoken);
    portEND_SWITCHING_ISR(xHigherPriorityTaskWoken);
}

void __attribute__((interrupt(IPL0AUTO), vector(_CHANGE_NOTICE_E_VECTOR))) vChangeNoticeEInterruptWrapper( void );

void vChangeNoticeEInterruptHandler(void)
{
    BaseType_t xHigherPriorityTaskWoken = pdFALSE;
    int32_t status;
    
    status = PORTE;
    IFS3bits.CNEIF = 0;
    xSemaphoreGiveFromISR(inputOnChangeSemaphore, &xHigherPriorityTaskWoken);
    portEND_SWITCHING_ISR(xHigherPriorityTaskWoken);
}

void __attribute__((interrupt(IPL0AUTO), vector(_CHANGE_NOTICE_F_VECTOR))) vChangeNoticeFInterruptWrapper( void );

void vChangeNoticeFInterruptHandler(void)
{
    BaseType_t xHigherPriorityTaskWoken = pdFALSE;
    int32_t status;
    
    status = PORTF;
    IFS3bits.CNFIF = 0;
    xSemaphoreGiveFromISR(inputOnChangeSemaphore, &xHigherPriorityTaskWoken);
    portEND_SWITCHING_ISR(xHigherPriorityTaskWoken);
}

void __attribute__((interrupt(IPL0AUTO), vector(_CHANGE_NOTICE_G_VECTOR))) vChangeNoticeGInterruptWrapper( void );

void vChangeNoticeGInterruptHandler(void)
{
    BaseType_t xHigherPriorityTaskWoken = pdFALSE;
    int32_t status;
    
    status = PORTG;
    IFS3bits.CNGIF = 0;
    xSemaphoreGiveFromISR(inputOnChangeSemaphore, &xHigherPriorityTaskWoken);
    portEND_SWITCHING_ISR(xHigherPriorityTaskWoken);
}

//******************************************************************************