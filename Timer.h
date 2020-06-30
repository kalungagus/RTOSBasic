//******************************************************************************
//                                TIMER
//
// Data:       28/06/2020
// Descrição:  Controle de timers
//******************************************************************************
#ifndef _TIMER_
#define _TIMER_

#define TIMER_1_ID            1
#define TIMER_2_ID            2
#define TIMER_3_ID            3
#define TIMER_4_ID            4
#define TIMER_5_ID            5

#define TIMER_OFF             0
#define TIMER_ON              1

typedef struct
{
    int8_t ID;
    int8_t countInterrupt;
    int16_t period;
} Timer_t;

extern void setupTimer(Timer_t *timer);
extern void setTimerState(Timer_t *timer, uint8_t state);
extern uint16_t getTimerInterruptCount(int8_t timerID);

#endif
//******************************************************************************