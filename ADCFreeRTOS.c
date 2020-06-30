//******************************************************************************
//                                 ADC
//
// Data:       06/05/2020
// Descrição:  Utilização do ADC para amostragem de sinais
//******************************************************************************
#include <xc.h>
#include "FreeRTOS.h"
#include "semphr.h"
#include "ADCFreeRTOS.h"

#define ADC0_IPC_REGISTER               IPC14
#define ADC1_IPC_REGISTER               IPC15
#define ADC2_IPC_REGISTER               IPC15
#define ADC3_IPC_REGISTER               IPC15
#define ADC4_IPC_REGISTER               IPC15
#define ADC5_IPC_REGISTER               IPC16
#define ADC6_IPC_REGISTER               IPC16
#define ADC7_IPC_REGISTER               IPC16
#define ADC8_IPC_REGISTER               IPC16
#define ADC9_IPC_REGISTER               IPC17
#define ADC10_IPC_REGISTER              IPC17

#define ADC0_TRIG_SOURCE_REGISTER       ADCTRG1
#define ADC1_TRIG_SOURCE_REGISTER       ADCTRG1
#define ADC2_TRIG_SOURCE_REGISTER       ADCTRG1
#define ADC3_TRIG_SOURCE_REGISTER       ADCTRG1
#define ADC4_TRIG_SOURCE_REGISTER       ADCTRG2
#define ADC5_TRIG_SOURCE_REGISTER       ADCTRG2
#define ADC6_TRIG_SOURCE_REGISTER       ADCTRG2
#define ADC7_TRIG_SOURCE_REGISTER       ADCTRG2
#define ADC8_TRIG_SOURCE_REGISTER       ADCTRG3
#define ADC9_TRIG_SOURCE_REGISTER       ADCTRG3
#define ADC10_TRIG_SOURCE_REGISTER      ADCTRG3

#define ADC0_MODULE                     0
#define ADC1_MODULE                     1
#define ADC2_MODULE                     2
#define ADC3_MODULE                     3
#define ADC4_MODULE                     4
#define ADC5_MODULE                     5
#define ADC6_MODULE                     6
#define ADC7_MODULE                     7
#define ADC8_MODULE                     7
#define ADC9_MODULE                     7
#define ADC10_MODULE                    7

#if (DAQ_0_ADC == 1) || (DAQ_1_ADC == 1) || (DAQ_2_ADC == 1) || (DAQ_3_ADC == 1) || (DAQ_4_ADC == 1)
    #define ENABLE_ADC_1_IRQ
#endif

#if (DAQ_0_ADC == 2) || (DAQ_1_ADC == 2) || (DAQ_2_ADC == 2) || (DAQ_3_ADC == 2) || (DAQ_4_ADC == 2)
    #define ENABLE_ADC_2_IRQ
#endif

#if (DAQ_0_ADC == 3) || (DAQ_1_ADC == 3) || (DAQ_2_ADC == 3) || (DAQ_3_ADC == 3) || (DAQ_4_ADC == 3)
    #define ENABLE_ADC_3_IRQ
#endif

#if (DAQ_0_ADC == 4) || (DAQ_1_ADC == 4) || (DAQ_2_ADC == 4) || (DAQ_3_ADC == 4) || (DAQ_4_ADC == 4)
    #define ENABLE_ADC_4_IRQ
#endif

//******************************************************************************
// Macros para expansão de definições
//******************************************************************************
#define PASTE2(a,b)                     a##b
#define PASTE3(a,b,c)                   a##b##c
#define PASTE4(a,b,c,d)                 a##b##c##d
#define PASTE5(a,b,c,d,e)               a##b##c##d##e

//******************************************************************************
// Macros espefícicas deste módulo
//******************************************************************************
#define EnableADC(c)                    PASTE2(ANSELBbits.ANSB,c) = 1
#define SetDAQAnalogInput(c)            PASTE3(ADCTRGMODEbits.SH,c,ALT) = 0
#define SetDAQTimeAndClock(c)           {                                       \
                                            PASTE3(ADC,c,TIMEbits.ADCDIV) = 1;  \
                                            PASTE3(ADC,c,TIMEbits.SAMC) = 5;    \
                                            PASTE3(ADC,c,TIMEbits.SELRES) = 3;  \
                                        }
#define SetDAQInputMode(c)              {                                       \
                                            PASTE2(ADCIMCON1bits.SIGN,c) = 0;   \
                                            PASTE2(ADCIMCON1bits.DIFF,c) = 0;   \
                                        }
#define SetADCInputMode(c)              {                                       \
                                            PASTE2(ADCIMCON1bits.SIGN,c) = 0;   \
                                            PASTE2(ADCIMCON1bits.DIFF,c) = 0;   \
                                        }
