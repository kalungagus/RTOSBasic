//******************************************************************************
//                                INA219
//
// Data:       12/06/2020
// Descri��o:  M�dulo de utiliza��o do sensor de tens�o, corrente e pot�ncia
//             INA219. O sensor utiliza o barramento de comunica��o I2C para
//             transmiss�o de dados
// Depend�ncias: I2C
//******************************************************************************

//******************************************************************************
// INCLUDES
//******************************************************************************
#include <xc.h>
#include "FreeRTOS.h"
#include "task.h"
#include "stream_buffer.h"
#include "semphr.h"
#include "../I2C/I2C.h"
#include "INA219.h"

//******************************************************************************
// Defini��es do m�dulo
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
// A declara��o de fun��es aqui permite melhor organiza��o das fun��es no
// arquivo fonte
//******************************************************************************
void setupINA219(INA219Sensor_t *sensor);
void setINA219Off(INA219Sensor_t *sensor);
uint16_t INA219Read(INA219Sensor_t *sensor, int8_t regAddress);
void INA219Write(INA219Sensor_t *sensor, int8_t regAddress, uint16_t data);

//******************************************************************************
// </editor-fold>

//******************************************************************************
// Fun��es
//******************************************************************************
void setupINA219(INA219Sensor_t *sensor)
{
    initI2C(sensor->I2CID, 100000);
    sensor->Config.Value = INA219Read(sensor, INA219_CONFIGURATION);
    INA219Write(sensor, INA219_CALIBRATION, 4096);
}

void setINA219Off(INA219Sensor_t *sensor)
{
    stopI2C(sensor->I2CID);
}

uint16_t ina219GetBusVoltage(INA219Sensor_t *sensor)
{
    uint16_t voltVal;
    
    voltVal = INA219Read(sensor, INA219_BUS_VOLTAGE);
    
    return((voltVal >> 3) * 4);
}

int16_t ina219GetShuntVoltage(INA219Sensor_t *sensor)
{
    int16_t voltVal;
    
    voltVal = INA219Read(sensor, INA219_SHUNT_VOLTAGE);
    
    return(voltVal*10);
}

int16_t ina219GetGurrent(INA219Sensor_t *sensor)
{
    int16_t currentVal;
    
    currentVal = INA219Read(sensor, INA219_CURRENT);
    
    return(currentVal/10);
}

uint16_t ina219GetPower(INA219Sensor_t *sensor)
{
    uint16_t powerVal;
    
    powerVal = INA219Read(sensor, INA219_POWER);
    
    return(powerVal * 2);
}

void INA219Write(INA219Sensor_t *sensor, int8_t regAddress, uint16_t data)
{
    i2cSendStartCondition(sensor->I2CID);
    i2cWrite(sensor->I2CID, INA_ADDRESS << 1, 1);
    i2cWrite(sensor->I2CID, regAddress, 1);
    i2cWrite(sensor->I2CID, ((uint8_t *)(&data))[1], 1);
    i2cWrite(sensor->I2CID, ((uint8_t *)(&data))[0], 1);
    i2cSendStopCondition(sensor->I2CID);
}

uint16_t INA219Read(INA219Sensor_t *sensor, int8_t regAddress)
{
    uint16_t data;
    
    i2cSendStartCondition(sensor->I2CID);
    i2cWrite(sensor->I2CID, INA_ADDRESS << 1, 1);
    i2cWrite(sensor->I2CID, regAddress, 1);
    i2cSendRestartCondition(sensor->I2CID);
    
    i2cWrite(sensor->I2CID, (INA_ADDRESS << 1) | 1, 1);
    ((uint8_t *)(&data))[1] = i2cRead(sensor->I2CID, 1);
    ((uint8_t *)(&data))[0] = i2cRead(sensor->I2CID, 0);
    i2cSendStopCondition(sensor->I2CID);
    
    return(data);
}

//******************************************************************************