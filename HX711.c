//******************************************************************************
//                               HX711
//
// Data:       18/06/2020
// Descrição:  Leitura do sensor de peso
//******************************************************************************
#include <xc.h>
#include "FreeRTOS.h"
#include "task.h"
#include "IOPorts.h"

#define GAIN              128

#define LSBFIRST          0
#define MSBFIRST          1

//******************************************************************************
// Variáveis globais
//******************************************************************************
IOPort_t pdSCK =
{
    .ID = IO_E2,
};

IOPort_t pdSOut =
{
    .ID = IO_E1,
};

//******************************************************************************
// Protótipo de funções do módulo
//******************************************************************************
int8_t hx711IsReady(IOPort_t dataPin);
uint8_t hx711ReadByte(IOPort_t dataPin, IOPort_t clockPin, uint8_t bitOrder);
void setHX711Gain(IOPort_t clockPin, int8_t gain);
void hx711SetNextChannelAndGain(IOPort_t clockPin, uint8_t gain);
static void delay_us(uint16_t us);

//******************************************************************************
// Funções
//******************************************************************************
void InitHX711(void)
{
    setPinDirection(pdSCK, IO_OUTPUT);
    setPinDirection(pdSOut, IO_INPUT);
}

int32_t hx711Read(void)
{
    int32_t value;
    
    while(hx711IsReady(pdSOut));
    
	portENTER_CRITICAL();
    ((uint8_t *)(&value))[2] = hx711ReadByte(pdSOut, pdSCK, MSBFIRST);
    ((uint8_t *)(&value))[1] = hx711ReadByte(pdSOut, pdSCK, MSBFIRST);
    ((uint8_t *)(&value))[0] = hx711ReadByte(pdSOut, pdSCK, MSBFIRST);
    hx711SetNextChannelAndGain(pdSCK, GAIN);
    
    writePin(pdSCK, 0);
    portEXIT_CRITICAL();
    
    return(value);
}

int8_t hx711IsReady(IOPort_t dataPin)
{
    return(readPin(dataPin) == 0);
}

uint8_t hx711ReadByte(IOPort_t dataPin, IOPort_t clockPin, uint8_t bitOrder) 
{
    uint8_t value = 0;
    uint8_t i;

    for(i = 0; i < 8; ++i) 
    {
        writePin(clockPin, 1);
        delay_us(1);
        if(bitOrder == LSBFIRST)
            value |= readPin(dataPin) << i;
        else
            value |= readPin(dataPin) << (7 - i);
        writePin(clockPin, 0);
        delay_us(1);
    }
    return value;
}

void hx711SetNextChannelAndGain(IOPort_t clockPin, uint8_t gain)
{
    uint8_t pulses;
    uint8_t i;
    
    switch(gain)
    {
        case 128: pulses = 1; break;
        case 32: pulses = 2; break;
        case 64: pulses = 3; break;
        default: pulses = 0; break;
    }
    for(i = 0; i < pulses; i++) 
    {
		writePin(clockPin, 1);
		delay_us(1);
		writePin(clockPin, 0);
        delay_us(1);
	}
}

static void delay_us(uint16_t us)
{
    uint32_t finalCount;
    
    us *= configCPU_CLOCK_HZ / 2000000;

    finalCount = _CP0_GET_COUNT() + us;

    while (finalCount > _CP0_GET_COUNT());
}
//******************************************************************************