#define _SetInterruptPriority(a,b)      PASTE4(a,bits.ADCD,b,IP)
#define SetInterruptPriority(a)         _SetInterruptPriority(ADC##a##_IPC_REGISTER,a)
#define _SetInterruptSubPriority(a,b)   PASTE4(a,bits.ADCD,b,IS)
#define SetInterruptSubPriority(a)      _SetInterruptSubPriority(ADC##a##_IPC_REGISTER,a)
#define SetDAQInterrupt(c)              {                                       \
                                            PASTE2(ADCGIRQEN1bits.AGIEN,c) = 1; \
                                            SetInterruptPriority(c) = 4;        \
                                            SetInterruptSubPriority(c) = 0;     \
                                        }
#define SetDAQInterruptEnable(c)        PASTE3(IEC1bits.ADCD,c,IE) = 1
#define ClearDAQInterruptEnable(c)      PASTE3(IEC1bits.ADCD,c,IE) = 0
#define _SetDAQTriggerSource(a,b)       PASTE3(a,bits.TRGSRC,b)
#define SetDAQTriggerSource(a)          _SetDAQTriggerSource(ADC##a##_TRIG_SOURCE_REGISTER,a) = 7
#define SetDAQTrigger(c)                {                                       \
                                            PASTE2(ADCTRGSNSbits.LVL,c) = 0;    \
                                            SetDAQTriggerSource(c);             \
                                        }
#define _SetADCTriggerSource(a,b)       PASTE3(a,bits.TRGSRC,b)
#define SetADCTriggerSource(a)          _SetADCTriggerSource(ADC##a##_TRIG_SOURCE_REGISTER,a) = 1
#define SetADCTrigger(c)                {                                       \
                                            PASTE2(ADCTRGSNSbits.LVL,c) = 0;    \
                                            SetADCTriggerSource(c);             \
                                        }

#define _EnableADCModuleClock(a)        PASTE2(ADCANCONbits.ANEN,a)
#define EnableADCModuleClock(a)         _EnableADCModuleClock(ADC##a##_MODULE)
#define EnableModuleClock(a)            EnableADCModuleClock(a) = 1

#define _WaitADCModuleReady(a)          PASTE2(ADCANCONbits.WKRDY,a)
#define WaitADCModuleReady(a)           _WaitADCModuleReady(ADC##a##_MODULE)
#define WaitModuleReady(a)              while(!WaitADCModuleReady(a))

#define _EnableADCModule(a)             PASTE2(ADCCON3bits.DIGEN,a)
#define EnableADCModule(a)              _EnableADCModule(ADC##a##_MODULE)
#define EnableModule(a)                 EnableADCModule(a) = 1

#define DefineDAQVars(a)                PASTE2(uint16_t *sampleCollectionPointer, a);          \
                                        PASTE2(uint16_t sampleLimit,a);                        \
                                        PASTE2(uint16_t samplePosition,a);                     \
                                        PASTE2(SemaphoreHandle_t sampleCompletionSemaphore,a);
#define DAQSampleCollectionPointer(a)   PASTE2(sampleCollectionPointer, a)
#define DAQLimit(a)                     PASTE2(sampleLimit, a)
#define DAQPosition(a)                  PASTE2(samplePosition, a)
#define DAQSemafore(a)                  PASTE2(sampleCompletionSemaphore, a)


//******************************************************************************
// VARIÁVEIS GLOBAIS
//******************************************************************************
#ifdef DAQ_1
DefineDAQVars(DAQ_1_ADC)
#endif
#ifdef DAQ_2
int16_t *sampleCollectionPointer2;
int16_t sampleLimit2, samplePosition2;
SemaphoreHandle_t sampleCompletionSemaphore2;
#endif
#ifdef DAQ_3
int16_t *sampleCollectionPointer3;
int16_t sampleLimit3, samplePosition3;
SemaphoreHandle_t sampleCompletionSemaphore3;
#endif
#ifdef DAQ_4
int16_t *sampleCollectionPointer4;
int16_t sampleLimit4, samplePosition4;
SemaphoreHandle_t sampleCompletionSemaphore4;
#endif


//******************************************************************************
// Protótipo de funções do módulo
//******************************************************************************
void initADC(void);
void dataAcquire(uint8_t DAQ, uint16_t *sampleCollection, uint16_t sizeOfCollection);
uint16_t getAdcValue(int8_t ADC);

