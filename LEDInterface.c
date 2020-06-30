//******************************************************************************
//                             LED INTERFACE
//
// Data:       04/04/2020
// Descrição:  Controle de acionamento de leds
//******************************************************************************
#include <xc.h>
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"
#include "LEDInterface.h"

QueueHandle_t ledQueue;

// <editor-fold defaultstate="collapsed" desc="Function declarations">
//******************************************************************************
// A declaração de funções aqui permite melhor organização das funções no
// arquivo fonte
//******************************************************************************
static void taskLedControl(void *);

//******************************************************************************
// </editor-fold>

void LEDInterfaceInit(void)
{
    ledQueue = xQueueCreate(1, sizeof(LedInfo));
    xTaskCreate(taskLedControl, "LedControl", configMINIMAL_STACK_SIZE, NULL, tskIDLE_PRIORITY+1, NULL);
}

void setupLed(LedInfo *led)
{
    setPinDirection(led->port, IO_OUTPUT);
    setPinAnalogState(led->port, PIN_DIGITAL);
    writePin(led->port, led->status);
}

void setLedInfo(LedInfo *led)
{
    xQueueSend(ledQueue,  (void *)led, portMAX_DELAY);
}

static void taskLedControl(void *pvParameters)
{
    LedInfo led;
    
    for(;;)
    {
        xQueueReceive(ledQueue, &led, portMAX_DELAY);
        writePin(led.port, led.status);
    }
}

//******************************************************************************