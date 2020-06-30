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

extern void initINA219(void);
extern uint16_t ina219GetBusVoltage(void);
extern int16_t ina219GetShuntVoltage(void);
extern int16_t ina219GetGurrent(void);
extern uint16_t ina219GetPower(void);

#endif