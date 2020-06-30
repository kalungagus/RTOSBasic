//******************************************************************************
//                                IO PORTS
//
// Data:         22/06/2020
// Descrição:    Definições utilizadas para modularização de Portas de IO
// Dependências: Nenhuma
//******************************************************************************
#include <xc.h>
#include "FreeRTOS.h"
#include "semphr.h"
#include "IOPorts.h"

//******************************************************************************
// Variáveis do módulo
//******************************************************************************
SemaphoreHandle_t inputOnChangeASemaphore = NULL;
SemaphoreHandle_t inputOnChangeBSemaphore = NULL;
SemaphoreHandle_t inputOnChangeCSemaphore = NULL;
SemaphoreHandle_t inputOnChangeDSemaphore = NULL;
SemaphoreHandle_t inputOnChangeESemaphore = NULL;
SemaphoreHandle_t inputOnChangeFSemaphore = NULL;
SemaphoreHandle_t inputOnChangeGSemaphore = NULL;

void setPinDirection(IOPort_t ioPort, uint8_t direction);
uint8_t getPinDirection(IOPort_t ioPort);
void setPinOpenDrainState(IOPort_t ioPort, uint8_t openDrainState);
void setPinAnalogState(IOPort_t ioPort, uint8_t analogState);
void writePin(IOPort_t ioPort, uint8_t state);
void invertPin(IOPort_t ioPort);
uint8_t readPin(IOPort_t ioPort);
void setOutputPinSelection(IOPort_t ioPort, uint8_t ppsOutputPeripheral);
uint8_t getOutputPinSelection(IOPort_t ioPort);
void setInputPinSelection(IOPort_t ioPort, uint8_t ppsInputPeripheral);
IOPort_t getInputPinSelection(uint8_t ppsInputPeripheral);
void setInterruptOnChange(IOPort_t ioPort, int8_t state);
void waitChangeEvent(IOPort_t ioPort);

//******************************************************************************
// Funções
//******************************************************************************
void setPinDirection(IOPort_t ioPort, uint8_t direction)
{
    switch(ioPort.Port)
    {
        case IO_PORTA:
            if(direction == IO_OUTPUT)
                TRISACLR = 1 << ioPort.Pin;
            else
                TRISASET = 1 << ioPort.Pin;
            break;
        case IO_PORTB:
            if(direction == IO_OUTPUT)
                TRISBCLR = 1 << ioPort.Pin;
            else
                TRISBSET = 1 << ioPort.Pin;
            break;
        case IO_PORTC:
            if(direction == IO_OUTPUT)
                TRISCCLR = 1 << ioPort.Pin;
            else
                TRISCSET = 1 << ioPort.Pin;
            break;
        case IO_PORTD:
            if(direction == IO_OUTPUT)
                TRISDCLR = 1 << ioPort.Pin;
            else
                TRISDSET = 1 << ioPort.Pin;
            break;
        case IO_PORTE:
            if(direction == IO_OUTPUT)
                TRISECLR = 1 << ioPort.Pin;
            else
                TRISESET = 1 << ioPort.Pin;
            break;
        case IO_PORTF:
            if(direction == IO_OUTPUT)
                TRISFCLR = 1 << ioPort.Pin;
            else
                TRISFSET = 1 << ioPort.Pin;
            break;
        case IO_PORTG:
            if(direction == IO_OUTPUT)
                TRISGCLR = 1 << ioPort.Pin;
            else
                TRISGSET = 1 << ioPort.Pin;
            break;
        default:
            break;
    }
}

uint8_t getPinDirection(IOPort_t ioPort)
{
    uint8_t direction;

    switch(ioPort.Port)
    {
        case IO_PORTA:
            direction = (TRISA & (1 << ioPort.Pin));
            break;
        case IO_PORTB:
            direction = (TRISB & (1 << ioPort.Pin));
            break;
        case IO_PORTC:
            direction = (TRISC & (1 << ioPort.Pin));
            break;
        case IO_PORTD:
            direction = (TRISD & (1 << ioPort.Pin));
            break;
        case IO_PORTE:
            direction = (TRISE & (1 << ioPort.Pin));
            break;
        case IO_PORTF:
            direction = (TRISF & (1 << ioPort.Pin));
            break;
        case IO_PORTG:
            direction = (TRISG & (1 << ioPort.Pin));
            break;
        default:
            break;
    }
    return(direction != 0);
}

void setPinOpenDrainState(IOPort_t ioPort, uint8_t openDrainState)
{
    switch(ioPort.Port)
    {
        case IO_PORTA:
            if(openDrainState == IO_NORMAL_OUTPUT)
                ODCACLR = 1 << ioPort.Pin;
            else
                ODCASET = 1 << ioPort.Pin;
            break;
        case IO_PORTB:
            if(openDrainState == IO_NORMAL_OUTPUT)
                ODCBCLR = 1 << ioPort.Pin;
            else
                ODCBSET = 1 << ioPort.Pin;
            break;
        case IO_PORTC:
            if(openDrainState == IO_NORMAL_OUTPUT)
                ODCCCLR = 1 << ioPort.Pin;
            else
                ODCCSET = 1 << ioPort.Pin;
            break;
        case IO_PORTD:
            if(openDrainState == IO_NORMAL_OUTPUT)
                ODCDCLR = 1 << ioPort.Pin;
            else
                ODCDSET = 1 << ioPort.Pin;
            break;
        case IO_PORTE:
            if(openDrainState == IO_NORMAL_OUTPUT)
                ODCECLR = 1 << ioPort.Pin;
            else
                ODCESET = 1 << ioPort.Pin;
            break;
        case IO_PORTF:
            if(openDrainState == IO_NORMAL_OUTPUT)
                ODCFCLR = 1 << ioPort.Pin;
            else
                ODCFSET = 1 << ioPort.Pin;
            break;
        case IO_PORTG:
            if(openDrainState == IO_NORMAL_OUTPUT)
                ODCGCLR = 1 << ioPort.Pin;
            else
                ODCGSET = 1 << ioPort.Pin;
            break;
        default:
            break;
    }
}

