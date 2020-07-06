//******************************************************************************
//                                USB
//
// Data:       06/05/2020
// Descrição:  Controle de porta USB
//******************************************************************************

// <editor-fold defaultstate="collapsed" desc="USB Copyrights">
/* 
 * usb.h for PIC32MZ Basic USB
 * 
 * Released under FreeBSD License 
 * 
 * (C)2019 - Mark Serran Lewis
 * All rights reserved.
 * 
 *  Redistribution and use in source and binary forms, with or without      
 *  modification, are permitted provided that the following conditions are  
 *  met:                                                                    
 *                                                                          
 *  1. Redistributions of source code must retain the above copyright       
 *     notice, this list of conditions and the following disclaimer.        
 *  2. Redistributions in binary form must reproduce the above copyright    
 *     notice, this list of conditions and the following disclaimer in the  
 *     documentation and/or other materials provided with the distribution. 
 *                                                                          
 *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS     
 *  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT       
 *  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR   
 *  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT    
 *  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,   
 *  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT        
 *  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,   
 *  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY   
 *  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT     
 *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE   
 *  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.    
 *                                                                          
 *  The views and conclusions contained in the software and documentation   
 *  are those of the authors and should not be interpreted as representing  
 *  official policies, either expressed or implied, of the FreeBSD Project. 
 *
 */
// </editor-fold>

//******************************************************************************
// INCLUDES
//******************************************************************************
#include <xc.h>
#include "FreeRTOS.h"
#include "task.h"
#include "stream_buffer.h"
#include "semphr.h"
#include "USBDefinitions.h"

//******************************************************************************
// VARIÁVEIS GLOBAIS
//******************************************************************************
uint8_t receptionBuffer[EP3RXBUFFSIZE];

volatile uint8_t usbAddress=0;
volatile uint8_t usbConfiguration;
volatile uint16_t usbInterface;
volatile uint16_t controlState;
volatile uint8_t maxTransmissionPacketSize;
volatile uint8_t maxReceptionPacketSize;

uint16_t usbLoadedBytes;

deviceRequestPacket_t deviceRequest;

static StreamBufferHandle_t xReceptionStream = NULL;

//*********************************************************************
// Estruturas
//*********************************************************************
// <editor-fold defaultstate="collapsed" desc="Device descriptor definition">
const deviceDescriptor_t mainDeviceDescriptor =
{
    .length = sizeof(deviceDescriptor_t),
    .descriptorType = USB_DESCRIPTOR_DEVICE,
    .bcdUSB = USB_SPECIFICATION_BCD_NUMBER,
    .deviceClass = CDC_DEVICE,
    .deviceSubClass = 0x00,
    .deviceProtocol = 0x00,
    .maxPacketSize = EP0BUFFSIZE,
    .idVendor = VENDOR_ID,
    .idProduct = PRODUCT_ID,
    .bcdDevice = DEVICE_RELEASE_BCD_VERSION,
    .iManufacturer = 0x01,
    .iProduct = 0x02,
    .iSerialNumber = 0x00,
    .numConfigurations = 0x01,
};
// </editor-fold>

