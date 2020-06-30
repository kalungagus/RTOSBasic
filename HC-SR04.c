//******************************************************************************
//                               HC-SR04
//
// Data:       14/06/2020
// Descri��o:  Leitura do sensor de dist�ncia HC-SR04
//******************************************************************************
#include <xc.h>
#include "FreeRTOS.h"
#include "InputCapture.h"

//******************************************************************************
// Vari�veis globais
//******************************************************************************
InputCapture_t sensor1 =
{
    .ID = 2,
    .Port = IO_B15,
};

IOPort_t Trigger =
{
    .ID = IO_E1,
};

//******************************************************************************
// Prot�tipo de fun��es do m�dulo
//******************************************************************************
static void delay_us(uint16_t us);

//******************************************************************************
// Fun��es
//******************************************************************************
void InitHCSR04(void)
{
    setPinDirection(Trigger, IO_OUTPUT);
    initInputCapture(&sensor1);
}

uint16_t getDistanceCM(void)
{
    uint16_t value;
    
    writePin(Trigger, 0);
    setPulseWidthCapture(&sensor1);
    delay_us(2);
    writePin(Trigger, 1);
    delay_us(10);
    writePin(Trigger, 0);
    value = getPulseWidth(&sensor1);
    value /= 58.8235f;
    return(value);
}

static void delay_us(uint16_t us)
{
    uint32_t finalCount;
    
    us *= configCPU_CLOCK_HZ / 2000000;

    finalCount = _CP0_GET_COUNT() + us;

    while (finalCount > _CP0_GET_COUNT());
}

//******************************************************************************