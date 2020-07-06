//******************************************************************************
//                                I2C
//
// Data:       12/06/2020
// Descrição:  Controle de barramento de dados I2C
//******************************************************************************
#ifndef _I2C_FREERTOS_H
#define _I2C_FREERTOS_H

extern void initI2C(uint8_t i2cID, double frequency);
extern void stopI2C(uint8_t i2cID);
extern void i2cWaitForIdle(uint8_t i2cID);
extern void i2cSendStartCondition(uint8_t i2cID);
extern void i2cSendStopCondition(uint8_t i2cID);
extern void i2cSendRestartCondition(uint8_t i2cID);
extern void i2cSendAck(uint8_t i2cID);
extern void i2cSendNack(uint8_t i2cID);
extern void i2cWrite(uint8_t i2cID, uint8_t address, uint8_t waitAck);
extern uint8_t i2cRead(uint8_t i2cID, uint8_t ackNack);

#endif
//******************************************************************************