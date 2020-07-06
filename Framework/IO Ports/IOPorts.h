//******************************************************************************
//                                IO PORTS
//
// Data:         22/06/2020
// Descrição:    Definições utilizadas para modularização de Portas de IO
// Dependências: Nenhuma
//******************************************************************************
#ifndef _IO_PORTS_
#define _IO_PORTS_

//******************************************************************************
// IDs
//******************************************************************************
//==============================================================================
// Portas
//==============================================================================
#define IO_PORTA                0x00
#define IO_PORTB                0x01
#define IO_PORTC                0x02
#define IO_PORTD                0x03
#define IO_PORTE                0x04
#define IO_PORTF                0x05
#define IO_PORTG                0x06

//==============================================================================
// Pinos
//==============================================================================
#define IO_A0                   0x0000
#define IO_A1                   0x0001
#define IO_A2                   0x0002
#define IO_A3                   0x0003
#define IO_A4                   0x0004
#define IO_A5                   0x0005
#define IO_A6                   0x0006
#define IO_A7                   0x0007
#define IO_A8                   0x0008
#define IO_A9                   0x0009
#define IO_A10                  0x000A
#define IO_A11                  0x000B
#define IO_A12                  0x000C
#define IO_A13                  0x000D
#define IO_A14                  0x000E
#define IO_A15                  0x000F

#define IO_B0                   0x0100
#define IO_B1                   0x0101
#define IO_B2                   0x0102
#define IO_B3                   0x0103
#define IO_B4                   0x0104
#define IO_B5                   0x0105
#define IO_B6                   0x0106
#define IO_B7                   0x0107
#define IO_B8                   0x0108
#define IO_B9                   0x0109
#define IO_B10                  0x010A
#define IO_B11                  0x010B
#define IO_B12                  0x010C
#define IO_B13                  0x010D
#define IO_B14                  0x010E
#define IO_B15                  0x010F

#define IO_C0                   0x0200
#define IO_C1                   0x0201
#define IO_C2                   0x0202
#define IO_C3                   0x0203
#define IO_C4                   0x0204
#define IO_C5                   0x0205
#define IO_C6                   0x0206
#define IO_C7                   0x0207
#define IO_C8                   0x0208
#define IO_C9                   0x0209
#define IO_C10                  0x020A
#define IO_C11                  0x020B
#define IO_C12                  0x020C
#define IO_C13                  0x020D
#define IO_C14                  0x020E
#define IO_C15                  0x020F

#define IO_D0                   0x0300
#define IO_D1                   0x0301
#define IO_D2                   0x0302
#define IO_D3                   0x0303
#define IO_D4                   0x0304
#define IO_D5                   0x0305
#define IO_D6                   0x0306
#define IO_D7                   0x0307
#define IO_D8                   0x0308
#define IO_D9                   0x0309
#define IO_D10                  0x030A
#define IO_D11                  0x030B
#define IO_D12                  0x030C
#define IO_D13                  0x030D
#define IO_D14                  0x030E
#define IO_D15                  0x030F

#define IO_E0                   0x0400
#define IO_E1                   0x0401
#define IO_E2                   0x0402
#define IO_E3                   0x0403
#define IO_E4                   0x0404
#define IO_E5                   0x0405
#define IO_E6                   0x0406
#define IO_E7                   0x0407
#define IO_E8                   0x0408
#define IO_E9                   0x0409
#define IO_E10                  0x040A
#define IO_E11                  0x040B
#define IO_E12                  0x040C
#define IO_E13                  0x040D
#define IO_E14                  0x040E
#define IO_E15                  0x040F

#define IO_F0                   0x0500
#define IO_F1                   0x0501
#define IO_F2                   0x0502
#define IO_F3                   0x0503
#define IO_F4                   0x0504
#define IO_F5                   0x0505
#define IO_F6                   0x0506
#define IO_F7                   0x0507
#define IO_F8                   0x0508
#define IO_F9                   0x0509
#define IO_F10                  0x050A
#define IO_F11                  0x050B
#define IO_F12                  0x050C
#define IO_F13                  0x050D
#define IO_F14                  0x050E
#define IO_F15                  0x050F

#define IO_G0                   0x0600
#define IO_G1                   0x0601
#define IO_G2                   0x0602
#define IO_G3                   0x0603
#define IO_G4                   0x0604
#define IO_G5                   0x0605
#define IO_G6                   0x0606
#define IO_G7                   0x0607
#define IO_G8                   0x0608
#define IO_G9                   0x0609
#define IO_G10                  0x060A
#define IO_G11                  0x060B
#define IO_G12                  0x060C
#define IO_G13                  0x060D
#define IO_G14                  0x060E
#define IO_G15                  0x060F

#define IO_UNDEFINED            0xFFFF