// <editor-fold defaultstate="collapsed" desc="CDC Configuration class descriptor definition">
cdcConfigurationDescriptor_t cdcConfigurationDescriptor =
{
    .configurationDescriptor =
    {
        .length = sizeof(configurationDescriptor_t),
        .descriptorType = USB_DESCRIPTOR_CONFIGURATION,
        .totalLength = sizeof(cdcConfigurationDescriptor_t),
        .numInterfaces = 2,
        .configurationValue = 1,
        .iConfiguration = 0,
        .bmAttributes = CONFG_ATTB_DEFAULT | CONFG_ATTB_SELF_POWERED,
        .maxPower = POWER_CONSUMPTION_VAL,
    },
    .interface0Descriptor = 
    {
        .length = sizeof(interfaceDescriptor_t),
        .descriptorType = USB_DESCRIPTOR_INTERFACE,
        .interfaceNumber = 0x00,
        .alternateSetting = 0x00,
        .numEndpoints = 0x01,
        .interfaceClass = COMM_INTF,
        .interfaceSubclass = ABSTRACT_CONTROL_MODEL,
        .interfaceProtocol = V25TER,
        .iInterface = 0x00,
    },
    .functionalDescriptor = 
    {
        .length = sizeof(functionalDescriptor_t),
        .descriptorType = CS_INTERFACE,
        .descriptorSubtype = DESCRIPTOR_SUBTYPE_FN_HEADER,
        .bcdADC = 0x0201,
    },
    .acmFunctionalDescriptor = 
    {
        .length = sizeof(acmFunctionalDescriptor_t),
        .descriptorType = CS_INTERFACE,
        .descriptorSubtype = DESCRIPTOR_SUBTYPE_FN_ACM,
        .mCapabilities = 0x02,
    },
    .unionFunctionalDescriptor = 
    {
        .length = sizeof(unionFunctionalDescriptor_t),
        .descriptorType = CS_INTERFACE,
        .descriptorSubtype = DESCRIPTOR_SUBTYPE_FN_UNION,
        .controlInterface = 0x00,
        .subordinateInterface = 0x01,
    },
    .callManagementDescriptor = 
    {
        .length = sizeof(callManagementDescriptor_t),
        .descriptorType = CS_INTERFACE,
        .descriptorSubtype = DESCRIPTOR_SUBTYPE_FN_CALL_MGT,
        .mCapabilities = 0x00,
        .dataInterface = 0x01,
    },
    .endpoint1Descriptor =
    {
        .length = sizeof(endpointDescriptor_t),
        .descriptorType = USB_DESCRIPTOR_ENDPOINT,
        .endpointAddress = ENDPOINT01_IN,
        .mAttributes = ENPOINT_TRANSFER_INTERRUPT,
        .maxPacketSize = 0x00040,
        .pollingInterval = 0x02,
    },
    .interface1Descriptor =
    {
        .length = sizeof(interfaceDescriptor_t),
        .descriptorType = USB_DESCRIPTOR_INTERFACE,
        .interfaceNumber = 0x01,
        .alternateSetting = 0x00,
        .numEndpoints = 0x02,
        .interfaceClass = DATA_INTF,
        .interfaceSubclass = 0x00,
        .interfaceProtocol = NO_PROTOCOL,
        .iInterface = 0x00,
    },
    .endpoint2Descriptor =
    {
        .length = sizeof(endpointDescriptor_t),
        .descriptorType = USB_DESCRIPTOR_ENDPOINT,
        .endpointAddress = ENDPOINT02_IN,
        .mAttributes = ENPOINT_TRANSFER_BULK,
        .maxPacketSize = 0x0040,
        .pollingInterval = 0x00,
    },
    .endpoint3Descriptor =
    {
        .length = sizeof(endpointDescriptor_t),
        .descriptorType = USB_DESCRIPTOR_ENDPOINT,
        .endpointAddress = ENDPOINT03_OUT,
        .mAttributes = ENPOINT_TRANSFER_BULK,
        .maxPacketSize = 0x0008,
        .pollingInterval = 0x00,
    },
};
// </editor-fold>

// <editor-fold defaultstate="collapsed" desc="Line Coding definition">
lineCoding_t lineCoding =
{
    .dwDTERate = 115200,
    .bCharFormat = LINE_COD_1_STOP_BIT,
    .bParityType = LINE_COD_1_PARITY_NONE,
    .bDataBits = 8,
};
// </editor-fold>

