//******************************************************************************
//                                I2C
//
// Data:       12/06/2020
// Descrição:  Controle de barramento de dados I2C
// Notas:      Exemplos obtidos de https://www.aidanmocke.com/blog/2018/11/27/i2c/
//******************************************************************************

//******************************************************************************
// INCLUDES
//******************************************************************************
#include <xc.h>
#include "FreeRTOS.h"

// <editor-fold defaultstate="collapsed" desc="Function declarations">
//******************************************************************************
// A declaração de funções aqui permite melhor organização das funções no
// arquivo fonte
//******************************************************************************
void initI2C(uint8_t i2cID, double frequency);
void i2cWaitForIdle(uint8_t i2cID);
void i2cSendStartCondition(uint8_t i2cID);
void i2cSendStopCondition(uint8_t i2cID);
void i2cSendRestartCondition(uint8_t i2cID);
void i2cSendAck(uint8_t i2cID);
void i2cSendNack(uint8_t i2cID);
void i2cWrite(uint8_t i2cID, uint8_t address, uint8_t waitAck);
uint8_t i2cRead(uint8_t i2cID, uint8_t ackNack);

//******************************************************************************
// </editor-fold>

//******************************************************************************
// Funções
//******************************************************************************
void initI2C(uint8_t i2cID, double frequency)
{
    double BRG;

    BRG = ((1 / (2 * frequency)) - 0.000000104) * configPERIPHERAL_CLOCK_HZ;
    BRG -= 2;
    
    switch(i2cID)
    {
        case 1:
            if(frequency < 400000)
                I2C1CONbits.DISSLW = 1;
            I2C1BRG = (int)BRG;
            I2C1CONbits.ON = 1;
            break;
        case 2:
            if(frequency < 400000)
                I2C2CONbits.DISSLW = 1;
            I2C2BRG = (int)BRG;
            I2C2CONbits.ON = 1;
            break;
        default:
            break;
     }
}

void stopI2C(uint8_t i2cID)
{
    switch(i2cID)
    {
        case 1:
            I2C1CONbits.ON = 0;
            break;
        case 2:
            I2C2CONbits.ON = 0;
            break;
        default:
            break;
     }    
}

void i2cWaitForIdle(uint8_t i2cID)
{
    switch(i2cID)
    {
        case 1:
            while(I2C1CON & 0x1F);
            while(I2C1STATbits.TRSTAT);
            break;
        case 2:
            while(I2C2CON & 0x1F);
            while(I2C2STATbits.TRSTAT);
            break;
        default:
            break;
    }
}

void i2cSendStartCondition(uint8_t i2cID)
{
    i2cWaitForIdle(i2cID);
    switch(i2cID)
    {
        case 1:
            I2C1CONbits.SEN = 1;
            while (I2C1CONbits.SEN == 1);
            break;
        case 2:
            I2C2CONbits.SEN = 1;
            while (I2C2CONbits.SEN == 1);
            break;
        default:
            break;
    }
}

void i2cSendStopCondition(uint8_t i2cID)
{
    i2cWaitForIdle(i2cID);
    switch(i2cID)
    {
        case 1:
            I2C1CONbits.PEN = 1;
            break;
        case 2:
            I2C2CONbits.PEN = 1;
            break;
        default:
            break;
    }
}

void i2cSendRestartCondition(uint8_t i2cID)
{
    i2cWaitForIdle(i2cID);
    switch(i2cID)
    {
        case 1:
            I2C1CONbits.RSEN = 1;
            while (I2C1CONbits.RSEN == 1);
            break;
        case 2:
            I2C2CONbits.RSEN = 1;
            while (I2C2CONbits.RSEN == 1);
            break;
        default:
            break;
    }
}

void i2cSendAck(uint8_t i2cID)
{
    i2cWaitForIdle(i2cID);
    switch(i2cID)
    {
        case 1:
            I2C1CONbits.ACKDT = 0;
            I2C1CONbits.ACKEN = 1;
            while(I2C1CONbits.ACKEN);
            break;
        case 2:
            I2C2CONbits.ACKDT = 0;
            I2C2CONbits.ACKEN = 1;
            while(I2C2CONbits.ACKEN);
            break;
        default:
            break;
    }
}

void i2cSendNack(uint8_t i2cID)
{
    i2cWaitForIdle(i2cID);
    switch(i2cID)
    {
        case 1:
            I2C1CONbits.ACKDT = 1;
            I2C1CONbits.ACKEN = 1;
            while(I2C1CONbits.ACKEN);
            break;
        case 2:
            I2C1CONbits.ACKDT = 1;
            I2C1CONbits.ACKEN = 1;
            while(I2C1CONbits.ACKEN);
            break;
        default:
            break;
    }
}

void i2cWrite(uint8_t i2cID, uint8_t address, uint8_t waitAck)
{
    switch(i2cID)
    {
        case 1:
            I2C1TRN = address | 0;
            while (I2C1STATbits.TBF == 1);
            i2cWaitForIdle(i2cID);
            if (waitAck) while (I2C1STATbits.ACKSTAT == 1);
            break;
        case 2:
            I2C2TRN = address | 0;
            while (I2C2STATbits.TBF == 1);
            i2cWaitForIdle(i2cID);
            if (waitAck) while (I2C2STATbits.ACKSTAT == 1);
            break;
        default:
            break;
    }
}

uint8_t i2cRead(uint8_t i2cID, uint8_t ackNack)
{
    uint8_t data;
    
    switch(i2cID)
    {
        case 1:
            I2C1CONbits.RCEN = 1;
            while (I2C1CONbits.RCEN);
            while (!I2C1STATbits.RBF);
            data = I2C1RCV;
            break;
        case 2:
            I2C2CONbits.RCEN = 1;
            while (I2C2CONbits.RCEN);
            while (!I2C2STATbits.RBF);
            data = I2C2RCV;
            break;
        default:
            break;
    }

    if (ackNack)
        i2cSendAck(i2cID);
    else
        i2cSendNack(i2cID);
    
    return(data);
}

//******************************************************************************