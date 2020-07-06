//******************************************************************************
//                               INPUT CAPTURE
//
// Data:       14/06/2020
// Descrição:  Controle das portas de Input Capture
//******************************************************************************
#ifndef _INPUT_CAPTURE_H
#define _INPUT_CAPTURE_H

#include "../IO Ports/IOPorts.h"
#include "../Timer/Timer.h"

#define INPUT_MAP_RPA0       0
#define INPUT_MAP_RPA1       0
#define INPUT_MAP_RPA2       0
#define INPUT_MAP_RPA3       0
#define INPUT_MAP_RPA4       2
#define INPUT_MAP_RPA8       4
#define INPUT_MAP_RPA9       7
#define INPUT_MAP_RPB1       2
#define INPUT_MAP_RPB2       4
#define INPUT_MAP_RPB3       1
#define INPUT_MAP_RPB4       2
#define INPUT_MAP_RPB5       1
#define INPUT_MAP_RPB6       1
#define INPUT_MAP_RPB7       4
#define INPUT_MAP_RPB8       4
#define INPUT_MAP_RPB9       4
#define INPUT_MAP_RPB10      3
#define INPUT_MAP_RPB11      3
#define INPUT_MAP_RPB11      3
#define INPUT_MAP_RPB13      3
#define INPUT_MAP_RPB14      1
#define INPUT_MAP_RPB15      3
#define INPUT_MAP_RPC0       6
#define INPUT_MAP_RPC1       6
#define INPUT_MAP_RPC2       6
#define INPUT_MAP_RPC3       7
#define INPUT_MAP_RPC4       7
#define INPUT_MAP_RPC5       7
#define INPUT_MAP_RPC6       5
#define INPUT_MAP_RPC7       5
#define INPUT_MAP_RPC8       6
#define INPUT_MAP_RPC9       5

typedef struct
{
  int8_t ID;
  IOPort_t Port;
  Timer_t timer;
} InputCapture_t;

extern void initInputCapture(InputCapture_t *ic);
extern void setPulseWidthCapture(InputCapture_t *ic);
extern uint32_t getPulseWidth(InputCapture_t *ic);

#endif
//******************************************************************************