//******************************************************************************
// Protótipo de funções do módulo
//******************************************************************************
void initUSB(void);
uint8_t connectUSB(void);
uint8_t disableUSB(void);
int16_t getUSBPacket(int8_t *copyBuffer, uint16_t bufferSize);
int16_t sendUSBPacket(int8_t *copyBuffer, uint16_t bufferSize);
void controlTransfer(deviceRequestPacket_t *request);
void standardRequestHandler(deviceRequestPacket_t *request);
void getDescriptorRequestHandler(deviceRequestPacket_t *request);
void classRequestHandler(deviceRequestPacket_t *request);
int16_t receivePacketFromEndpoint0(int8_t *copyBuffer, int16_t bufferLength);
int16_t getQuantBytesReceived(void);
int16_t receivePacketFromEndpoint3(int8_t *copyBuffer, int16_t bufferLength);
int16_t sendPacketToEndpoint0(int8_t *copyBuffer, int16_t bufferLength);
int16_t sendPacketToEndpoint1(int8_t *copyBuffer, int16_t bufferLength);
int16_t sendPacketToEndpoint2(int8_t *copyBuffer, int16_t bufferLength);
void endPacketLoadingToEndpoint2(void);
int16_t loadPacketToEndpoint2(int8_t *copyBuffer, int16_t bufferLength);
void startPacketLoadingToEndpoint2(void);

//******************************************************************************
// Tasks
//******************************************************************************
static void taskUsbCheck(void *pvParameters)
{
    TickType_t xLastWakeTime;
    uint8_t enableUSB = 0;
    
    for(;;)
    {
        if(USBOTGbits.VBUS == VBUS_VALID && enableUSB == 1)
        {
            connectUSB();
            if(USBCSR0bits.SUSPMODE)
            {
                xLastWakeTime = xTaskGetTickCount();
                USBCSR0bits.RESUME = 1;
                vTaskDelayUntil( &xLastWakeTime, 10 / portTICK_PERIOD_MS );
                USBCSR0bits.RESUME = 0;
            }
            enableUSB = 0;
        } 
        else if(USBOTGbits.VBUS != VBUS_VALID && enableUSB == 0)
        {
            disableUSB();
            enableUSB = 1;
        }
        vTaskDelay(500 / portTICK_PERIOD_MS);
    }
}

int16_t getAvailable(void)
{
    return((int16_t)xStreamBufferBytesAvailable(xReceptionStream));
}

int8_t getUSBByte(void)
{
    int8_t data=0;
    
    xStreamBufferReceive(xReceptionStream, (void *)(&data), sizeof(data), portMAX_DELAY);
    return(data);
}

int16_t getUSBPacket(int8_t *copyBuffer, uint16_t bufferSize)
{
    int16_t bytesReceived=0;
    TickType_t xStartTime, xEndTime;
    float timeOut;
    
    xStartTime = xTaskGetTickCount();
    while(bytesReceived < bufferSize)
    {
        if(xStreamBufferSetTriggerLevel(xReceptionStream, bufferSize-bytesReceived))
        {
            bytesReceived += xStreamBufferReceive(xReceptionStream,
                                                  (void *)(&copyBuffer[bytesReceived]),
                                                  bufferSize-bytesReceived, 
                                                  pdMS_TO_TICKS(20)
                                                 );
        }
        else
            break;
        xEndTime = xTaskGetTickCount();
        timeOut = (xEndTime - xStartTime) / portTICK_PERIOD_MS;
        if(timeOut > USB_PACKET_RECEPTION_TIMEOUT_MS)
            break;
    }
    xStreamBufferSetTriggerLevel(xReceptionStream, 1);
    return(bytesReceived);
}

void startLoadingUSBPacket(void)
{
    startPacketLoadingToEndpoint2();
}

int16_t loadUSBPacket(int8_t *copyBuffer, uint16_t bufferSize)
{
    loadPacketToEndpoint2(copyBuffer, bufferSize);
}

void endLoadingUSBPacket(void)
{
    endPacketLoadingToEndpoint2();
}

int16_t sendUSBPacket(int8_t *copyBuffer, uint16_t bufferSize)
{
    int16_t bytesSent;
    
    bytesSent = sendPacketToEndpoint2(copyBuffer, bufferSize);
    return(bytesSent);
}

