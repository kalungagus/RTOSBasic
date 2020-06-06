//******************************************************************************
//                                 ADC
//
// Data:       06/05/2020
// Descrição:  Utilização do ADC para amostragem de sinais
//******************************************************************************
#include <xc.h>
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"
#include "semphr.h"

//******************************************************************************
// VARIÁVEIS GLOBAIS
//******************************************************************************
int16_t *sampleCollectionPointer;
int16_t sampleLimit, samplePosition;
SemaphoreHandle_t sampleCompletionSemaphore;

//******************************************************************************
// Protótipo de funções do módulo
//******************************************************************************
void initADC(void);
void getSamplesFromSignal(int16_t *sampleCollection, int16_t sizeOfCollection);
int16_t getAdcValue(void);

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
    
    ANSELBbits.ANSB2 = 1;
    //ANSELBbits.ANSB3 = 1;
    ANSELBbits.ANSB10 = 1;
    
    ADCANCONbits.WKUPCLKCNT = 9; // Wakeup exponent = 512 * TADx
    ADCCON3 = 0x00000000;
    
    /* Clock setting */
    ADCCON3bits.ADCSEL = 0;      // Select input clock source
    ADCCON3bits.CONCLKDIV = 0;   // Control clock frequency equal to input clock
    ADCCON3bits.VREFSEL = 0;     // Select AVDD and AVSS as reference source
    
    /* Select ADC sample time and conversion clock */
    ADC2TIMEbits.ADCDIV = 1;     // ADC2 clock frequency is half of control clock = TAD0
    ADC2TIMEbits.SAMC = 5;       // ADC2 sampling time = 5 * TAD0
    ADC2TIMEbits.SELRES = 3;     // ADC2 resolution is 12 bits
    //ADC3TIMEbits.ADCDIV = 1;     // ADC3 clock frequency is half of control clock = TAD1
    //ADC3TIMEbits.SAMC = 5;       // ADC3 sampling time = 5 * TAD1
    //ADC3TIMEbits.SELRES = 3;     // ADC3 resolution is 12 bits
    
    /* Select analog input for ADC modules, no presync trigger, not sync sampling */
    ADCTRGMODEbits.SH2ALT = 0;   // ADC2 = AN2
    //ADCTRGMODEbits.SH3ALT = 0;   // ADC3 = AN3
    
    /* Select ADC Class 1 input mode */
    ADCIMCON1bits.SIGN2 = 0;     // unsigned data format
    ADCIMCON1bits.DIFF2 = 0;     // Single ended mode
    //ADCIMCON1bits.SIGN3 = 0;     // unsigned data format
    //ADCIMCON1bits.DIFF3 = 0;     // Single ended mode
    
    /* Select ADC Class 2 input mode */
    ADCIMCON1bits.SIGN10 = 0; // unsigned data format
    ADCIMCON1bits.DIFF10 = 0; // Single ended mode

    /* Configure ADCGIRQENx */
    ADCGIRQEN1 = 0;
    ADCGIRQEN2 = 0;
    ADCGIRQEN1bits.AGIEN2 = 1;
    //ADCGIRQEN1bits.AGIEN3 = 1;
    IPC15bits.ADCD2IP = 4;
    IPC15bits.ADCD2IS = 0;
    //IPC15bits.ADCD3IP = 4;
    //IPC15bits.ADCD3IS = 0;
    
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
    ADCTRGSNSbits.LVL2 = 0;      // Edge trigger
    //ADCTRGSNSbits.LVL3 = 0;      // Edge trigger
    ADCTRGSNSbits.LVL10 = 0;     // Edge trigger
    ADCTRG1bits.TRGSRC2 = 7;     // Set AN2 to trigger from timer5.
    //ADCTRG1bits.TRGSRC3 = 5;     // Set AN3 to trigger from timer5.
    ADCTRG3bits.TRGSRC10 = 1;    // Set AN10 to trigger from software

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
    ADCANCONbits.ANEN2 = 1; // Enable the clock to analog bias
    ADCANCONbits.ANEN7 = 1; // Enable the clock to analog bias

    /* Wait for ADC to be ready */
    while(!ADCANCONbits.WKRDY2); // Wait until ADC2 is ready
    while(!ADCANCONbits.WKRDY7); // Wait until ADC7 is ready

    /* Enable the ADC module */
    ADCCON3bits.DIGEN2 = 1; // Enable ADC2
    ADCCON3bits.DIGEN7 = 1; // Enable ADC7
    
    IEC1bits.ADCD2IE = 1;
    
    T5CON = 0x00000000;
    PR5 = 0x00000190;
    
    sampleCompletionSemaphore = xSemaphoreCreateBinary();
}

void getSamplesFromSignal(int16_t *sampleCollection, int16_t sizeOfCollection)
{
    sampleCollectionPointer = sampleCollection;
    sampleLimit = sizeOfCollection;
    samplePosition = 0;

    TMR5 = 0x00000000;
    T5CONbits.ON = 1;
    xSemaphoreTake(sampleCompletionSemaphore, portMAX_DELAY);
}

int16_t getAdcValue(void)
{
    int16_t result;
    
    /* Trigger a conversion */
    ADCCON3bits.GSWTRG = 1;
    
    /* Wait the conversions to complete */
    while (ADCDSTAT1bits.ARDY10 == 0);
    
    result = ADCDATA10;
}

//******************************************************************************
// USB Interrupt Handler
//******************************************************************************
void __attribute__((interrupt(IPL0AUTO), vector(_ADC_DATA2_VECTOR))) vADC2InterruptWrapper( void );

void vADC2InterruptHandler(void)
{
    BaseType_t xHigherPriorityTaskWoken = pdFALSE;
    int16_t analogData;

    if(IFS1bits.ADCD2IF)
    {
        analogData = ADCDATA2;
        if(samplePosition < sampleLimit)
        {
            sampleCollectionPointer[samplePosition++] = analogData;
        }
        if(samplePosition >= sampleLimit)
        {
            T5CON = 0x00000000;
            IFS1bits.ADCD2IF = 0;
            IFS1bits.ADCIF = 0;
            xSemaphoreGiveFromISR(sampleCompletionSemaphore, &xHigherPriorityTaskWoken);
        }
        IFS1bits.ADCD2IF = 0;
    }
    portEND_SWITCHING_ISR(xHigherPriorityTaskWoken);
    IFS1bits.ADCIF = 0;
}

void __attribute__((interrupt(IPL0AUTO), vector(_ADC_DATA3_VECTOR))) vADC3InterruptWrapper( void );

void vADC3InterruptHandler(void)
{
    BaseType_t xHigherPriorityTaskWoken = pdFALSE;
    int16_t analogData;

    if(IFS1bits.ADCD3IF)
    {
        analogData = ADCDATA3;
        if(samplePosition < sampleLimit)
        {
            sampleCollectionPointer[samplePosition++] = analogData;
        }
        if(samplePosition >= sampleLimit)
        {
            T5CON = 0x00000000;
            IFS1bits.ADCD3IF = 0;
            IFS1bits.ADCIF = 0;
            xSemaphoreGiveFromISR(sampleCompletionSemaphore, &xHigherPriorityTaskWoken);
        }
        IFS1bits.ADCD3IF = 0;
    }
    portEND_SWITCHING_ISR(xHigherPriorityTaskWoken);
    IFS1bits.ADCIF = 0;    
}

//******************************************************************************