//******************************************************************************
//                                USB
//
// Data:       06/05/2020
// Descrição:  Controle de porta USB
//******************************************************************************
#ifndef _USB_FREERTOS_H
#define _USB_FREERTOS_H

extern initUSB(void);
extern int16_t getAvailable(void);
extern int8_t getUSBByte(void);
extern int16_t getUSBPacket(int8_t *copyBuffer, uint16_t bufferSize);
extern int16_t sendUSBPacket(int8_t *copyBuffer, uint16_t bufferSize);

#endif
//******************************************************************************
