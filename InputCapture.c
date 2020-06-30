//******************************************************************************
//                               INPUT CAPTURE
//
// Data:       14/06/2020
// Descrição:  Controle das portas de Input Capture
//******************************************************************************
#include <xc.h>
#include "FreeRTOS.h"
#include "semphr.h"
#include "queue.h"
#include "InputCapture.h"

//******************************************************************************
// Protótipo de funções do módulo
//******************************************************************************

//******************************************************************************
// Variáveis Globais
//******************************************************************************
QueueHandle_t inputCapture1Queue = NULL;
QueueHandle_t inputCapture2Queue = NULL;
QueueHandle_t inputCapture3Queue = NULL;
QueueHandle_t inputCapture4Queue = NULL;

volatile uint32_t firstValue, lastValue;
volatile uint32_t baseValue;

//******************************************************************************
// Funções
//******************************************************************************
void initInputCapture(InputCapture_t *ic)
{
    switch(ic->ID)
    {
        case 1:
            setInputPinSelection(ic->Port, PPS_IN_IC1);
            IC1CONbits.ICM = 0x01;
            IC1CONbits.FEDGE = 1;
            IC1CONbits.ICTMR = 0;
            IC1CONbits.ICI = 0;
            IFS0bits.IC1IF = 0;
            IEC0bits.IC1IE = 1;
            IPC1bits.IC1IP = 4;
            IPC1bits.IC1IS = 2;
            if(inputCapture1Queue == NULL)
                inputCapture1Queue = xQueueCreate(2, sizeof(uint32_t));
            ic->timer.ID = TIMER_5_ID;
            IC1CONbits.ON = 1;
            break;
        case 2:
            setInputPinSelection(ic->Port, PPS_IN_IC2);
            IC2CONbits.ICM = 0x01;
            IC2CONbits.FEDGE = 1;
            IC2CONbits.ICTMR = 0;
            IC2CONbits.ICI = 0;
            IFS0bits.IC2IF = 0;
            IEC0bits.IC2IE = 1;
            IPC2bits.IC2IP = 4;
            IPC2bits.IC2IS = 2;
            if(inputCapture2Queue == NULL)
                inputCapture2Queue = xQueueCreate(2, sizeof(uint32_t));
            ic->timer.ID = TIMER_5_ID;
            IC2CONbits.ON = 1;
            break;
        case 3:
            setInputPinSelection(ic->Port, PPS_IN_IC3);
            IC3CONbits.ICM = 0x01;
            IC3CONbits.FEDGE = 1;
            IC3CONbits.ICTMR = 0;
            IC3CONbits.ICI = 0;
            IFS0bits.IC3IF = 0;
            IEC0bits.IC3IE = 1;
            IPC4bits.IC3IP = 4;
            IPC4bits.IC3IS = 2;
            if(inputCapture3Queue == NULL)
                inputCapture3Queue = xQueueCreate(2, sizeof(uint32_t));
            ic->timer.ID = TIMER_5_ID;
            IC3CONbits.ON = 1;
            break;
        case 4:
            setInputPinSelection(ic->Port, PPS_IN_IC4);
            IC4CONbits.ICM = 0x01;
            IC4CONbits.FEDGE = 1;
            IC4CONbits.ICTMR = 0;
            IC4CONbits.ICI = 0;
            IFS0bits.IC4IF = 0;
            IEC0bits.IC4IE = 1;
            IPC5bits.IC4IP = 4;
            IPC5bits.IC4IS = 2;
            if(inputCapture4Queue == NULL)
                inputCapture4Queue = xQueueCreate(2, sizeof(uint32_t));
            ic->timer.ID = TIMER_3_ID;
            IC4CONbits.ON = 1;
            break;
        default:
            break;
    }
    ic->timer.countInterrupt = 1;
    ic->timer.period = 0xFFFF;
}

void setPulseWidthCapture(InputCapture_t *ic)
{
    uint16_t dump;
    
    switch(ic->ID)
    {
        case 1:
            while(uxQueueMessagesWaiting(inputCapture1Queue))
                xQueueReceive(inputCapture1Queue, &dump, portMAX_DELAY);
            break;
        case 2:
            while(uxQueueMessagesWaiting(inputCapture2Queue))
                xQueueReceive(inputCapture2Queue, &dump, portMAX_DELAY);
            break;
        case 3:
            while(uxQueueMessagesWaiting(inputCapture3Queue))
                xQueueReceive(inputCapture3Queue, &dump, portMAX_DELAY);
            break;
        case 4:
            while(uxQueueMessagesWaiting(inputCapture4Queue))
                xQueueReceive(inputCapture4Queue, &dump, portMAX_DELAY);
            break;
    }
    setupTimer(&ic->timer);
    firstValue = lastValue = baseValue = 0x00000000;
    setTimerState(&ic->timer, TIMER_ON);
}