void setPinAnalogState(IOPort_t ioPort, uint8_t analogState)
{
    switch(ioPort.Port)
    {
        case IO_PORTA:
            if(analogState == PIN_ANALOG)
                ANSELASET = 1 << ioPort.Pin;
            else
                ANSELACLR = 1 << ioPort.Pin;
            break;
        case IO_PORTB:
            if(analogState == PIN_ANALOG)
                ANSELBSET = 1 << ioPort.Pin;
            else
                ANSELBCLR = 1 << ioPort.Pin;
            break;
        case IO_PORTC:
            if(analogState == PIN_ANALOG)
                ANSELCSET = 1 << ioPort.Pin;
            else
                ANSELCCLR = 1 << ioPort.Pin;
            break;
        case IO_PORTD:
            if(analogState == PIN_ANALOG)
                ANSELDSET = 1 << ioPort.Pin;
            else
                ANSELDCLR = 1 << ioPort.Pin;
            break;
        case IO_PORTE:
            if(analogState == PIN_ANALOG)
                ANSELESET = 1 << ioPort.Pin;
            else
                ANSELECLR = 1 << ioPort.Pin;
            break;
        case IO_PORTF:
            if(analogState == PIN_ANALOG)
                ANSELFSET = 1 << ioPort.Pin;
            else
                ANSELFCLR = 1 << ioPort.Pin;
            break;
        case IO_PORTG:
            if(analogState == PIN_ANALOG)
                ANSELGSET = 1 << ioPort.Pin;
            else
                ANSELGCLR = 1 << ioPort.Pin;
            break;
        default:
            break;
    }
}

void writePin(IOPort_t ioPort, uint8_t state)
{
    switch(ioPort.Port)
    {
        case IO_PORTA:
            if(state == 0)
                LATACLR = 1 << ioPort.Pin;
            else
                LATASET = 1 << ioPort.Pin;
            break;
        case IO_PORTB:
            if(state == 0)
                LATBCLR = 1 << ioPort.Pin;
            else
                LATBSET = 1 << ioPort.Pin;
            break;
        case IO_PORTC:
            if(state == 0)
                LATCCLR = 1 << ioPort.Pin;
            else
                LATCSET = 1 << ioPort.Pin;
            break;
        case IO_PORTD:
            if(state == 0)
                LATDCLR = 1 << ioPort.Pin;
            else
                LATDSET = 1 << ioPort.Pin;
            break;
        case IO_PORTE:
            if(state == 0)
                LATECLR = 1 << ioPort.Pin;
            else
                LATESET = 1 << ioPort.Pin;
            break;
        case IO_PORTF:
            if(state == 0)
                LATFCLR = 1 << ioPort.Pin;
            else
                LATFSET = 1 << ioPort.Pin;
            break;
        case IO_PORTG:
            if(state == 0)
                LATGCLR = 1 << ioPort.Pin;
            else
                LATGSET = 1 << ioPort.Pin;
            break;
        default:
            break;
    }
}

void invertPin(IOPort_t ioPort)
{
    switch(ioPort.Port)
    {
        case IO_PORTA:
            LATAINV = 1 << ioPort.Pin;
            break;
        case IO_PORTB:
            LATBINV = 1 << ioPort.Pin;
            break;
        case IO_PORTC:
            LATCINV = 1 << ioPort.Pin;
            break;
        case IO_PORTD:
            LATDINV = 1 << ioPort.Pin;
            break;
        case IO_PORTE:
            LATEINV = 1 << ioPort.Pin;
            break;
        case IO_PORTF:
            LATFINV = 1 << ioPort.Pin;
            break;
        case IO_PORTG:
            LATGINV = 1 << ioPort.Pin;
            break;
        default:
            break;
    }
}

uint8_t readPin(IOPort_t ioPort)
{
    uint16_t state;

    switch(ioPort.Port)
    {
        case IO_PORTA:
            state = (PORTA & (1 << ioPort.Pin));
            break;
        case IO_PORTB:
            state = (PORTB & (1 << ioPort.Pin));
            break;
        case IO_PORTC:
            state = (PORTC & (1 << ioPort.Pin));
            break;
        case IO_PORTD:
            state = (PORTD & (1 << ioPort.Pin));
            break;
        case IO_PORTE:
            state = (PORTE & (1 << ioPort.Pin));
            break;
        case IO_PORTF:
            state = (PORTF & (1 << ioPort.Pin));
            break;
        case IO_PORTG:
            state = (PORTG & (1 << ioPort.Pin));
            break;
        default:
            break;
    }
    return(state != 0);
}

