//******************************************************************************
//                                INA219
//
// Data:       12/06/2020
// Descri��o:  M�dulo de utiliza��o do sensor de tens�o, corrente e pot�ncia
//             INA219. O sensor utiliza o barramento de comunica��o I2C para
//             transmiss�o de dados
// Depend�ncias: I2C
//******************************************************************************
#ifndef _INA219_H
#define _INA219_H

extern void initINA219(void);
extern uint16_t ina219GetBusVoltage(void);
extern int16_t ina219GetShuntVoltage(void);
extern int16_t ina219GetGurrent(void);
extern uint16_t ina219GetPower(void);

#endif