//******************************************************************************
// Funções
//******************************************************************************
void initADC(void)
{
    ADCANCON = 0x00000000;  // Para escrever as configurações, desabilitar os conversores
    ADC0CFG = DEVADC0;
    ADC1CFG = DEVADC1;
    ADC2CFG = DEVADC2;
    ADC3CFG = DEVADC3;
    ADC4CFG = DEVADC4;
    ADC7CFG = DEVADC7;

    ADCCON1 = 0x00000000;
    ADCCON1bits.SELRES = 0x03;
    ADCCON2 = 0x00000000;
    ADCCON2bits.ADCDIV = 0x01;
    ADCCON2bits.CVDCPL = 0x01;
    ADCCON2bits.SAMC = 0x40;
    
    #ifdef DAQ_1
        EnableADC(DAQ_1_ADC);
    #endif
    #ifdef DAQ_2
        EnableADC(DAQ_2_ADC);
    #endif
    #ifdef DAQ_3
        EnableADC(DAQ_3_ADC);
    #endif
    #ifdef DAQ_4
        EnableADC(DAQ_4_ADC);
    #endif

    #ifdef ANALOG_INPUT_1_ADC
        EnableADC(ANALOG_INPUT_1_ADC);
    #endif
    
    ADCANCONbits.WKUPCLKCNT = 9; // Wakeup exponent = 512 * TADx
    ADCCON3 = 0x00000000;
    
    /* Clock setting */
    ADCCON3bits.ADCSEL = 0;      // Select input clock source
    ADCCON3bits.CONCLKDIV = 0;   // Control clock frequency equal to input clock
    ADCCON3bits.VREFSEL = 0;     // Select AVDD and AVSS as reference source
    
    #ifdef DAQ_1
        SetDAQTimeAndClock(DAQ_1_ADC);
        SetDAQAnalogInput(DAQ_1_ADC);
        SetDAQInputMode(DAQ_1_ADC);
    #endif
    #ifdef DAQ_2
        SetDAQTimeAndClock(DAQ_2_ADC);
        SetDAQAnalogInput(DAQ_2_ADC);
        SetDAQInputMode(DAQ_2_ADC);
    #endif
    #ifdef DAQ_3
        SetDAQTimeAndClock(DAQ_3_ADC);
        SetDAQAnalogInput(DAQ_3_ADC);
        SetDAQInputMode(DAQ_3_ADC);
    #endif
    #ifdef DAQ_4
        SetDAQTimeAndClock(DAQ_4_ADC);
        SetDAQAnalogInput(DAQ_4_ADC);
        SetDAQInputMode(DAQ_4_ADC);
    #endif
    
    /* Select ADC Class 2 input mode */
    #ifdef ANALOG_INPUT_1
        SetADCInputMode(ANALOG_INPUT_1_ADC);
    #endif

    /* Configure ADCGIRQENx */
    ADCGIRQEN1 = 0;
    ADCGIRQEN2 = 0;
    
    #ifdef DAQ_1_ADC
        SetDAQInterrupt(DAQ_1_ADC);
    #endif
    #ifdef DAQ_2
        SetDAQInterrupt(DAQ_2_ADC);
    #endif
    #ifdef DAQ_3
        SetDAQInterrupt(DAQ_3_ADC);
    #endif
    #ifdef DAQ_4
        SetDAQInterrupt(DAQ_4_ADC);
    #endif
    
    /* Configure ADCCSSx */
    ADCCSS1 = 0;                 // No scanning is used
    ADCCSS2 = 0;
    
    /* Configure ADCCMPCONx */
    ADCCMPCON1 = 0;              // No digital comparators are used. Setting the ADCCMPCONx
    ADCCMPCON2 = 0;              // register to '0' ensures that the comparator is disabled.
    ADCCMPCON3 = 0;              // Other registers are ?don't care?.
    ADCCMPCON4 = 0;
    ADCCMPCON5 = 0;
    ADCCMPCON6 = 0;
    
    /* Configure ADCFLTRx */
    ADCFLTR1 = 0;                // No oversampling filters are used.
    ADCFLTR2 = 0;
    ADCFLTR3 = 0;
    ADCFLTR4 = 0;
    ADCFLTR5 = 0;
    ADCFLTR6 = 0;
    
    /* Set up the trigger sources */
    #ifdef DAQ_1
        SetDAQTrigger(DAQ_1_ADC);
    #endif
    #ifdef DAQ_2
        SetDAQTrigger(DAQ_2_ADC);
    #endif
    #ifdef DAQ_3
        SetDAQTrigger(DAQ_3_ADC);
    #endif
    #ifdef DAQ_4
        SetDAQTrigger(DAQ_4_ADC);
    #endif

    #ifdef ANALOG_INPUT_1_ADC
        SetADCTrigger(ANALOG_INPUT_1_ADC);
    #endif

    /* Early interrupt */
    ADCEIEN1 = 0;                // No early interrupt
    ADCEIEN2 = 0;
    ADCCON2bits.ADCEIOVR = 0;    // Override early interrupt
    
    /* Turn the ADC on */
    ADCCON1bits.ON = 1;
    
    /* Wait for voltage reference to be stable */
    while(!ADCCON2bits.BGVRRDY); // Wait until the reference voltage is ready
    while(ADCCON2bits.REFFLT);   // Wait if there is a fault with the reference voltage
    
    /* Enable clock to analog circuit */
    #ifdef DAQ_1
        EnableModuleClock(DAQ_1_ADC);
        WaitModuleReady(DAQ_1_ADC);
        EnableModule(DAQ_1_ADC);
    #endif
    #ifdef DAQ_2
        EnableModuleClock(DAQ_2_ADC);
        WaitModuleReady(DAQ_2_ADC);
        EnableModule(DAQ_2_ADC);
        SetDAQInterruptEnable(DAQ_2_ADC);
    #endif
    #ifdef DAQ_3
        EnableModuleClock(DAQ_3_ADC);
        WaitModuleReady(DAQ_3_ADC);
        EnableModule(DAQ_3_ADC);
        SetDAQInterruptEnable(DAQ_3_ADC);
    #endif
    #ifdef DAQ_4
        EnableModuleClock(DAQ_4_ADC);
        WaitModuleReady(DAQ_4_ADC);
        EnableModule(DAQ_4_ADC);
        SetDAQInterruptEnable(DAQ_4_ADC);
    #endif

    #ifdef ANALOG_INPUT_1
        EnableModuleClock(ANALOG_INPUT_1_ADC);
        WaitModuleReady(ANALOG_INPUT_1_ADC);
        EnableModule(ANALOG_INPUT_1_ADC);
    #endif

    T5CON = 0x00000000;
    PR5 = 0x00000190;
    
    #ifdef DAQ_1
        DAQSemafore(DAQ_1_ADC) = xSemaphoreCreateBinary();
    #endif
    #ifdef DAQ_2
        sampleCompletionSemaphore2 = xSemaphoreCreateBinary();
    #endif
    #ifdef DAQ_3
        sampleCompletionSemaphore3 = xSemaphoreCreateBinary();
    #endif
    #ifdef DAQ_4
        sampleCompletionSemaphore4 = xSemaphoreCreateBinary();
    #endif
}

