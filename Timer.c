//******************************************************************************
//                                 TIMER
//
// Data:       28/06/2020
// Descrição:  Controle de timers
//******************************************************************************
#include <proc/p32mz2048efm100.h>

#include "Timer.h"

//******************************************************************************
// Variáveis Globais
//******************************************************************************
volatile uint16_t timer2Interrupts;
volatile uint16_t timer3Interrupts;
volatile uint16_t timer4Interrupts;
volatile uint16_t timer5Interrupts;

//******************************************************************************
// Funções
//******************************************************************************
void setupTimer(Timer_t *timer)
{
    switch(timer->ID)
    {
        case TIMER_2_ID:
            T2CON = 0;
            TMR2 = 0x00000000;
            PR2 = timer->period;
            if(timer->countInterrupt)
            {
                timer2Interrupts = 0;
                IPC2bits.T2IP = 1;
                IPC2bits.T2IS = 1;
                IEC0bits.T2IE = 1;
            }
            else
            {
                IEC0bits.T2IE = 1;
            }
            break;
        case TIMER_3_ID:
            T3CON = 0;
            TMR3 = 0x00000000;
            PR3 = timer->period;
            if(timer->countInterrupt)
            {
                timer3Interrupts = 0;
                IPC3bits.T3IP = 1;
                IPC3bits.T3IS = 1;
                IEC0bits.T3IE = 1;
            }
            else
            {
                IEC0bits.T3IE = 1;
            }
            break;
        case TIMER_4_ID:
            T4CON = 0;
            TMR4 = 0x00000000;
            PR4 = timer->period;
            if(timer->countInterrupt)
            {
                timer4Interrupts = 0;
                IPC4bits.T4IP = 1;
                IPC4bits.T4IS = 1;
                IEC0bits.T4IE = 1;
            }
            else
            {
                IEC0bits.T4IE = 1;
            }
            break;
        case TIMER_5_ID:
            T5CON = 0;
            TMR5 = 0x00000000;
            PR5 = timer->period;
            if(timer->countInterrupt)
            {
                timer5Interrupts = 0;
                IPC6bits.T5IP = 1;
                IPC6bits.T5IS = 1;
                IEC0bits.T5IE = 1;
            }
            else
            {
                IEC0bits.T5IE = 1;
            }
            break;
        default:
            break;
    }
}

void setTimerState(Timer_t *timer, uint8_t state)
{
    switch(timer->ID)
    {
        case TIMER_2_ID:
            T2CONbits.ON = state;
            break;
        case TIMER_3_ID:
            T3CONbits.ON = state;
            break;
        case TIMER_4_ID:
            T4CONbits.ON = state;
            break;
        case TIMER_5_ID:
            T5CONbits.ON = state;
            break;
    }
}

uint16_t getTimerInterruptCount(int8_t timerID)
{
    uint16_t value;
    uint8_t timerStatus;
    
    switch(timerID)
    {
        case TIMER_2_ID:
            timerStatus = IEC0bits.T2IE;
            IEC0bits.T2IE = 0;
            value = timer2Interrupts;
            IEC0bits.T2IE = timerStatus;
            break;
        case TIMER_3_ID:
            timerStatus = IEC0bits.T3IE;
            IEC0bits.T3IE = 0;
            value = timer3Interrupts;
            IEC0bits.T3IE = timerStatus;
            break;
        case TIMER_4_ID:
            timerStatus = IEC0bits.T4IE;
            IEC0bits.T4IE = 0;
            value = timer4Interrupts;
            IEC0bits.T4IE = timerStatus;
            break;
        case TIMER_5_ID:
            timerStatus = IEC0bits.T5IE;
            IEC0bits.T5IE = 0;
            value = timer5Interrupts;
            IEC0bits.T5IE = timerStatus;
            break;
    }
    
    return(value);
}

//******************************************************************************
// Timer Interrupt Handler
//******************************************************************************
void __attribute__((interrupt(IPL0AUTO), vector(_TIMER_2_VECTOR))) vTimer2InterruptWrapper( void );

void vTimer2InterruptHandler(void)
{
    timer2Interrupts++;
    IFS0bits.T2IF = 0;
}

void __attribute__((interrupt(IPL0AUTO), vector(_TIMER_3_VECTOR))) vTimer3InterruptWrapper( void );

void vTimer3InterruptHandler(void)
{
    timer3Interrupts++;
    IFS0bits.T3IF = 0;
}

void __attribute__((interrupt(IPL0AUTO), vector(_TIMER_4_VECTOR))) vTimer4InterruptWrapper( void );

void vTimer4InterruptHandler(void)
{
    timer4Interrupts++;
    IFS0bits.T4IF = 0;
}

void __attribute__((interrupt(IPL0AUTO), vector(_TIMER_5_VECTOR))) vTimer5InterruptWrapper( void );

void vTimer5InterruptHandler(void)
{
    timer5Interrupts++;
    IFS0bits.T5IF = 0;
}

//******************************************************************************