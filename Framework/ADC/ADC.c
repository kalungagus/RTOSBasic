//******************************************************************************
//                                 ADC
//
// Data:       06/05/2020
// Descrição:  Utilização do ADC para amostragem de sinais
//******************************************************************************
#include <xc.h>
#include "ADC.h"

//******************************************************************************
// Protótipo de funções do módulo
//******************************************************************************
void initADC(void);
void setupDAQ(DAQModule_t *module, int32_t sampleFreq);
void setupADC(ADCModule_t *module);
void dataAcquire(DAQModule_t *module, uint16_t *sampleCollection, uint16_t sizeOfCollection);
uint16_t readAnalogValue(ADCModule_t *ADC);
uint16_t getAdcValue(ADCModule_t *module);

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

    ADCANCON = 0x00000000;
    ADCANCONbits.WKUPCLKCNT = 9; // Wakeup exponent = 512 * TADx

    ADCCON3 = 0x00000000;
    ADCCON3bits.ADCSEL = 0;      // Select input clock source
    ADCCON3bits.CONCLKDIV = 0;   // Control clock frequency equal to input clock
    ADCCON3bits.VREFSEL = 0;     // Select AVDD and AVSS as reference source
    
    /* Select ADC sample time and conversion clock */
    ADC0TIMEbits.ADCDIV = 1;
    ADC0TIMEbits.SAMC = 5;
    ADC0TIMEbits.SELRES = 3;
    ADC1TIMEbits.ADCDIV = 1;
    ADC1TIMEbits.SAMC = 5;
    ADC1TIMEbits.SELRES = 3;
    ADC2TIMEbits.ADCDIV = 1;
    ADC2TIMEbits.SAMC = 5;
    ADC2TIMEbits.SELRES = 3;
    ADC3TIMEbits.ADCDIV = 1;
    ADC3TIMEbits.SAMC = 5;
    ADC3TIMEbits.SELRES = 3;
    ADC4TIMEbits.ADCDIV = 1;
    ADC4TIMEbits.SAMC = 5;
    ADC4TIMEbits.SELRES = 3;

    /* Select analog input for ADC modules, no presync trigger, not sync sampling */
    ADCTRGMODEbits.SH0ALT = 0;    
    ADCTRGMODEbits.SH1ALT = 0;
    ADCTRGMODEbits.SH2ALT = 0;
    ADCTRGMODEbits.SH3ALT = 0;
    ADCTRGMODEbits.SH4ALT = 0;
    
    /* Select ADC input mode */
    ADCIMCON1 = 0x00000000;
    ADCIMCON2 = 0x00000000;
    ADCIMCON3 = 0x00000000;

    /* Configure ADCGIRQENx */
    ADCGIRQEN1 = 0;
    ADCGIRQEN2 = 0;

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
    ADCTRGSNS = 0x00000000;
    
    /* Early interrupt */
    ADCEIEN1 = 0;                // No early interrupt
    ADCEIEN2 = 0;
    
    /* Turn the ADC on */
    ADCCON1bits.ON = 1;
    
    /* Wait for voltage reference to be stable */
    while(!ADCCON2bits.BGVRRDY); // Wait until the reference voltage is ready
    while(ADCCON2bits.REFFLT);   // Wait if there is a fault with the reference voltage
}

void setupDAQ(DAQModule_t *module, int32_t sampleFreq)
{
    switch(module->Timer.ID)
    {
        case TIMER_1_ID:
            module->ADC.TriggerSource = ADC_TRIGG_TMR1;
            break;
        case TIMER_3_ID:
            module->ADC.TriggerSource = ADC_TRIGG_TMR3;
            break;
        case TIMER_5_ID:
            module->ADC.TriggerSource = ADC_TRIGG_TMR5;
            break;
        default:
            module->ADC.TriggerSource = ADC_TRIGG_NO_TRIGGER;
    }
    module->Timer.period = configPERIPHERAL_CLOCK_HZ/sampleFreq;
    setupADC(&module->ADC);
}

void turnDAQOff(DAQModule_t *module)
{
    turnADCOff(&module->ADC);
}