void dataAcquire(uint8_t DAQ, uint16_t *sampleCollection, uint16_t sizeOfCollection)
{
    if(T5CONbits.ON == 0)
        TMR5 = 0x00000000;
    switch(DAQ)
    {
        #ifdef DAQ_1
        case DAQ_1:
            DAQSampleCollectionPointer(DAQ_1_ADC) = sampleCollection;
            DAQLimit(DAQ_1_ADC) = sizeOfCollection;
            DAQPosition(DAQ_1_ADC) = 0;
            SetDAQInterruptEnable(DAQ_1_ADC);
            T5CONbits.ON = 1;
            xSemaphoreTake(DAQSemafore(DAQ_1_ADC), portMAX_DELAY);
            break;
        #endif
        #ifdef DAQ_2
        case DAQ_2:
            sampleCollectionPointer2 = sampleCollection;
            sampleLimit2 = sizeOfCollection;
            samplePosition2 = 0;
            T5CONbits.ON = 1;
            xSemaphoreTake(sampleCompletionSemaphore2, portMAX_DELAY);
            break;
        #endif
        #ifdef DAQ_3
        case DAQ_3:
            sampleCollectionPointer3 = sampleCollection;
            sampleLimit3 = sizeOfCollection;
            samplePosition3 = 0;
            T5CONbits.ON = 1;
            xSemaphoreTake(sampleCompletionSemaphore3, portMAX_DELAY);
            break;
        #endif
        #ifdef DAQ_4
        case DAQ_4:
            sampleCollectionPointer4 = sampleCollection;
            sampleLimit4 = sizeOfCollection;
            samplePosition4 = 0;
            T5CONbits.ON = 1;
            xSemaphoreTake(sampleCompletionSemaphore4, portMAX_DELAY);
            break;
        #endif
    }
}

uint16_t getAdcValue(int8_t ADC)
{
    int16_t result;
    
    /* Trigger a conversion */
    ADCCON3bits.GSWTRG = 1;
    
    /* Wait the conversions to complete */
    while (ADCDSTAT1bits.ARDY10 == 0);
    
    result = ADCDATA10;
}