uint32_t getPulseWidth(InputCapture_t *ic)
{
    uint32_t time;
    uint32_t startTime=0, endTime=0;
    double pulsesPerUs = ((double)configCPU_CLOCK_HZ / 1000000.0f);
    
    switch(ic->ID)
    {
        case 1:
            xQueueReceive(inputCapture1Queue, &startTime, portMAX_DELAY);
            xQueueReceive(inputCapture1Queue, &endTime, portMAX_DELAY);
            break;
        case 2:
            xQueueReceive(inputCapture2Queue, &startTime, portMAX_DELAY);
            xQueueReceive(inputCapture2Queue, &endTime, portMAX_DELAY);
            break;
        case 3:
            xQueueReceive(inputCapture3Queue, &startTime, portMAX_DELAY);
            xQueueReceive(inputCapture3Queue, &endTime, portMAX_DELAY);
            break;
        case 4:
            xQueueReceive(inputCapture4Queue, &startTime, portMAX_DELAY);
            xQueueReceive(inputCapture4Queue, &endTime, portMAX_DELAY);
            break;
    }
    time = endTime - startTime;
    time /= pulsesPerUs;
    return(time);
}

//******************************************************************************
// IC Interrupt Handler
//******************************************************************************
void __attribute__((interrupt(IPL0AUTO), vector(_INPUT_CAPTURE_1_VECTOR))) vIC1InterruptWrapper( void );

void vIC1InterruptHandler(void)
{
    BaseType_t xHigherPriorityTaskWoken = pdFALSE;
    int32_t time;
    
    ((uint16_t *)(&time))[0] = IC1BUF;
    ((uint16_t *)(&time))[1] = getTimerInterruptCount(TIMER_5_ID);
    IFS0bits.IC1IF = 0;
    xQueueSendFromISR(inputCapture1Queue,  (void *)&time, &xHigherPriorityTaskWoken);
    portEND_SWITCHING_ISR(xHigherPriorityTaskWoken);
}

void __attribute__((interrupt(IPL0AUTO), vector(_INPUT_CAPTURE_2_VECTOR))) vIC2InterruptWrapper( void );

void vIC2InterruptHandler(void)
{
    BaseType_t xHigherPriorityTaskWoken = pdFALSE;
    int32_t time;
    
    ((uint16_t *)(&time))[0] = IC2BUF;
    ((uint16_t *)(&time))[1] = getTimerInterruptCount(TIMER_5_ID);
    IFS0bits.IC2IF = 0;
    xQueueSendFromISR(inputCapture2Queue,  (void *)&time, &xHigherPriorityTaskWoken);
    portEND_SWITCHING_ISR(xHigherPriorityTaskWoken);
}

void __attribute__((interrupt(IPL0AUTO), vector(_INPUT_CAPTURE_3_VECTOR))) vIC3InterruptWrapper( void );

void vIC3InterruptHandler(void)
{
    BaseType_t xHigherPriorityTaskWoken = pdFALSE;
    int32_t time;
    
    ((uint16_t *)(&time))[0] = IC3BUF;
    ((uint16_t *)(&time))[1] = getTimerInterruptCount(TIMER_5_ID);
    IFS0bits.IC3IF = 0;
    xQueueSendFromISR(inputCapture3Queue,  (void *)&time, &xHigherPriorityTaskWoken);
    portEND_SWITCHING_ISR(xHigherPriorityTaskWoken);
}

void __attribute__((interrupt(IPL0AUTO), vector(_INPUT_CAPTURE_4_VECTOR))) vIC4InterruptWrapper( void );

void vIC4InterruptHandler(void)
{
    BaseType_t xHigherPriorityTaskWoken = pdFALSE;
    int32_t time;
    
    ((uint16_t *)(&time))[0] = IC4BUF;
    ((uint16_t *)(&time))[1] = getTimerInterruptCount(TIMER_3_ID);
    IFS0bits.IC4IF = 0;
    xQueueSendFromISR(inputCapture4Queue,  (void *)&time, &xHigherPriorityTaskWoken);
    portEND_SWITCHING_ISR(xHigherPriorityTaskWoken);
}

//******************************************************************************