void setOutputPinSelection(IOPort_t ioPort, uint8_t ppsOutputPeripheral)
{
    switch(ioPort.ID)
    {
        case IO_D2: RPD2R = ppsOutputPeripheral; break;
        case IO_G8: RPG8R = ppsOutputPeripheral; break;
        case IO_F4: RPF4R = ppsOutputPeripheral; break;
        case IO_D10: RPD10R = ppsOutputPeripheral; break;
        case IO_F1: RPF1R = ppsOutputPeripheral; break;
        case IO_B9: RPB9R = ppsOutputPeripheral; break;
        case IO_B10: RPB10R = ppsOutputPeripheral; break;
        case IO_C14: RPC14R = ppsOutputPeripheral; break;
        case IO_B5: RPB5R = ppsOutputPeripheral; break;
        case IO_C1: RPC1R = ppsOutputPeripheral; break;
        case IO_D14: RPD14R = ppsOutputPeripheral; break;
        case IO_G1: RPG1R = ppsOutputPeripheral; break;
        case IO_A14: RPA14R = ppsOutputPeripheral; break;
        case IO_D3: RPD3R = ppsOutputPeripheral; break;
        case IO_G7: RPG7R = ppsOutputPeripheral; break;
        case IO_F5: RPF5R = ppsOutputPeripheral; break;
        case IO_D11: RPD11R = ppsOutputPeripheral; break;
        case IO_F0: RPF0R = ppsOutputPeripheral; break;
        case IO_B1: RPB1R = ppsOutputPeripheral; break;
        case IO_E5: RPE5R = ppsOutputPeripheral; break;
        case IO_C13: RPC13R = ppsOutputPeripheral; break;
        case IO_B3: RPB3R = ppsOutputPeripheral; break;
        case IO_C4: RPC4R = ppsOutputPeripheral; break;
        case IO_D15: RPD15R = ppsOutputPeripheral; break;
        case IO_G0: RPG0R = ppsOutputPeripheral; break;
        case IO_A15: RPA15R = ppsOutputPeripheral; break;
        case IO_D9: RPD9R = ppsOutputPeripheral; break;
        case IO_G6: RPG6R = ppsOutputPeripheral; break;
        case IO_B8: RPB8R = ppsOutputPeripheral; break;
        case IO_B15: RPB15R = ppsOutputPeripheral; break;
        case IO_D4: RPD4R = ppsOutputPeripheral; break;
        case IO_B0: RPB0R = ppsOutputPeripheral; break;
        case IO_E3: RPE3R = ppsOutputPeripheral; break;
        case IO_B7: RPB7R = ppsOutputPeripheral; break;
        case IO_F12: RPF12R = ppsOutputPeripheral; break;
        case IO_D12: RPD12R = ppsOutputPeripheral; break;
        case IO_F8: RPF8R = ppsOutputPeripheral; break;
        case IO_C3: RPC3R = ppsOutputPeripheral; break;
        case IO_E9: RPE9R = ppsOutputPeripheral; break;
        case IO_D1: RPD1R = ppsOutputPeripheral; break;
        case IO_G9: RPG9R = ppsOutputPeripheral; break;
        case IO_B14: RPB14R = ppsOutputPeripheral; break;
        case IO_D0: RPD0R = ppsOutputPeripheral; break;
        case IO_B6: RPB6R = ppsOutputPeripheral; break;
        case IO_D5: RPD5R = ppsOutputPeripheral; break;
        case IO_B2: RPB2R = ppsOutputPeripheral; break;
        case IO_F3: RPF3R = ppsOutputPeripheral; break;
        case IO_F13: RPF13R = ppsOutputPeripheral; break;
        case IO_C2: RPC2R = ppsOutputPeripheral; break;
        case IO_E8: RPE8R = ppsOutputPeripheral; break;
        case IO_F2: RPF2R = ppsOutputPeripheral; break;
        default: break;
    }
}

uint8_t getOutputPinSelection(IOPort_t ioPort)
{
    switch(ioPort.ID)
    {
        case IO_D2: return(RPD2R);
        case IO_G8: return(RPG8R);
        case IO_F4: return(RPF4R);
        case IO_D10: return(RPD10R);
        case IO_F1: return(RPF1R);
        case IO_B9: return(RPB9R);
        case IO_B10: return(RPB10R);
        case IO_C14: return(RPC14R);
        case IO_B5: return(RPB5R);
        case IO_C1: return(RPC1R);
        case IO_D14: return(RPD14R);
        case IO_G1: return(RPG1R);
        case IO_A14: return(RPA14R);
        case IO_D3: return(RPD3R);
        case IO_G7: return(RPG7R);
        case IO_F5: return(RPF5R);
        case IO_D11: return(RPD11R);
        case IO_F0: return(RPF0R);
        case IO_B1: return(RPB1R);
        case IO_E5: return(RPE5R);
        case IO_C13: return(RPC13R);
        case IO_B3: return(RPB3R);
        case IO_C4: return(RPC4R);
        case IO_D15: return(RPD15R);
        case IO_G0: return(RPG0R);
        case IO_A15: return(RPA15R);
        case IO_D9: return(RPD9R);
        case IO_G6: return(RPG6R);
        case IO_B8: return(RPB8R);
        case IO_B15: return(RPB15R);
        case IO_D4: return(RPD4R);
        case IO_B0: return(RPB0R);
        case IO_E3: return(RPE3R);
        case IO_B7: return(RPB7R);
        case IO_F12: return(RPF12R);
        case IO_D12: return(RPD12R);
        case IO_F8: return(RPF8R);
        case IO_C3: return(RPC3R);
        case IO_E9: return(RPE9R);
        case IO_D1: return(RPD1R);
        case IO_G9: return(RPG9R);
        case IO_B14: return(RPB14R);
        case IO_D0: return(RPD0R);
        case IO_B6: return(RPB6R);
        case IO_D5: return(RPD5R);
        case IO_B2: return(RPB2R);
        case IO_F3: return(RPF3R);
        case IO_F13: return(RPF13R);
        case IO_C2: return(RPC2R);
        case IO_E8: return(RPE8R);
        case IO_F2: return(RPF2R);
        default: break;
    }
    return(PPS_OUT_NO_CONNECT);
}

