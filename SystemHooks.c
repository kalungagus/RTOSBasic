//******************************************************************************
//                         APPLICATION HOOKS
//
// Data:       04/04/2020
// Autor:      Gustavo Adolpho Souteras Barbosa
// Descrição:  Os Hooks são funções chamadas pelo FreeRTOS em falhas específicas
//             A inclusão destes pontos de falha é definida no arquivo FreeRTOSConfig.h
//             e por isto as funções aqui também são definidas com base nesta
//             escolha
//******************************************************************************

//******************************************************************************
// INCLUDES
//******************************************************************************
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"
#include <xc.h>

void vApplicationMallocFailedHook(void) 
{
    taskDISABLE_INTERRUPTS();
    for (;;);
}

void vApplicationIdleHook(void) 
{
}

void vApplicationStackOverflowHook(TaskHandle_t pxTask, char *pcTaskName) {
    (void) pcTaskName;
    (void) pxTask;
    taskDISABLE_INTERRUPTS();
    for (;;);
}

void vApplicationTickHook( void )
{
	/* This function will be called by each tick interrupt if
	configUSE_TICK_HOOK is set to 1 in FreeRTOSConfig.h.  User code can be
	added here, but the tick hook is called from an interrupt context, so
	code must not attempt to block, and only the interrupt safe FreeRTOS API
	functions can be used (those that end in FromISR()). */

}

//******************************************************************************