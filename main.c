//******************************************************************************
//                                MAIN
//
// Data:       01/04/2020
// Descrição:  Ponto de entrada do projeto
//******************************************************************************

// <editor-fold defaultstate="collapsed" desc="PIC32MZ2048EFM100 Configuration Bit Settings">
//******************************************************************************
// PIC32MZ2048EFM100 Configuration Bit Settings
// Descrição: Setando o oscilador padrão para o cristal externo com PLL 
//            (FNOSC = SPLL), temos ainda que definir que a entrada do PLL é
//            o POSC (FPLLICLK = PLL_POSC).
//            O Clock da placa (24MHz) é então dividido por 3 na PLL
//            (FPLLIDIV = DIV_3) para termos um clock de 8MHz, que definimos na
//            faixa de 5 a 10MHz (FPLLRNG = RANGE_5_10_MHZ). Este por sua vez
//            é multiplicado por 50, para obtermos o clock de 200MHz
//            (FPLLMULT = MUL_50).
//******************************************************************************
// DEVCFG3
#pragma config USERID = 0xFFFF          // Enter Hexadecimal value (Enter Hexadecimal value)
#pragma config FMIIEN = OFF             // Ethernet RMII/MII Enable (MII Enabled)
#pragma config FETHIO = ON              // Ethernet I/O Pin Select (Default Ethernet I/O)
#pragma config PGL1WAY = ON            // Permission Group Lock One Way Configuration (Allow multiple reconfigurations)
#pragma config PMDL1WAY = ON            // Peripheral Module Disable Configuration (Allow only one reconfiguration)
#pragma config IOL1WAY = ON             // Peripheral Pin Select Configuration (Allow only one reconfiguration)
#pragma config FUSBIDIO = ON            // USB USBID Selection (Controlled by the USB Module)

// DEVCFG2
#pragma config FPLLIDIV = DIV_3         // System PLL Input Divider (3x Divider)
#pragma config FPLLRNG = RANGE_5_10_MHZ // System PLL Input Range (5-10 MHz Input)
#pragma config FPLLICLK = PLL_POSC      // System PLL Input Clock Selection (POSC is input to the System PLL)
#pragma config FPLLMULT = MUL_50        // System PLL Multiplier (PLL Multiply by 50)
#pragma config FPLLODIV = DIV_2         // System PLL Output Clock Divider (2x Divider)
#pragma config UPLLFSEL = FREQ_24MHZ    // USB PLL Input Frequency Selection (USB PLL input is 24 MHz)

// DEVCFG1
#pragma config FNOSC = SPLL             // Oscillator Selection Bits (System PLL)
#pragma config DMTINTV = WIN_127_128    // DMT Count Window Interval (Window/Interval value is 127/128 counter value)
#pragma config FSOSCEN = OFF            // Secondary Oscillator Enable (Enable SOSC)
#pragma config IESO = OFF               // Internal/External Switch Over (Enabled)
#pragma config POSCMOD = EC             // Primary Oscillator Configuration (External clock mode)
#pragma config OSCIOFNC = OFF           // CLKO Output Signal Active on the OSCO Pin (Enabled)
#pragma config FCKSM = CSECME           // Clock Switching and Monitor Selection (Clock Switch Enabled, FSCM Enabled)
#pragma config WDTPS = PS1048576        // Watchdog Timer Postscaler (1:1048576)
#pragma config WDTSPGM = STOP           // Watchdog Timer Stop During Flash Programming (WDT stops during Flash programming)
#pragma config WINDIS = NORMAL          // Watchdog Timer Window Mode (Watchdog Timer is in non-Window mode)
#pragma config FWDTEN = OFF             // Watchdog Timer Enable (WDT Disabled)
#pragma config FWDTWINSZ = WINSZ_25     // Watchdog Timer Window Size (Window size is 25%)
#pragma config DMTCNT = DMT31           // Deadman Timer Count Selection (2^31 (2147483648))
#pragma config FDMTEN = OFF             // Deadman Timer Enable (Deadman Timer is disabled)

// DEVCFG0
#pragma config DEBUG = OFF              // Background Debugger Enable (Debugger is disabled)
#pragma config JTAGEN = OFF             // JTAG Enable (JTAG Disabled)
#pragma config ICESEL = ICS_PGx2        // ICE/ICD Comm Channel Select (Communicate on PGEC2/PGED2)
#pragma config TRCEN = OFF              // Trace Enable (Trace features in the CPU are disabled)
#pragma config BOOTISA = MIPS32         // Boot ISA Selection (Boot code and Exception code is MIPS32)
#pragma config FECCCON = OFF_UNLOCKED   // Dynamic Flash ECC Configuration (ECC and Dynamic ECC are disabled (ECCCON bits are writable))
#pragma config FSLEEP = OFF             // Flash Sleep Mode (Flash is powered down when the device is in Sleep mode)
#pragma config DBGPER = PG_ALL          // Debug Mode CPU Access Permission (Allow CPU access to all permission regions)
#pragma config SMCLR = MCLR_NORM        // Soft Master Clear Enable bit (MCLR pin generates a normal system Reset)
#pragma config SOSCGAIN = GAIN_LEVEL_3  // Secondary Oscillator Gain Control bits (2x gain setting)
#pragma config SOSCBOOST = ON           // Secondary Oscillator Boost Kick Start Enable bit (Normal start of the oscillator)
#pragma config POSCGAIN = GAIN_LEVEL_3  // Primary Oscillator Gain Control bits (2x gain setting)
#pragma config POSCBOOST = ON           // Primary Oscillator Boost Kick Start Enable bit (Boost the kick start of the oscillator)
#pragma config EJTAGBEN = NORMAL        // EJTAG Boot (Normal EJTAG functionality)