//******************************************************************************
// Funções
//******************************************************************************
void initUSB(void)
{
    // Set USB as High Speed
    USBCSR0bits.HSEN = 1;
    
    // Disable all interrupts
    USBCRCONbits.USBIE = 0;
    IEC4bits.USBIE = 0;
    IEC4bits.USBDMAIE = 0;
    USBCSR1 = 0x00000000;
    USBCSR2 = 0x00000000;
    USBCSR3 = 0x00000000;
    
    // Clear all interrupt flags
    USBCRCONbits.USBIF = 0;
    USBCRCONbits.USBRF = 0;
    IFS4bits.USBIF = 0;
    USBDMAINT = 0x00000000;

    // Set interrupt priorities
    IPC33bits.USBIP = 4;        // USB Interrupt Priority.
    IPC33bits.USBIS = 0;        // USB Interrupt Sub-Priority.
    
    // Set endpoit parameters
    USBIENCSR2bits.SPEED = 1;
    USBIENCSR0bits.TXMAXP = EP0BUFFSIZE;

    USBCSR3bits.ENDPOINT = 1;
    USBIENCSR0bits.ISO = 0;
    USBIENCSR0bits.MODE = 1;
    USBIENCSR0bits.TXMAXP = EP1TXBUFFSIZE;
    USBIENCSR2bits.SPEED = 1;
    USBIENCSR2bits.PROTOCOL = 3;
    USBIENCSR2bits.TEP = 1;
    USBFIFOAbits.TXFIFOAD = 0x0000+EP0BUFFSIZE;

    USBCSR3bits.ENDPOINT = 2;
    USBIENCSR0bits.ISO = 0;
    USBIENCSR0bits.MODE = 1;
    USBIENCSR0bits.TXMAXP = EP2TXBUFFSIZE;
    USBIENCSR2bits.SPEED = 1;
    USBIENCSR2bits.PROTOCOL = 2;
    USBIENCSR2bits.TEP = 2;
    USBFIFOAbits.TXFIFOAD = 0x0000+EP0BUFFSIZE+EP1TXBUFFSIZE;

    USBCSR3bits.ENDPOINT = 3;
    USBIENCSR1bits.ISO = 0;
    USBIENCSR0bits.MODE = 0;
    USBIENCSR1bits.RXMAXP = EP3RXBUFFSIZE;
    USBIENCSR3bits.SPEED = 1;
    USBIENCSR3bits.PROTOCOL = 2;
    USBIENCSR3bits.TEP = 3;
    
    USBFIFOAbits.RXFIFOAD = 0x0000+EP0BUFFSIZE+EP1TXBUFFSIZE+EP2TXBUFFSIZE;
    
    /* Enable Endpoint interrupts */
    USBCSR1 = 0x00000000;
    USBCSR1bits.EP0IE = 1;      // Endpoint 0 interrupt enable
    USBCSR1bits.EP1TXIE = 1;    // Endpoint 1 TX interrupt enable
    USBCSR1bits.EP2TXIE = 1;    // Endpoint 2 TX interrupt enable
    USBCSR2bits.EP3RXIE = 1;    // Endpoint 3 RX interrupt enable
    USBCSR2bits.RESETIE = 1;
    
    IEC4bits.USBIE = 1;         // Enable the USB interrupt.
    USBCRCONbits.USBIE = 1;     // 1 = Enables general interrupt from USB module
    
    // Definindo o MaxPacketSize de acordo com o informado pelo core USB
    maxTransmissionPacketSize = (1 << USBIENCSR3bits.TXFIFOSZ);
    maxReceptionPacketSize = (1 << USBIENCSR3bits.RXFIFOSZ);

    USBCSR3bits.ENDPOINT = 1;
    cdcConfigurationDescriptor.endpoint1Descriptor.maxPacketSize = (1 << USBIENCSR3bits.TXFIFOSZ);
    USBCSR3bits.ENDPOINT = 2;
    cdcConfigurationDescriptor.endpoint2Descriptor.maxPacketSize = maxTransmissionPacketSize;
    USBCSR3bits.ENDPOINT = 3;
    cdcConfigurationDescriptor.endpoint3Descriptor.maxPacketSize = maxReceptionPacketSize;
    
    xReceptionStream = xStreamBufferCreate(EP3RXBUFFSIZE, 1);
    xTaskCreate(taskUsbCheck, "usbCheck", configMINIMAL_STACK_SIZE, NULL, tskIDLE_PRIORITY+1, NULL);
}