//==============================================================================
// Periféricos de saída
//==============================================================================
#define PPS_OUT_NO_CONNECT      0x00
#define PPS_OUT_U3TX            0x01
#define PPS_OUT_U4RTS           0x02
#define PPS_OUT_SDO1            0x05
#define PPS_OUT_SDO2            0x06
#define PPS_OUT_SDO3            0x07
#define PPS_OUT_SDO5            0x09
#define PPS_OUT_SS6             0x0A
#define PPS_OUT_OC3             0x0B
#define PPS_OUT_OC6             0x0C
#define PPS_OUT_REFCLKO4        0x0D
#define PPS_OUT_C2OUT           0x0E
#define PPS_OUT_C1TX            0x0F
#define PPS_OUT_U1TX            0x01
#define PPS_OUT_U2RTS           0x02
#define PPS_OUT_U5TX            0x03
#define PPS_OUT_U6RTS           0x04
#define PPS_OUT_SDO4            0x08
#define PPS_OUT_OC4             0x0B
#define PPS_OUT_OC7             0x0C
#define PPS_OUT_REFCLKO1        0x0F
#define PPS_OUT_U3RTS           0x01
#define PPS_OUT_U4TX            0x02
#define PPS_OUT_U6TX            0x04
#define PPS_OUT_SS1             0x05
#define PPS_OUT_SS3             0x07
#define PPS_OUT_SS4             0x08
#define PPS_OUT_SS5             0x09
#define PPS_OUT_SDO6            0x0A
#define PPS_OUT_OC5             0x0B
#define PPS_OUT_OC8             0x0C
#define PPS_OUT_C1OUT           0x0E
#define PPS_OUT_REFCLKO3        0x0F
#define PPS_OUT_U1RTS           0x01
#define PPS_OUT_U2TX            0x02
#define PPS_OUT_U5RTS           0x03
#define PPS_OUT_U6TX            0x04
#define PPS_OUT_SS2             0x06
#define PPS_OUT_SDO4            0x08
#define PPS_OUT_SDO6            0x0A
#define PPS_OUT_OC2             0x0B
#define PPS_OUT_OC1             0x0C
#define PPS_OUT_OC9             0x0D
#define PPS_OUT_C2TX            0x0F

//==============================================================================
// Periféricos de entrada
//==============================================================================
#define PPS_IN_INT3             0x00
#define PPS_IN_T2CK             0x01
#define PPS_IN_T6CK             0x02
#define PPS_IN_IC3              0x03
#define PPS_IN_IC7              0x04
#define PPS_IN_U1RX             0x05
#define PPS_IN_U2CTS            0x06
#define PPS_IN_U5RX             0x07
#define PPS_IN_U6CTS            0x08
#define PPS_IN_SDI1             0x09
#define PPS_IN_SDI3             0x0A
#define PPS_IN_SDI5             0x0B
#define PPS_IN_SS6              0x0C
#define PPS_IN_REFCLKI1         0x0D
#define PPS_IN_INT4             0x0E
#define PPS_IN_T5CK             0x0F
#define PPS_IN_T7CK             0x10
#define PPS_IN_IC4              0x11
#define PPS_IN_IC8              0x12
#define PPS_IN_U3RX             0x13
#define PPS_IN_U4CTS            0x14
#define PPS_IN_SDI2             0x15
#define PPS_IN_SDI4             0x16
#define PPS_IN_C1RX             0x17
#define PPS_IN_REFCLKI4         0x18
#define PPS_IN_INT2             0x19
#define PPS_IN_T3CK             0x1A
#define PPS_IN_T8CK             0x1B
#define PPS_IN_IC2              0x1C
#define PPS_IN_IC5              0x1D
#define PPS_IN_IC9              0x1E
#define PPS_IN_U1CTS            0x1F
#define PPS_IN_U2RX             0x20
#define PPS_IN_U5CTS            0x21
#define PPS_IN_SS1              0x22
#define PPS_IN_SS3              0x23
#define PPS_IN_SS4              0x24
#define PPS_IN_SS5              0x25
#define PPS_IN_C2RX             0x26
#define PPS_IN_INT1             0x27
#define PPS_IN_T4CK             0x28
#define PPS_IN_T9CK             0x29
#define PPS_IN_IC1              0x2A
#define PPS_IN_IC6              0x2B
#define PPS_IN_U3CTS            0x2C
#define PPS_IN_U4RX             0x2D
#define PPS_IN_U6RX             0x2E
#define PPS_IN_SS2              0x2F
#define PPS_IN_SDI6             0x30
#define PPS_IN_OCFA             0x31
#define PPS_IN_REFCLKI3         0x32

//******************************************************************************
// Outras definições
//******************************************************************************
#define IO_INPUT                1
#define IO_OUTPUT               0

#define IO_OPEN_DRAIN           1
#define IO_NORMAL_OUTPUT        0

#define PIN_ANALOG              1
#define PIN_DIGITAL             0

#define ENABLE_INTERRUPT        1
#define DISABLE_INTERRUPT       0

//******************************************************************************
// Estrutura para utilização de portas de IO
//******************************************************************************
typedef union
{
    uint16_t ID;
    struct
    {
        uint8_t Pin;
        uint8_t Port;
    };
} IOPort_t;

extern void setPinDirection(IOPort_t ioPort, uint8_t direction);
extern uint8_t getPinDirection(IOPort_t ioPort);
extern void setPinOpenDrainState(IOPort_t ioPort, uint8_t openDrainState);
extern void setPinAnalogState(IOPort_t ioPort, uint8_t analogState);
extern void writePin(IOPort_t ioPort, uint8_t state);
extern void invertPin(IOPort_t ioPort);
extern uint8_t readPin(IOPort_t ioPort);
extern void setOutputPinSelection(IOPort_t ioPort, uint8_t ppsOutputPeripheral);
extern uint8_t getOutputPinSelection(IOPort_t ioPort);
extern void setInputPinSelection(IOPort_t ioPort, uint8_t ppsInputPeripheral);
extern IOPort_t getInputPinSelection(uint8_t ppsInputPeripheral);
extern void setInterruptOnChange(IOPort_t ioPort, int8_t state);
extern void waitChangeEvent(IOPort_t ioPort);

#endif
//******************************************************************************