void setInputPinSelection(IOPort_t ioPort, uint8_t ppsInputPeripheral)
{
    uint8_t selectedPortValue;
    switch(ioPort.ID)
    {
        case IO_D2:
        case IO_D3:
        case IO_D9:
        case IO_D1:
            selectedPortValue = 0x00;
            break;
        case IO_G8:
        case IO_G7:
        case IO_G6:
        case IO_G9:
            selectedPortValue = 0x01;
            break;
        case IO_F4:
        case IO_F5:
        case IO_B8:
        case IO_B14:
            selectedPortValue = 0x02;
            break;
        case IO_D10:
        case IO_D11:
        case IO_B15:
        case IO_D0:
            selectedPortValue = 0x03;
            break;
        case IO_F1:
        case IO_F0:
        case IO_D4:
            selectedPortValue = 0x04;
            break;
        case IO_B9:
        case IO_B1:
        case IO_B0:
        case IO_B6:
            selectedPortValue = 0x05;
            break;
        case IO_B10:
        case IO_E5:
        case IO_E3:
        case IO_D5:
            selectedPortValue = 0x06;
            break;
        case IO_C14:
        case IO_C13:
        case IO_B7:
        case IO_B2:
            selectedPortValue = 0x07;
            break;
        case IO_B5:
        case IO_B3:
        case IO_F3:
            selectedPortValue = 0x08;
            break;
        case IO_F12:
        case IO_F13:
            selectedPortValue = 0x09;
            break;
        case IO_C1:
        case IO_C4:
        case IO_D12:
            selectedPortValue = 0x0A;
            break;
        case IO_D14:
        case IO_D15:
        case IO_F8:
        case IO_F2:
            selectedPortValue = 0x0B;
            break;
        case IO_G1:
        case IO_G0:
        case IO_C3:
        case IO_C2:
            selectedPortValue = 0x0C;
            break;
        case IO_A14:
        case IO_A15:
        case IO_E9:
        case IO_E8:
            selectedPortValue = 0x0D;
            break;
        default: break;
    }
    switch(ppsInputPeripheral)
    {
        case PPS_IN_INT3: INT3R = selectedPortValue; break;
        case PPS_IN_T2CK: T2CKR = selectedPortValue; break;
        case PPS_IN_T6CK: T6CKR = selectedPortValue; break;
        case PPS_IN_IC3: IC3R = selectedPortValue; break;
        case PPS_IN_IC7: IC7R = selectedPortValue; break;
        case PPS_IN_U1RX: U1RXR = selectedPortValue; break;
        case PPS_IN_U2CTS: U2CTSR = selectedPortValue; break;
        case PPS_IN_U5RX: U5RXR = selectedPortValue; break;
        case PPS_IN_U6CTS: U6CTSR = selectedPortValue; break;
        case PPS_IN_SDI1: SDI1R = selectedPortValue; break;
        case PPS_IN_SDI3: SDI3R = selectedPortValue; break;
        case PPS_IN_SDI5: SDI5R = selectedPortValue; break;
        case PPS_IN_SS6: SS6R = selectedPortValue; break;
        case PPS_IN_REFCLKI1: REFCLKI1R = selectedPortValue; break;
        case PPS_IN_INT4: INT4R = selectedPortValue; break;
        case PPS_IN_T5CK: T5CKR = selectedPortValue; break;
        case PPS_IN_T7CK: T7CKR = selectedPortValue; break;
        case PPS_IN_IC4: IC4R = selectedPortValue; break;
        case PPS_IN_IC8: IC8R = selectedPortValue; break;
        case PPS_IN_U3RX: U3RXR = selectedPortValue; break;
        case PPS_IN_U4CTS: U4CTSR = selectedPortValue; break;
        case PPS_IN_SDI2: SDI2R = selectedPortValue; break;
        case PPS_IN_SDI4: SDI4R = selectedPortValue; break;
        case PPS_IN_C1RX: C1RXR = selectedPortValue; break;
        case PPS_IN_REFCLKI4: REFCLKI4R = selectedPortValue; break;
        case PPS_IN_INT2: INT2R = selectedPortValue; break;
        case PPS_IN_T3CK: T3CKR = selectedPortValue; break;
        case PPS_IN_T8CK: T8CKR = selectedPortValue; break;
        case PPS_IN_IC2: IC2R = selectedPortValue; break;
        case PPS_IN_IC5: IC5R = selectedPortValue; break;
        case PPS_IN_IC9: IC9R = selectedPortValue; break;
        case PPS_IN_U1CTS: U1CTSR = selectedPortValue; break;
        case PPS_IN_U2RX: U2RXR = selectedPortValue; break;
        case PPS_IN_U5CTS: U5CTSR = selectedPortValue; break;
        case PPS_IN_SS1: SS1R = selectedPortValue; break;
        case PPS_IN_SS3: SS3R = selectedPortValue; break;
        case PPS_IN_SS4: SS4R = selectedPortValue; break;
        case PPS_IN_SS5: SS5R = selectedPortValue; break;
        case PPS_IN_C2RX: C2RXR = selectedPortValue; break;
        case PPS_IN_INT1: INT1R = selectedPortValue; break;
        case PPS_IN_T4CK: T4CKR = selectedPortValue; break;
        case PPS_IN_T9CK: T9CKR = selectedPortValue; break;
        case PPS_IN_IC1: IC1R = selectedPortValue; break;
        case PPS_IN_IC6: IC6R = selectedPortValue; break;
        case PPS_IN_U3CTS: U3CTSR = selectedPortValue; break;
        case PPS_IN_U4RX: U4RXR = selectedPortValue; break;
        case PPS_IN_U6RX: U6RXR = selectedPortValue; break;
        case PPS_IN_SS2: SS2R = selectedPortValue; break;
        case PPS_IN_SDI6: SDI6R = selectedPortValue; break;
        case PPS_IN_OCFA: OCFAR = selectedPortValue; break;
        case PPS_IN_REFCLKI3: REFCLKI3R = selectedPortValue; break;
        default: break;
    }
}

