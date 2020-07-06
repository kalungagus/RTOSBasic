//******************************************************************************
//                               HC-SR04
//
// Data:       14/06/2020
// Descrição:  Leitura do sensor de distância HC-SR04
//******************************************************************************
#ifndef _HC_SR04_H
#define _HC_SR04_H

#include "../IO Ports/IOPorts.h"
#include "../Input Capture/InputCapture.h"

typedef struct
{
  IOPort_t Trigger;
  InputCapture_t IC;
} HCSR04Sensor_t;

extern void setupHCSR04(HCSR04Sensor_t *sensor);
extern void setHCSR04Off(HCSR04Sensor_t *sensor);
extern uint16_t getDistanceCM(HCSR04Sensor_t *sensor);

#endif
//******************************************************************************