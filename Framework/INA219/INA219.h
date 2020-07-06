//******************************************************************************
//                                INA219
//
// Data:       12/06/2020
// Descrição:  Módulo de utilização do sensor de tensão, corrente e potência
//             INA219. O sensor utiliza o barramento de comunicação I2C para
//             transmissão de dados
// Dependências: I2C
//******************************************************************************
#ifndef _INA219_H
#define _INA219_H

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

typedef struct
{
    uint8_t I2CID;
    ina219Config_t Config;
} INA219Sensor_t;

extern void setupINA219(INA219Sensor_t *sensor);
extern void setINA219Off(INA219Sensor_t *sensor);
extern uint16_t ina219GetBusVoltage(INA219Sensor_t *sensor);
extern int16_t ina219GetShuntVoltage(INA219Sensor_t *sensor);
extern int16_t ina219GetGurrent(INA219Sensor_t *sensor);
extern uint16_t ina219GetPower(INA219Sensor_t *sensor);

#endif