IOPort_t getInputPinSelection(uint8_t ppsInputPeripheral)
{
    IOPort_t ioPort;
    uint8_t selectedPortValue;
    
    switch(ppsInputPeripheral)
    {
        case PPS_IN_INT3: selectedPortValue = INT3R; break;
        case PPS_IN_T2CK: selectedPortValue = T2CKR; break;
        case PPS_IN_T6CK: selectedPortValue = T6CKR; break;
        case PPS_IN_IC3: selectedPortValue = IC3R; break;
        case PPS_IN_IC7: selectedPortValue = IC7R; break;
        case PPS_IN_U1RX: selectedPortValue = U1RXR; break;
        case PPS_IN_U2CTS: selectedPortValue = U2CTSR; break;
        case PPS_IN_U5RX: selectedPortValue = U5RXR; break;
        case PPS_IN_U6CTS: selectedPortValue = U6CTSR; break;
        case PPS_IN_SDI1: selectedPortValue = SDI1R; break;
        case PPS_IN_SDI3: selectedPortValue = SDI3R; break;
        case PPS_IN_SDI5: selectedPortValue = SDI5R; break;
        case PPS_IN_SS6: selectedPortValue = SS6R; break;
        case PPS_IN_REFCLKI1: selectedPortValue = REFCLKI1R; break;
        case PPS_IN_INT4: selectedPortValue = INT4R; break;
        case PPS_IN_T5CK: selectedPortValue = T5CKR; break;
        case PPS_IN_T7CK: selectedPortValue = T7CKR; break;
        case PPS_IN_IC4: selectedPortValue = IC4R; break;
        case PPS_IN_IC8: selectedPortValue = IC8R; break;
        case PPS_IN_U3RX: selectedPortValue = U3RXR; break;
        case PPS_IN_U4CTS: selectedPortValue = U4CTSR; break;
        case PPS_IN_SDI2: selectedPortValue = SDI2R; break;
        case PPS_IN_SDI4: selectedPortValue = SDI4R; break;
        case PPS_IN_C1RX: selectedPortValue = C1RXR; break;
        case PPS_IN_REFCLKI4: selectedPortValue = REFCLKI4R; break;
        case PPS_IN_INT2: selectedPortValue = INT2R; break;
        case PPS_IN_T3CK: selectedPortValue = T3CKR; break;
        case PPS_IN_T8CK: selectedPortValue = T8CKR; break;
        case PPS_IN_IC2: selectedPortValue = IC2R; break;
        case PPS_IN_IC5: selectedPortValue = IC5R; break;
        case PPS_IN_IC9: selectedPortValue = IC9R; break;
        case PPS_IN_U1CTS: selectedPortValue = U1CTSR; break;
        case PPS_IN_U2RX: selectedPortValue = U2RXR; break;
        case PPS_IN_U5CTS: selectedPortValue = U5CTSR; break;
        case PPS_IN_SS1: selectedPortValue = SS1R; break;
        case PPS_IN_SS3: selectedPortValue = SS3R; break;
        case PPS_IN_SS4: selectedPortValue = SS4R; break;
        case PPS_IN_SS5: selectedPortValue = SS5R; break;
        case PPS_IN_C2RX: selectedPortValue = C2RXR; break;
        case PPS_IN_INT1: selectedPortValue = INT1R; break;
        case PPS_IN_T4CK: selectedPortValue = T4CKR; break;
        case PPS_IN_T9CK: selectedPortValue = T9CKR; break;
        case PPS_IN_IC1: selectedPortValue = IC1R; break;
        case PPS_IN_IC6: selectedPortValue = IC6R; break;
        case PPS_IN_U3CTS: selectedPortValue = U3CTSR; break;
        case PPS_IN_U4RX: selectedPortValue = U4RXR; break;
        case PPS_IN_U6RX: selectedPortValue = U6RXR; break;
        case PPS_IN_SS2: selectedPortValue = SS2R; break;
        case PPS_IN_SDI6: selectedPortValue = SDI6R; break;
        case PPS_IN_OCFA: selectedPortValue = OCFAR; break;
        case PPS_IN_REFCLKI3: selectedPortValue = REFCLKI3R; break;
        default: break;
    }
    
    switch(ppsInputPeripheral)
    {
        case PPS_IN_INT3:
        case PPS_IN_T2CK:
        case PPS_IN_T6CK:
        case PPS_IN_IC3:
        case PPS_IN_IC7:
        case PPS_IN_U1RX:
        case PPS_IN_U2CTS:
        case PPS_IN_U5RX:
        case PPS_IN_U6CTS:
        case PPS_IN_SDI1:
        case PPS_IN_SDI3:
        case PPS_IN_SDI5:
        case PPS_IN_SS6:
        case PPS_IN_REFCLKI1:
            switch(selectedPortValue)
            {
                case 0x00: ioPort.ID = IO_D2; break;
                case 0x01: ioPort.ID = IO_G8; break;
                case 0x02: ioPort.ID = IO_F4; break;
                case 0x03: ioPort.ID = IO_D10; break;
                case 0x04: ioPort.ID = IO_F1; break;
                case 0x05: ioPort.ID = IO_B9; break;
                case 0x06: ioPort.ID = IO_B10; break;
                case 0x07: ioPort.ID = IO_C14; break;
                case 0x08: ioPort.ID = IO_B5; break;
                case 0x09: ioPort.ID = IO_UNDEFINED; break;
                case 0x0A: ioPort.ID = IO_C1; break;
                case 0x0B: ioPort.ID = IO_D14; break;
                case 0x0C: ioPort.ID = IO_G1; break;
                case 0x0D: ioPort.ID = IO_A14; break;
                case 0x0E: ioPort.ID = IO_D6; break;
                case 0x0F: ioPort.ID = IO_UNDEFINED; break;
                default: break;
            }
            break;
        case PPS_IN_INT4:
        case PPS_IN_T5CK:
        case PPS_IN_T7CK:
        case PPS_IN_IC4:
        case PPS_IN_IC8:
        case PPS_IN_U3RX:
        case PPS_IN_U4CTS:
        case PPS_IN_SDI2:
        case PPS_IN_SDI4:
        case PPS_IN_C1RX:
        case PPS_IN_REFCLKI4:
            switch(selectedPortValue)
            {
                case 0x00: ioPort.ID = IO_D3; break;
                case 0x01: ioPort.ID = IO_G7; break;
                case 0x02: ioPort.ID = IO_F5; break;
                case 0x03: ioPort.ID = IO_D11; break;
                case 0x04: ioPort.ID = IO_F0; break;
                case 0x05: ioPort.ID = IO_B1; break;
                case 0x06: ioPort.ID = IO_E5; break;
                case 0x07: ioPort.ID = IO_C13; break;
                case 0x08: ioPort.ID = IO_B3; break;
                case 0x09: ioPort.ID = IO_UNDEFINED; break;
                case 0x0A: ioPort.ID = IO_C4; break;
                case 0x0B: ioPort.ID = IO_D15; break;
                case 0x0C: ioPort.ID = IO_G0; break;
                case 0x0D: ioPort.ID = IO_A15; break;
                case 0x0E: ioPort.ID = IO_D7; break;
                case 0x0F: ioPort.ID = IO_UNDEFINED; break;
                default: break;
            }
            break;
        case PPS_IN_INT2:
        case PPS_IN_T3CK:
        case PPS_IN_T8CK:
        case PPS_IN_IC2:
        case PPS_IN_IC5:
        case PPS_IN_IC9:
        case PPS_IN_U1CTS:
        case PPS_IN_U2RX:
        case PPS_IN_U5CTS:
        case PPS_IN_SS1:
        case PPS_IN_SS3:
        case PPS_IN_SS4:
        case PPS_IN_SS5:
        case PPS_IN_C2RX:
            switch(selectedPortValue)
            {
                case 0x00: ioPort.ID = IO_D9; break;
                case 0x01: ioPort.ID = IO_G6; break;
                case 0x02: ioPort.ID = IO_B8; break;
                case 0x03: ioPort.ID = IO_B15; break;
                case 0x04: ioPort.ID = IO_D4; break;
                case 0x05: ioPort.ID = IO_B0; break;
                case 0x06: ioPort.ID = IO_E3; break;
                case 0x07: ioPort.ID = IO_B7; break;
                case 0x08: ioPort.ID = IO_UNDEFINED; break;
                case 0x09: ioPort.ID = IO_F12; break;
                case 0x0A: ioPort.ID = IO_D12; break;
                case 0x0B: ioPort.ID = IO_F8; break;
                case 0x0C: ioPort.ID = IO_C3; break;
                case 0x0D: ioPort.ID = IO_E9; break;
                case 0x0E: ioPort.ID = IO_UNDEFINED; break;
                case 0x0F: ioPort.ID = IO_UNDEFINED; break;
                default: break;
            }
            break;
        case PPS_IN_INT1:
        case PPS_IN_T4CK:
        case PPS_IN_T9CK:
        case PPS_IN_IC1:
        case PPS_IN_IC6:
        case PPS_IN_U3CTS:
        case PPS_IN_U4RX:
        case PPS_IN_U6RX:
        case PPS_IN_SS2:
        case PPS_IN_SDI6:
        case PPS_IN_OCFA:
        case PPS_IN_REFCLKI3: 
            switch(selectedPortValue)
            {
                case 0x00: ioPort.ID = IO_D1; break;
                case 0x01: ioPort.ID = IO_G9; break;
                case 0x02: ioPort.ID = IO_B14; break;
                case 0x03: ioPort.ID = IO_D0; break;
                case 0x04: ioPort.ID = IO_UNDEFINED; break;
                case 0x05: ioPort.ID = IO_B6; break;
                case 0x06: ioPort.ID = IO_D5; break;
                case 0x07: ioPort.ID = IO_B2; break;
                case 0x08: ioPort.ID = IO_F3; break;
                case 0x09: ioPort.ID = IO_F13; break;
                case 0x0A: ioPort.ID = IO_UNDEFINED; break;
                case 0x0B: ioPort.ID = IO_F2; break;
                case 0x0C: ioPort.ID = IO_C2; break;
                case 0x0D: ioPort.ID = IO_E8; break;
                case 0x0E: ioPort.ID = IO_UNDEFINED; break;
                case 0x0F: ioPort.ID = IO_UNDEFINED; break;
                default: break;
            }
            break;
        default: break;
    }
    return(ioPort);
}