void setupADC(ADCModule_t *module)
{
    switch(module->ID)
    {
        case 1:
            module->Pin.ID = IO_B1;
            ADCTRG1bits.TRGSRC1 = module->TriggerSource;
            ADCANCONbits.ANEN1 = 1;
            while(!ADCANCONbits.WKRDY1);
            ADCCON3bits.DIGEN1 = 1;
            break;
        case 2:
            module->Pin.ID = IO_B2;
            ADCTRG1bits.TRGSRC2 = module->TriggerSource;
            ADCANCONbits.ANEN2 = 1;
            while(!ADCANCONbits.WKRDY2);
            ADCCON3bits.DIGEN2 = 1;
            break;
        case 3:
            module->Pin.ID = IO_B3;
            ADCTRG1bits.TRGSRC3 = module->TriggerSource;
            ADCANCONbits.ANEN3 = 1;
            while(!ADCANCONbits.WKRDY3);
            ADCCON3bits.DIGEN3 = 1;
            break;
        case 4:
            module->Pin.ID = IO_B4;
            ADCTRG2bits.TRGSRC4 = module->TriggerSource;
            ADCANCONbits.ANEN4 = 1;
            while(!ADCANCONbits.WKRDY4);
            ADCCON3bits.DIGEN4 = 1;
            break;
        case 7:
            module->Pin.ID = IO_B12;
            ADCTRG2bits.TRGSRC7 = module->TriggerSource;
            ADCANCONbits.ANEN7 = 1;
            while(!ADCANCONbits.WKRDY7);
            ADCCON3bits.DIGEN7 = 1;
            break;
        case 8:
            module->Pin.ID = IO_B13;
            ADCTRG3bits.TRGSRC8 = module->TriggerSource;
            ADCANCONbits.ANEN7 = 1;
            while(!ADCANCONbits.WKRDY7);
            ADCCON3bits.DIGEN7 = 1;
            break;
        case 9:
            module->Pin.ID = IO_B14;
            ADCTRG3bits.TRGSRC9 = module->TriggerSource;
            ADCANCONbits.ANEN7 = 1;
            while(!ADCANCONbits.WKRDY7);
            ADCCON3bits.DIGEN7 = 1;
            break;
        case 10:
            module->Pin.ID = IO_B15;
            ADCTRG3bits.TRGSRC10 = module->TriggerSource;
            ADCANCONbits.ANEN7 = 1;
            while(!ADCANCONbits.WKRDY7);
            ADCCON3bits.DIGEN7 = 1;
            break;
    }

    setPinAnalogState(module->Pin, PIN_ANALOG);
}

void turnADCOff(ADCModule_t *module)
{
    switch(module->ID)
    {
        case 1:
            ADCANCONbits.ANEN1 = 0;
            ADCCON3bits.DIGEN1 = 0;
            break;
        case 2:
            ADCANCONbits.ANEN2 = 0;
            ADCCON3bits.DIGEN2 = 1;
            break;
        case 3:
            ADCANCONbits.ANEN3 = 0;
            ADCCON3bits.DIGEN3 = 0;
            break;
        case 4:
            ADCANCONbits.ANEN4 = 0;
            ADCCON3bits.DIGEN4 = 0;
            break;
        case 7:
            ADCANCONbits.ANEN7 = 0;
            ADCCON3bits.DIGEN7 = 0;
            break;
        case 8:
            ADCANCONbits.ANEN7 = 0;
            ADCCON3bits.DIGEN7 = 0;
            break;
        case 9:
            ADCANCONbits.ANEN7 = 0;
            ADCCON3bits.DIGEN7 = 0;
            break;
        case 10:
            ADCANCONbits.ANEN7 = 0;
            ADCCON3bits.DIGEN7 = 0;
            break;
    }

    setPinDirection(module->Pin, IO_INPUT);
    setPinAnalogState(module->Pin, PIN_DIGITAL);
}

void dataAcquire(DAQModule_t *module, uint16_t *sampleCollection, uint16_t sizeOfCollection)
{
    uint16_t position;

    setupTimer(&module->Timer);
    setTimerState(&module->Timer, TIMER_ON);
    for(position=0; position<sizeOfCollection; position++)
        sampleCollection[position] = getAdcValue(&module->ADC);
    setTimerState(&module->Timer, TIMER_OFF);
}

uint16_t readAnalogValue(ADCModule_t *ADC)
{
    int16_t result;
    
    /* Trigger a conversion */
    ADCCON3bits.GSWTRG = 1;
    
    result = getAdcValue(ADC);
    return(result);
}

uint16_t getAdcValue(ADCModule_t *module)
{
    uint16_t data;
    
    switch(module->ID)
    {
        case 1:
            while (ADCDSTAT1bits.ARDY1 == 0);
            data = ADCDATA1;
            break;
        case 2:
            while (ADCDSTAT1bits.ARDY2 == 0);
            data = ADCDATA2;
            break;
        case 3:
            while (ADCDSTAT1bits.ARDY3 == 0);
            data = ADCDATA3;
            break;
        case 4:
            while (ADCDSTAT1bits.ARDY4 == 0);
            data = ADCDATA4;
            break;
        case 7:
            while (ADCDSTAT1bits.ARDY7 == 0);
            data = ADCDATA7;
            break;
        case 8:
            while (ADCDSTAT1bits.ARDY8 == 0);
            data = ADCDATA8;
            break;
        case 9:
            while (ADCDSTAT1bits.ARDY9 == 0);
            data = ADCDATA9;
            break;
        case 10:
            while (ADCDSTAT1bits.ARDY10 == 0);
            data = ADCDATA10;
            break;
    }

    return(data);
}

//******************************************************************************