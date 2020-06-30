//******************************************************************************
//                                INA219
//
// Data:       12/06/2020
// Descrição:  Módulo de utilização do sensor de tensão, corrente e potência
//             INA219. O sensor utiliza o barramento de comunicação I2C para
//             transmissão de dados
// Dependências: I2C
//******************************************************************************

//******************************************************************************
// INCLUDES
//******************************************************************************
#include <xc.h>
#include "FreeRTOS.h"
#include "task.h"
#include "stream_buffer.h"
#include "semphr.h"
#include "I2C.h"

//******************************************************************************
// Definições do módulo
//******************************************************************************
#define INA_ADDRESS                                0x40 
#define INA_I2C_ID                                 1

//******************************************************************************
// Registradores do INA219
//******************************************************************************
#define INA219_CONFIGURATION                       0x00
#define INA219_SHUNT_VOLTAGE                       0x01
#define INA219_BUS_VOLTAGE                         0x02
#define INA219_POWER                               0x03
#define INA219_CURRENT                             0x04
#define INA219_CALIBRATION                         0x05

// <editor-fold defaultstate="collapsed" desc="Function declarations">
//******************************************************************************
// A declaração de funções aqui permite melhor organização das funções no
// arquivo fonte
//******************************************************************************
void initINA219(void);
uint16_t INA219Read(int8_t regAddress);
void INA219Write(int8_t regAddress, uint16_t data);

//******************************************************************************
// </editor-fold>

typedef union
{
    uint16_t Value;
    struct
    {
        uint16_t Mode:3;
        uint16_t SADC:4;
        uint16_t BADC:4;
        uint16_t PG:2;
        uint16_t BRNG:1;
        uint16_t:1;
        uint16_t RST:1;
    };
} ina219Config_t;

ina219Config_t INAConfig;

//******************************************************************************
// Funções
//******************************************************************************
void initINA219(void)
{
    initI2C(INA_I2C_ID, 100000);
    INAConfig.Value = INA219Read(INA219_CONFIGURATION);
    INA219Write(INA219_CALIBRATION, 4096);
}

uint16_t ina219GetBusVoltage(void)
{
    uint16_t voltVal;
    
    voltVal = INA219Read(INA219_BUS_VOLTAGE);
    
    return((voltVal >> 3) * 4);
}

int16_t ina219GetShuntVoltage(void)
{
    int16_t voltVal;
    
    voltVal = INA219Read(INA219_SHUNT_VOLTAGE);
    
    return(voltVal*10);
}

int16_t ina219GetGurrent(void)
{
    int16_t currentVal;
    
    currentVal = INA219Read(INA219_CURRENT);
    
    return(currentVal/10);
}

uint16_t ina219GetPower(void)
{
    uint16_t powerVal;
    
    powerVal = INA219Read(INA219_POWER);
    
    return(powerVal * 2);
}

void INA219Write(int8_t regAddress, uint16_t data)
{
    i2cSendStartCondition(INA_I2C_ID);
    i2cWrite(INA_I2C_ID, INA_ADDRESS << 1, 1);
    i2cWrite(INA_I2C_ID, regAddress, 1);
    i2cWrite(INA_I2C_ID, ((uint8_t *)(&data))[1], 1);
    i2cWrite(INA_I2C_ID, ((uint8_t *)(&data))[0], 1);
    i2cSendStopCondition(INA_I2C_ID);
}

uint16_t INA219Read(int8_t regAddress)
{
    uint16_t data;
    
    i2cSendStartCondition(INA_I2C_ID);
    i2cWrite(INA_I2C_ID, INA_ADDRESS << 1, 1);
    i2cWrite(INA_I2C_ID, regAddress, 1);
    i2cSendRestartCondition(INA_I2C_ID);
    
    i2cWrite(INA_I2C_ID, (INA_ADDRESS << 1) | 1, 1);
    ((uint8_t *)(&data))[1] = i2cRead(INA_I2C_ID, 1);
    ((uint8_t *)(&data))[0] = i2cRead(INA_I2C_ID, 0);
    i2cSendStopCondition(INA_I2C_ID);
    
    return(data);
}

//******************************************************************************