void setInterruptOnChange(IOPort_t ioPort, int8_t state)
{
    switch(ioPort.Port)
    {
        case IO_PORTA:
            if(state == DISABLE_INTERRUPT)
                CNENACLR = 1 << ioPort.Pin;
            else
                CNENASET = 1 << ioPort.Pin;
            if(CNENA != 0)
            {
                CNCONAbits.ON = 1;
                IPC29bits.CNAIP = 1;
                IPC29bits.CNAIS = 1;
                IEC3bits.CNAIE = 1;
            }
            if(inputOnChangeASemaphore == NULL)
                inputOnChangeASemaphore = xSemaphoreCreateBinary();
            break;
        case IO_PORTB:
            if(state == DISABLE_INTERRUPT)
                CNENBCLR = 1 << ioPort.Pin;
            else
                CNENBSET = 1 << ioPort.Pin;
            if(CNENA != 0)
            {
                CNCONBbits.ON = 1;
                IPC29bits.CNBIP = 1;
                IPC29bits.CNBIS = 1;
                IEC3bits.CNBIE = 1;
            }
            if(inputOnChangeBSemaphore == NULL)
                inputOnChangeBSemaphore = xSemaphoreCreateBinary();
            break;
        case IO_PORTC:
            if(state == DISABLE_INTERRUPT)
                CNENCCLR = 1 << ioPort.Pin;
            else
                CNENCSET = 1 << ioPort.Pin;
            if(CNENA != 0)
            {
                CNCONCbits.ON = 1;
                IPC30bits.CNCIP = 1;
                IPC30bits.CNCIS = 1;
                IEC3bits.CNCIE = 1;
            }
            if(inputOnChangeCSemaphore == NULL)
                inputOnChangeCSemaphore = xSemaphoreCreateBinary();
            break;
        case IO_PORTD:
            if(state == DISABLE_INTERRUPT)
                CNENDCLR = 1 << ioPort.Pin;
            else
                CNENDSET = 1 << ioPort.Pin;
            if(CNENA != 0)
            {
                CNCONDbits.ON = 1;
                IPC30bits.CNDIP = 1;
                IPC30bits.CNDIS = 1;
                IEC3bits.CNDIE = 1;
            }
            if(inputOnChangeDSemaphore == NULL)
                inputOnChangeDSemaphore = xSemaphoreCreateBinary();
            break;
        case IO_PORTE:
            if(state == DISABLE_INTERRUPT)
                CNENECLR = 1 << ioPort.Pin;
            else
                CNENESET = 1 << ioPort.Pin;
            if(CNENA != 0)
            {
                CNCONEbits.ON = 1;
                IPC30bits.CNEIP = 1;
                IPC30bits.CNEIS = 1;
                IEC3bits.CNEIE = 1;
            }
            if(inputOnChangeESemaphore == NULL)
                inputOnChangeESemaphore = xSemaphoreCreateBinary();
            break;
        case IO_PORTF:
            if(state == DISABLE_INTERRUPT)
                CNENFCLR = 1 << ioPort.Pin;
            else
                CNENFSET = 1 << ioPort.Pin;
            if(CNENA != 0)
            {
                CNCONFbits.ON = 1;
                IPC30bits.CNFIP = 1;
                IPC30bits.CNFIS = 1;
                IEC3bits.CNFIE = 1;
            }
            if(inputOnChangeFSemaphore == NULL)
                inputOnChangeFSemaphore = xSemaphoreCreateBinary();
            break;
        case IO_PORTG:
            if(state == DISABLE_INTERRUPT)
                CNENGCLR = 1 << ioPort.Pin;
            else
                CNENGSET = 1 << ioPort.Pin;
            if(CNENG != 0)
            {
                CNCONGbits.ON = 1;
                IPC31bits.CNGIP = 1;
                IPC31bits.CNGIS = 1;
                IEC3bits.CNGIE = 1;
            }
            if(inputOnChangeGSemaphore == NULL)
                inputOnChangeGSemaphore = xSemaphoreCreateBinary();
            break;
        default:
            break;
    }
}

