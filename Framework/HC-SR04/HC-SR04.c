//******************************************************************************
//                               HC-SR04
//
// Data:       14/06/2020
// Descrição:  Leitura do sensor de distância HC-SR04
//******************************************************************************
#include <xc.h>
#include "FreeRTOS.h"
#include "HC-SR04.h"

//******************************************************************************
// Protótipo de funções do módulo
//******************************************************************************
static void delay_us(uint16_t us);

//******************************************************************************
// Funções
//******************************************************************************
void setupHCSR04(HCSR04Sensor_t *sensor)
{
    setPinDirection(sensor->Trigger, IO_OUTPUT);
    initInputCapture(&sensor->IC);
}

void setHCSR04Off(HCSR04Sensor_t *sensor)
{
    setPinDirection(sensor->Trigger, IO_INPUT);
}

uint16_t getDistanceCM(HCSR04Sensor_t *sensor)
{
    uint16_t value;
    
    writePin(sensor->Trigger, 0);
    setPulseWidthCapture(&sensor->IC);
    delay_us(2);
    writePin(sensor->Trigger, 1);
    delay_us(10);
    writePin(sensor->Trigger, 0);
    value = getPulseWidth(&sensor->IC);
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