uint8_t connectUSB(void)
{
    USBCSR0bits.SOFTCONN = 1;   // 1 = The USB D+/D- lines are enabled and active
    return 0;
}

uint8_t disableUSB(void)
{
    USBCSR0bits.SOFTCONN = 0;   // 0 = The USB D+/D- lines are disabled and are tri-stated.
    return 1;
}

//******************************************************************************
// USB Interrupt Handler
//******************************************************************************
void __attribute__((interrupt(IPL0AUTO), vector(_USB_VECTOR))) vUSBInterruptWrapper( void );

void vUSBInterruptHandler(void)
{
    if(USBCSR2bits.RESETIF) // In Device mode, indicates reset signaling is detected on the bus.
    { 
        // Set endpoit parameters
        USBIENCSR2bits.SPEED = 1;
        USBIENCSR0bits.TXMAXP = EP0BUFFSIZE;

        USBCSR3bits.ENDPOINT = 1;
        USBIENCSR0bits.ISO = 0;
        USBIENCSR0bits.MODE = 1;
        USBIENCSR0bits.TXMAXP = EP1TXBUFFSIZE;
        USBIENCSR2bits.SPEED = 1;
        USBIENCSR2bits.PROTOCOL = 3;
        USBIENCSR2bits.TEP = 1;
        USBFIFOAbits.TXFIFOAD = 0x0000+EP0BUFFSIZE;

        USBCSR3bits.ENDPOINT = 2;
        USBIENCSR0bits.ISO = 0;
        USBIENCSR0bits.MODE = 1;
        USBIENCSR0bits.TXMAXP = EP2TXBUFFSIZE;
        USBIENCSR2bits.SPEED = 1;
        USBIENCSR2bits.PROTOCOL = 2;
        USBIENCSR2bits.TEP = 2;
        USBFIFOAbits.TXFIFOAD = 0x0000+EP0BUFFSIZE+EP1TXBUFFSIZE;

        USBCSR3bits.ENDPOINT = 3;
        USBIENCSR1bits.ISO = 0;
        USBIENCSR0bits.MODE = 0;
        USBIENCSR1bits.RXMAXP = EP3RXBUFFSIZE;
        USBIENCSR3bits.SPEED = 1;
        USBIENCSR3bits.PROTOCOL = 2;
        USBIENCSR2bits.TEP = 3;
        USBFIFOAbits.RXFIFOAD = 0x0000+EP0BUFFSIZE+EP1TXBUFFSIZE+EP2TXBUFFSIZE;        

        USBCSR1bits.EP0IE = 1;      // Endpoint 0 interrupt enable
        USBCSR1bits.EP1TXIE = 1;    // Endpoint 1 TX interrupt enable
        USBCSR1bits.EP2TXIE = 1;    // Endpoint 2 TX interrupt enable
        USBCSR2bits.EP3RXIE = 1;    // Endpoint 3 RX interrupt enable
 
        // Definindo o MaxPacketSize de acordo com o informado pelo core USB
        maxTransmissionPacketSize = (1 << USBIENCSR3bits.TXFIFOSZ);
        maxReceptionPacketSize = (1 << USBIENCSR3bits.RXFIFOSZ);

        USBCSR3bits.ENDPOINT = 1;
        cdcConfigurationDescriptor.endpoint1Descriptor.maxPacketSize = (1 << USBIENCSR3bits.TXFIFOSZ);
        USBCSR3bits.ENDPOINT = 2;
        cdcConfigurationDescriptor.endpoint2Descriptor.maxPacketSize = maxTransmissionPacketSize;
        USBCSR3bits.ENDPOINT = 3;
        cdcConfigurationDescriptor.endpoint3Descriptor.maxPacketSize = maxReceptionPacketSize;

        USBCSR2bits.RESETIF = 0;
    } 
    
    // A operação de definir o endereço deve ser feita no início de um novo pacote,
    // pois do contrário o dispositivo vai sinalizar erro.
    if(usbAddress)
    {
        USBCSR0bits.FUNC = usbAddress & 0x7F;
        usbAddress = 0;
    }

    /* Endpoint 0 Interrupt Handler */
    if(USBCSR0bits.EP0IF == 1)
    {
        if(USBE0CSR0bits.RXRDY)
        {
            receivePacketFromEndpoint0((uint8_t *)&deviceRequest, sizeof(deviceRequestPacket_t));
            controlTransfer(&deviceRequest);  // Process Control Transfers and Packets.
        }
        if(USBE0CSR0bits.SETEND)
        {
            USBE0CSR0bits.SETENDC = 1;
        }
        USBCSR0bits.EP0IF = 0;  // Clear the USB EndPoint 0 Interrupt Flag.
    } 
    
    /* Endpoint 1 TX Interrupt Handler */
    if(USBCSR0bits.EP1TXIF == 1) // INTERRUPT Endpoint 1 Transmit A Packet.
    {
        USBCSR0bits.EP1TXIF = 0; // Supposedly Cleared By Hardware (Clear Just In Case).
    } 
    
    /* Endpoint 2 TX Interrupt Handler */
    if(USBCSR0bits.EP2TXIF == 1) // BULK Endpoint 2 Transmit A Packet.
    {
        USBCSR0bits.EP2TXIF = 0; // Supposedly Cleared By Hardware (Clear Just In Case). 
    } 
    
    /* Endpoint 3 RX Interrupt Handler */
    if(USBCSR1bits.EP3RXIF == 1) // BULK Endpoint 3 Received A Packet.
    {
        int16_t bytesReceived=0;
        
        while(USBE3CSR1bits.RXPKTRDY)
            bytesReceived += receivePacketFromEndpoint3(&receptionBuffer[bytesReceived], sizeof(receptionBuffer) - bytesReceived);
        USBCSR1bits.EP3RXIF = 0;
        xStreamBufferSendFromISR(xReceptionStream, (const void *)receptionBuffer, bytesReceived, NULL );
    }

    IFS4bits.USBIF = 0;  // Reset the USB Interrupt flag
}