void waitChangeEvent(IOPort_t ioPort)
{
    switch(ioPort.Port)
    {
        case IO_PORTA:
            xSemaphoreTake(inputOnChangeASemaphore, portMAX_DELAY);
            break;
        case IO_PORTB:
            xSemaphoreTake(inputOnChangeBSemaphore, portMAX_DELAY);
            break;
        case IO_PORTC:
            xSemaphoreTake(inputOnChangeCSemaphore, portMAX_DELAY);
            break;
        case IO_PORTD:
            xSemaphoreTake(inputOnChangeDSemaphore, portMAX_DELAY);
            break;
        case IO_PORTE:
            xSemaphoreTake(inputOnChangeESemaphore, portMAX_DELAY);
            break;
        case IO_PORTF:
            xSemaphoreTake(inputOnChangeFSemaphore, portMAX_DELAY);
            break;
        case IO_PORTG:
            xSemaphoreTake(inputOnChangeGSemaphore, portMAX_DELAY);
            break;
        default:
            break;
    }
}

//******************************************************************************
// Interrupções
//******************************************************************************
void __attribute__((interrupt(IPL0AUTO), vector(_CHANGE_NOTICE_A_VECTOR))) vChangeNoticeAInterruptWrapper( void );

void vChangeNoticeAInterruptHandler(void)
{
    BaseType_t xHigherPriorityTaskWoken = pdFALSE;
    int32_t status;
    
    status = PORTA;
    IFS3bits.CNAIF = 0;
    xSemaphoreGiveFromISR(inputOnChangeASemaphore, &xHigherPriorityTaskWoken);
    portEND_SWITCHING_ISR(xHigherPriorityTaskWoken);
}