// DEVCP0
#pragma config CP = OFF                 // Code Protect (Protection Disabled)

// SEQ3
#pragma config TSEQ = 0x0000            // Boot Flash True Sequence Number (Enter Hexadecimal value)
#pragma config CSEQ = 0xFFFF            // Boot Flash Complement Sequence Number (Enter Hexadecimal value)
// </editor-fold>

//******************************************************************************
// INCLUDES
//******************************************************************************
#include <xc.h>
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"
#include "LEDInterface.h"
#include "ADCFreeRTOS.h"
#include "PWMFreeRTOS.h"
#include "DigitalPort.h"

extern void USBPacketManagerInit(void);

PWMModule_t redModule = 
{
    .OC = 3,
    .DutyCycle = 10,
    .Port = PORT_RPB5,
};

PWMModule_t greenModule = 
{
    .OC = 4,
    .DutyCycle = 80,
    .Port = PORT_RPB1,
};

PWMModule_t blueModule = 
{
    .OC = 5,
    .DutyCycle = 50,
    .Port = PORT_RPB0,
};

//==============================================================================
// Task1
//==============================================================================
static void taskButtonRead(void *pvParameters)
{
    LedInfo led;
    int8_t lastStatus=0;
    
    for(;;)
    {
        if(lastStatus != PORTGbits.RG12)
        {
            lastStatus = DigitalPortRead(DIGITAL_INPUT_1);
            led.portID = GetDigitalPortID(DIGITAL_OUTPUT_2);
            if(lastStatus)
                led.status = 0;
            else
                led.status = 1;
            setLedInfo(&led);
        }
        else
            vTaskDelay( 100 / portTICK_PERIOD_MS );
    }
}

static void task2(void *pvParameters)
{
    TickType_t xLastWakeTime;
    const TickType_t xFrequency = 1000 / portTICK_PERIOD_MS;
    
    xLastWakeTime = xTaskGetTickCount();
    for(;;)
    {
        //LATEbits.LATE4 = ~LATEbits.LATE4;
        DigitalPortInvert(DIGITAL_OUTPUT_3);
        vTaskDelayUntil( &xLastWakeTime, xFrequency );
    }
}

void _general_exception_handler( unsigned long ulCause, unsigned long ulStatus )
{
	/* This overrides the definition provided by the kernel.  Other exceptions 
	should be handled here. */
	for( ;; );
}

#define hwUNLOCK_KEY_0					( 0xAA996655UL )
#define hwUNLOCK_KEY_1					( 0x556699AAUL )

void vHardwareConfigurePerformance( void )
{
	// Escrevendo sequência para desbloqueio (Seção 6. Oscillators)
	SYSKEY = hwUNLOCK_KEY_0;
	SYSKEY = hwUNLOCK_KEY_1;

	/* PB2 é a fonte de clock para I2C e UART. 200MHz */
	PB2DIVbits.PBDIV = 0b000;

	/* PB3 é a fonte de clock para os timers. 200MHz. */
	PB3DIVbits.PBDIV = 0b000;

	/* PB4 é a fonte de clock para as Portas. */
	PB4DIVbits.PBDIV = 0b000;

	SYSKEY = 0;

	/* Disable interrupts - note taskDISABLE_INTERRUPTS() cannot be used here as
	FreeRTOS does not globally disable interrupt. */
	__builtin_disable_interrupts();
}

void vHardwareUseMultiVectoredInterrupts( void )
{
	/* Enable multi-vector interrupts. */
	_CP0_BIS_CAUSE( 0x00800000U );
	INTCONSET = _INTCON_MVEC_MASK;
	__builtin_enable_interrupts();
}

//==============================================================================
void vAssertCalled(const char * pcFile, unsigned long ulLine) {
    volatile unsigned long ul = 0;
    (void) pcFile;
    (void) ulLine;
    __asm volatile( "di");
    {
        /* Set ul to a non-zero value using the debugger to step out of this
        function. */
        while (ul == 0) {
            portNOP();
        }
    }
    __asm volatile( "ei");
}

//==============================================================================
void main(void)
{
    vHardwareConfigurePerformance();
    vHardwareUseMultiVectoredInterrupts();

    ANSELA = 0x00000000;    // Disable analog functions
    ANSELB = 0x00000000;    // Disable analog functions
    ANSELC = 0x00000000;    // Disable analog functions
    ANSELD = 0x00000000;    // Disable analog functions
    ANSELE = 0x00000000;    // Disable analog functions
    ANSELF = 0x00000000;    // Disable analog functions
    ANSELG = 0x00000000;    // Disable analog functions

    initDigitalPorts();

    LEDInterfaceInit();
    USBPacketManagerInit();
    initADC();
    initPWM(&redModule);
    initPWM(&greenModule);
    initPWM(&blueModule);

    xTaskCreate(taskButtonRead, "ButtonRead", configMINIMAL_STACK_SIZE, NULL, tskIDLE_PRIORITY+1, NULL);
    xTaskCreate(task2, "Blink", configMINIMAL_STACK_SIZE, NULL, tskIDLE_PRIORITY+1, NULL);
 
    vTaskStartScheduler();
}
//******************************************************************************