void controlTransfer(deviceRequestPacket_t *request)
{
    switch(request->RequestType)
    {
        case USB_SETUP_TYPE_STANDARD:
            standardRequestHandler(request);
            break;
        case USB_SETUP_TYPE_CLASS:
            classRequestHandler(request);
            break;
        case USB_SETUP_TYPE_VENDOR:
            break;
    }
}

void standardRequestHandler(deviceRequestPacket_t *request)
{
    switch(request->bRequest)
    {
        case USB_REQUEST_GET_STATUS:
            if(request->wValue == 0)
            {
                USBE0CSR0bits.STALL = 1;
            }
            break;
        case USB_REQUEST_CLEAR_FEATURE:
            USBE0CSR0bits.STALL = 1;
            break;
        case USB_REQUEST_SET_FEATURE:
            USBE0CSR0bits.STALL = 1;
            break;
        case USB_REQUEST_SET_ADDRESS:
            sendAckToEndpoint0();
            usbAddress = request->DeviceAddress;
            break;
        case USB_REQUEST_GET_DESCRIPTOR:
            getDescriptorRequestHandler(request);
            break;
        case USB_REQUEST_SET_DESCRIPTOR:
            USBE0CSR0bits.STALL = 1;
            break;
        case USB_REQUEST_GET_CONFIGURATION:
            sendPacketToEndpoint0((uint8_t *)&usbConfiguration, sizeof(usbConfiguration));
            break;
        case USB_REQUEST_SET_CONFIGURATION:
            usbConfiguration = request->bConfigurationValue;
            break;
        case USB_REQUEST_GET_INTERFACE:
            sendPacketToEndpoint0((uint8_t *)&usbInterface, sizeof(usbInterface));
            break;
        case USB_REQUEST_SET_INTERFACE:
            usbInterface = request->Interface;
            break;
        case USB_REQUEST_SYNCH_FRAME:
            USBE0CSR0bits.STALL = 1;
            break;
    }
}