void __attribute__((interrupt(IPL0AUTO), vector(_CHANGE_NOTICE_B_VECTOR))) vChangeNoticeBInterruptWrapper( void );

void vChangeNoticeBInterruptHandler(void)
{
    BaseType_t xHigherPriorityTaskWoken = pdFALSE;
    int32_t status;
    
    status = PORTB;
    IFS3bits.CNBIF = 0;
    xSemaphoreGiveFromISR(inputOnChangeBSemaphore, &xHigherPriorityTaskWoken);
    portEND_SWITCHING_ISR(xHigherPriorityTaskWoken);
}

void __attribute__((interrupt(IPL0AUTO), vector(_CHANGE_NOTICE_C_VECTOR))) vChangeNoticeCInterruptWrapper( void );

void vChangeNoticeCInterruptHandler(void)
{
    BaseType_t xHigherPriorityTaskWoken = pdFALSE;
    int32_t status;
    
    status = PORTC;
    IFS3bits.CNCIF = 0;
    xSemaphoreGiveFromISR(inputOnChangeCSemaphore, &xHigherPriorityTaskWoken);
    portEND_SWITCHING_ISR(xHigherPriorityTaskWoken);
}

void __attribute__((interrupt(IPL0AUTO), vector(_CHANGE_NOTICE_D_VECTOR))) vChangeNoticeDInterruptWrapper( void );

void vChangeNoticeDInterruptHandler(void)
{
    BaseType_t xHigherPriorityTaskWoken = pdFALSE;
    int32_t status;
    
    status = PORTD;
    IFS3bits.CNDIF = 0;
    xSemaphoreGiveFromISR(inputOnChangeDSemaphore, &xHigherPriorityTaskWoken);
    portEND_SWITCHING_ISR(xHigherPriorityTaskWoken);
}

void __attribute__((interrupt(IPL0AUTO), vector(_CHANGE_NOTICE_E_VECTOR))) vChangeNoticeEInterruptWrapper( void );

void vChangeNoticeEInterruptHandler(void)
{
    BaseType_t xHigherPriorityTaskWoken = pdFALSE;
    int32_t status;
    
    status = PORTE;
    IFS3bits.CNEIF = 0;
    xSemaphoreGiveFromISR(inputOnChangeESemaphore, &xHigherPriorityTaskWoken);
    portEND_SWITCHING_ISR(xHigherPriorityTaskWoken);
}

void __attribute__((interrupt(IPL0AUTO), vector(_CHANGE_NOTICE_F_VECTOR))) vChangeNoticeFInterruptWrapper( void );

void vChangeNoticeFInterruptHandler(void)
{
    BaseType_t xHigherPriorityTaskWoken = pdFALSE;
    int32_t status;
    
    status = PORTF;
    IFS3bits.CNFIF = 0;
    xSemaphoreGiveFromISR(inputOnChangeFSemaphore, &xHigherPriorityTaskWoken);
    portEND_SWITCHING_ISR(xHigherPriorityTaskWoken);
}

void __attribute__((interrupt(IPL0AUTO), vector(_CHANGE_NOTICE_G_VECTOR))) vChangeNoticeGInterruptWrapper( void );

void vChangeNoticeGInterruptHandler(void)
{
    BaseType_t xHigherPriorityTaskWoken = pdFALSE;
    int32_t status;
    
    status = PORTG;
    IFS3bits.CNGIF = 0;
    xSemaphoreGiveFromISR(inputOnChangeGSemaphore, &xHigherPriorityTaskWoken);
    portEND_SWITCHING_ISR(xHigherPriorityTaskWoken);
}

//******************************************************************************