//******************************************************************************
// ADC Interrupt Handler
//******************************************************************************
void __attribute__((interrupt(IPL0AUTO), vector(_ADC_DATA1_VECTOR))) vADC1InterruptWrapper( void );

#ifdef ENABLE_ADC_1_IRQ
void vADC1InterruptHandler(void)
{
    BaseType_t xHigherPriorityTaskWoken = pdFALSE;
    int16_t analogData;

    if(IFS1bits.ADCD1IF)
    {
        analogData = ADCDATA1;
        if(samplePosition1 < sampleLimit1)
        {
            sampleCollectionPointer1[samplePosition1++] = analogData;
        }
        if(samplePosition1 >= sampleLimit1)
        {
            T5CON = 0x00000000;
            IFS1bits.ADCD1IF = 0;
            IFS1bits.ADCIF = 0;
            xSemaphoreGiveFromISR(sampleCompletionSemaphore1, &xHigherPriorityTaskWoken);
        }
        IFS1bits.ADCD1IF = 0;
    }
    portEND_SWITCHING_ISR(xHigherPriorityTaskWoken);
    IFS1bits.ADCIF = 0;
}
#else
void vADC1InterruptHandler(void){}
#endif

void __attribute__((interrupt(IPL0AUTO), vector(_ADC_DATA2_VECTOR))) vADC2InterruptWrapper( void );

#ifdef ENABLE_ADC_2_IRQ
void vADC2InterruptHandler(void)
{
    BaseType_t xHigherPriorityTaskWoken = pdFALSE;
    int16_t analogData;

    if(IFS1bits.ADCD2IF)
    {
        analogData = ADCDATA2;
        if(samplePosition2 < sampleLimit2)
        {
            sampleCollectionPointer2[samplePosition2++] = analogData;
        }
        if(samplePosition2 >= sampleLimit2)
        {
            T5CON = 0x00000000;
            IFS1bits.ADCD2IF = 0;
            IFS1bits.ADCIF = 0;
            xSemaphoreGiveFromISR(sampleCompletionSemaphore2, &xHigherPriorityTaskWoken);
        }
        IFS1bits.ADCD2IF = 0;
    }
    portEND_SWITCHING_ISR(xHigherPriorityTaskWoken);
    IFS1bits.ADCIF = 0;
}
#else
void vADC2InterruptHandler(void){}
#endif

void __attribute__((interrupt(IPL0AUTO), vector(_ADC_DATA3_VECTOR))) vADC3InterruptWrapper( void );

#ifdef ENABLE_ADC_3_IRQ
void vADC3InterruptHandler(void)
{
    BaseType_t xHigherPriorityTaskWoken = pdFALSE;
    int16_t analogData;

    if(IFS1bits.ADCD3IF)
    {
        analogData = ADCDATA3;
        if(samplePosition3 < sampleLimit3)
        {
            sampleCollectionPointer3[samplePosition3++] = analogData;
        }
        if(samplePosition3 >= sampleLimit3)
        {
            T5CON = 0x00000000;
            IFS1bits.ADCD3IF = 0;
            IFS1bits.ADCIF = 0;
            xSemaphoreGiveFromISR(sampleCompletionSemaphore3, &xHigherPriorityTaskWoken);
        }
        IFS1bits.ADCD3IF = 0;
    }
    portEND_SWITCHING_ISR(xHigherPriorityTaskWoken);
    IFS1bits.ADCIF = 0;    
}
#else
void vADC3InterruptHandler(void) {}
#endif

void __attribute__((interrupt(IPL0AUTO), vector(_ADC_DATA4_VECTOR))) vADC4InterruptWrapper( void );

#ifdef ENABLE_ADC_4_IRQ
void vADC4InterruptHandler(void)
{
    BaseType_t xHigherPriorityTaskWoken = pdFALSE;
    int16_t analogData;

    if(IFS1bits.ADCD4IF)
    {
        analogData = ADCDATA4;
        if(samplePosition4 < sampleLimit4)
        {
            sampleCollectionPointer4[samplePosition4++] = analogData;
        }
        if(samplePosition4 >= sampleLimit4)
        {
            T5CON = 0x00000000;
            IFS1bits.ADCD4IF = 0;
            IFS1bits.ADCIF = 0;
            xSemaphoreGiveFromISR(sampleCompletionSemaphore4, &xHigherPriorityTaskWoken);
        }
        IFS1bits.ADCD4IF = 0;
    }
    portEND_SWITCHING_ISR(xHigherPriorityTaskWoken);
    IFS1bits.ADCIF = 0;
}
#else
void vADC4InterruptHandler(void){}
#endif
//******************************************************************************