void getDescriptorRequestHandler(deviceRequestPacket_t *request)
{
    switch(request->DescriptorType)
    {
        case USB_DESCRIPTOR_DEVICE:
            sendPacketToEndpoint0((uint8_t *)&mainDeviceDescriptor, request->wLength);
            break;
        case USB_DESCRIPTOR_CONFIGURATION:
            sendPacketToEndpoint0((uint8_t *)&cdcConfigurationDescriptor, request->wLength);
            break;
        case USB_DESCRIPTOR_STRING:
            switch(request->DescriptorIndex)
            {
                case 0:
                    sendPacketToEndpoint0(string0, request->wLength);
                    break;
                case 1:
                    sendPacketToEndpoint0(string1, request->wLength);
                    break;
                case 2:
                    sendPacketToEndpoint0(string2, request->wLength);
                    break;
                case 3:
                    sendPacketToEndpoint0(string3, request->wLength);
                    break;
                case 4:
                    sendPacketToEndpoint0(string4, request->wLength);
                    break;
                case 5:
                    sendPacketToEndpoint0(string5, request->wLength);
                    break;
            }
            break;
    }
}

void classRequestHandler(deviceRequestPacket_t *request)
{
    switch(request->bRequest)
    {
        case SEND_ENCAPSULATED_COMMAND:
            USBE0CSR0bits.STALL = 1;
            break;
        case GET_ENCAPSULATED_RESPONSE:
            USBE0CSR0bits.STALL = 1;
            break;
        case SET_COMM_FEATURE:
            USBE0CSR0bits.STALL = 1;
            break;
        case GET_COMM_FEATURE:
            USBE0CSR0bits.STALL = 1;
            break;
        case CLEAR_COMM_FEATURE:
            USBE0CSR0bits.STALL = 1;
            break;
        case SET_LINE_CODING:
            receivePacketFromEndpoint0((uint8_t *)&lineCoding, sizeof(lineCoding_t));
            break;
        case GET_LINE_CODING:
            sendPacketToEndpoint0((uint8_t *)&lineCoding, sizeof(lineCoding_t));
            break;
        case SET_CONTROL_LINE_STATE:
            controlState = request->wValue;
            break;
        case SEND_BREAK:
            USBE0CSR0bits.STALL = 1;
            break;
    }
}

int16_t receivePacketFromEndpoint0(int8_t *copyBuffer, int16_t bufferLength)
{
    int8_t *pointerToRecvBuffer = (uint8_t *)&USBFIFO0;
    int16_t bytesReceived  = USBE0CSR2bits.RXCNT;        // Endpoint 0 - Received Bytes Count
    int16_t bytesRead;

    if(bufferLength > bytesReceived)
        bufferLength = bytesReceived;
    for(bytesRead = 0; bytesRead < bufferLength; bytesRead++)
    {
        copyBuffer[bytesRead] = *(pointerToRecvBuffer + (bytesRead & 3));
    }
    USBE0CSR0bits.RXRDYC = 1;
    return(bytesRead);
}

int16_t receivePacketFromEndpoint3(int8_t *copyBuffer, int16_t bufferLength)
{
    int8_t *pointerToRecvBuffer = (uint8_t *)&USBFIFO3;
    int16_t bytesReceived  = USBE3CSR2bits.RXCNT;
    int16_t bytesRead;
    
    if(bufferLength > bytesReceived)
        bufferLength = bytesReceived;
    for(bytesRead = 0; bytesRead < bufferLength; bytesRead++)
    {
        copyBuffer[bytesRead] = *(pointerToRecvBuffer + (bytesRead & 3));
    }
    USBE3CSR1bits.RXPKTRDY = 0;
    return(bytesRead);
}

int16_t sendPacketToEndpoint0(int8_t *copyBuffer, int16_t bufferLength)
{
    int8_t *pointerToTransmBuffer = (uint8_t *)&USBFIFO0;
    uint16_t remainingBytes = bufferLength;
    uint16_t bytesWritten = 0, byteCount, packetSize;

    packetSize = bufferLength;
    if(packetSize > EP0BUFFSIZE)
    {
        packetSize = EP0BUFFSIZE;
    }
    while(remainingBytes)
    {
        while(USBE0CSR0bits.TXRDY);
        if(remainingBytes < packetSize)
        {
            packetSize = remainingBytes;
        }
        for(byteCount = 0; byteCount < packetSize; byteCount++)
        {
            *pointerToTransmBuffer = copyBuffer[bytesWritten++];
            remainingBytes--;
        }
        if(remainingBytes == 0)
            USBIE0CSR0bits.DATAEND = 1;

        USBE0CSR0bits.TXRDY = 1;
    }
    return(bytesWritten);
}

int16_t sendPacketToEndpoint1(int8_t *copyBuffer, int16_t bufferLength)
{
    int8_t *pointerToTransmBuffer = (uint8_t *)&USBFIFO1;
    uint16_t remainingBytes = bufferLength;
    uint16_t bytesWritten = 0, byteCount, packetSize;

    packetSize = bufferLength;
    if(packetSize > EP1TXBUFFSIZE)
    {
        packetSize = EP1TXBUFFSIZE;
    }
    while(remainingBytes)
    {
        while(USBE1CSR0bits.TXPKTRDY);
        if(remainingBytes < packetSize)
        {
            packetSize = remainingBytes;
        }
        for(byteCount = 0; byteCount < packetSize; byteCount++)
        {
            *pointerToTransmBuffer = copyBuffer[bytesWritten++];
            remainingBytes--;
        }
        USBE1CSR0bits.TXPKTRDY = 1;
    }
    sendAckToEndpoint1();
    return(bytesWritten);    
}


void startPacketLoadingToEndpoint2(void)
{
    usbLoadedBytes = 0;
}

int16_t loadPacketToEndpoint2(int8_t *copyBuffer, int16_t bufferLength)
{
    int8_t *pointerToTransmBuffer = (uint8_t *)&USBFIFO2;
    uint16_t bytesWritten = 0;

    while(USBE2CSR0bits.TXPKTRDY);
    
    while(bytesWritten != bufferLength)
    {
        *pointerToTransmBuffer = copyBuffer[bytesWritten++];
        usbLoadedBytes++;
        if((usbLoadedBytes%maxTransmissionPacketSize) == 0)
        {
            USBE2CSR0bits.TXPKTRDY = 1;
            while(USBE2CSR0bits.TXPKTRDY);
        }
    }
    return(bytesWritten);    
}

void endPacketLoadingToEndpoint2(void)
{
    USBE2CSR0bits.TXPKTRDY = 1;
    while(USBE2CSR0bits.TXPKTRDY);
}

int16_t sendPacketToEndpoint2(int8_t *copyBuffer, int16_t bufferLength)
{
    int8_t *pointerToTransmBuffer = (uint8_t *)&USBFIFO2;
    uint16_t remainingBytes = bufferLength;
    uint16_t bytesWritten = 0, byteCount, packetSize;

    packetSize = bufferLength;
    if(packetSize > maxTransmissionPacketSize)
    {
        packetSize = maxTransmissionPacketSize;
    }
    while(remainingBytes)
    {
        while(USBE2CSR0bits.TXPKTRDY);
        if(remainingBytes < packetSize)
        {
            packetSize = remainingBytes;
        }
        for(byteCount = 0; byteCount < packetSize; byteCount++)
        {
            *pointerToTransmBuffer = copyBuffer[bytesWritten++];
            remainingBytes--;
        }
        USBE2CSR0bits.TXPKTRDY = 1;
    }
    sendAckToEndpoint2();
    while(USBE2CSR0bits.TXPKTRDY);
    if(bufferLength == maxTransmissionPacketSize)
    {
        sendAckToEndpoint2();
        while(USBE2CSR0bits.TXPKTRDY);        
    }
    return(bytesWritten);    
}

//******************************************************************************