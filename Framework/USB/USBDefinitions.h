//******************************************************************************
//                             USB Definitions
//
// Data:       06/05/2020
// Descrição:  Neste arquivo estão todas as definições utilizadas para
//             trabalhar com o módulo USB.
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

#ifndef _USB_H
#define _USB_H

//******************************************************************************
#include "USBConfig.h"

//******************************************************************************
// Definições utilizadas nas configurações do módulo
//******************************************************************************
#define POWER_CONSUMPTION_VAL   CURRENT_CONSUMPTION_MA/2
#define VBUS_VALID              0x3

//******************************************************************************
// Constantes utilizadas pelo protocolo USB
//******************************************************************************
#define USB_SPECIFICATION_BCD_NUMBER            0x0200
/* Device Class Code */
#define CDC_DEVICE                              0x02
/* Communication Interface Class Code */
#define COMM_INTF                               0x02
/* Communication Interface Class SubClass Codes */
#define ABSTRACT_CONTROL_MODEL                  0x02
/* Communication Interface Class Control Protocol Codes */
#define V25TER                                  0x01    // Common AT commands ("Hayes(TM)")
/* Data Interface Class Codes */
#define DATA_INTF                               0x0A
/* Data Interface Class Protocol Codes */
#define NO_PROTOCOL                             0x00    // No class specific protocol required

//==============================================================================
// USB Descriptors
//==============================================================================
#define USB_DESCRIPTOR_DEVICE                   0x01    // bDescriptorType for a Device Descriptor.
#define USB_DESCRIPTOR_CONFIGURATION            0x02    // bDescriptorType for a Configuration Descriptor.
#define USB_DESCRIPTOR_STRING                   0x03    // bDescriptorType for a String Descriptor.
#define USB_DESCRIPTOR_INTERFACE                0x04    // bDescriptorType for an Interface Descriptor.
#define USB_DESCRIPTOR_ENDPOINT                 0x05    // bDescriptorType for an Endpoint Descriptor.
#define USB_DESCRIPTOR_DEVICE_QUALIFIER         0x06    // bDescriptorType for a Device Qualifier.
#define USB_DESCRIPTOR_OTHER_SPEED              0x07    // bDescriptorType for a Other Speed Configuration.
#define USB_DESCRIPTOR_INTERFACE_POWER          0x08    // bDescriptorType for Interface Power.
#define USB_DESCRIPTOR_OTG                      0x09    // bDescriptorType for an OTG Descriptor.

//==============================================================================
// Definições para o campo bmRequestType da Device Request
//==============================================================================
#define USB_SETUP_HOST_TO_DEVICE                0x00    // Device Request bmRequestType transfer direction - host to device transfer
#define USB_SETUP_DEVICE_TO_HOST                0x80    // Device Request bmRequestType transfer direction - device to host transfer
#define USB_SETUP_TYPE_STANDARD                 0x00    // Device Request bmRequestType type - standard
#define USB_SETUP_TYPE_CLASS                    0x01    // Device Request bmRequestType type - class
#define USB_SETUP_TYPE_VENDOR                   0x02    // Device Request bmRequestType type - vendor
#define USB_SETUP_RECIPIENT_DEVICE              0x00    // Device Request bmRequestType recipient - device
#define USB_SETUP_RECIPIENT_INTERFACE           0x01    // Device Request bmRequestType recipient - interface
#define USB_SETUP_RECIPIENT_ENDPOINT            0x02    // Device Request bmRequestType recipient - endpoint
#define USB_SETUP_RECIPIENT_OTHER               0x03    // Device Request bmRequestType recipient - other

//==============================================================================
// Standard Requests
//==============================================================================
#define USB_REQUEST_GET_STATUS                  0       // Standard Device Request - GET STATUS
#define USB_REQUEST_CLEAR_FEATURE               1       // Standard Device Request - CLEAR FEATURE
#define USB_REQUEST_SET_FEATURE                 3       // Standard Device Request - SET FEATURE
#define USB_REQUEST_SET_ADDRESS                 5       // Standard Device Request - SET ADDRESS
#define USB_REQUEST_GET_DESCRIPTOR              6       // Standard Device Request - GET DESCRIPTOR
#define USB_REQUEST_SET_DESCRIPTOR              7       // Standard Device Request - SET DESCRIPTOR
#define USB_REQUEST_GET_CONFIGURATION           8       // Standard Device Request - GET CONFIGURATION
#define USB_REQUEST_SET_CONFIGURATION           9       // Standard Device Request - SET CONFIGURATION
#define USB_REQUEST_GET_INTERFACE               10      // Standard Device Request - GET INTERFACE
#define USB_REQUEST_SET_INTERFACE               11      // Standard Device Request - SET INTERFACE
#define USB_REQUEST_SYNCH_FRAME                 12      // Standard Device Request - SYNCH FRAME

//==============================================================================
// CDC Class Requests
//==============================================================================
#define SEND_ENCAPSULATED_COMMAND               0x00
#define GET_ENCAPSULATED_RESPONSE               0x01
#define SET_COMM_FEATURE                        0x02
#define GET_COMM_FEATURE                        0x03
#define CLEAR_COMM_FEATURE                      0x04
#define SET_LINE_CODING                         0x20
#define GET_LINE_CODING                         0x21
#define SET_CONTROL_LINE_STATE                  0x22
#define SEND_BREAK                              0x23

//==============================================================================
// Configuration Attributes
//==============================================================================
#define CONFG_ATTB_DEFAULT                      (0x01<<7)       //Default Value (Bit 7 is set)
#define CONFG_ATTB_SELF_POWERED                 (0x01<<6)       //Self-powered (Supports if set)
#define CONFG_ATTB_REMOTE_WAKEUP                (0x01<<5)       //Remote Wakeup (Supports if set)

//==============================================================================
// Functional Descriptors
//==============================================================================
// Type Values for the bDscType Field
#define CS_INTERFACE                            0x24
#define CS_ENDPOINT                             0x25

// bDscSubType in Functional Descriptors
#define DESCRIPTOR_SUBTYPE_FN_HEADER            0x00
#define DESCRIPTOR_SUBTYPE_FN_CALL_MGT          0x01
#define DESCRIPTOR_SUBTYPE_FN_ACM               0x02    // ACM - Abstract Control Management
#define DESCRIPTOR_SUBTYPE_FN_DLM               0x03    // DLM - Direct Line Managment
#define DESCRIPTOR_SUBTYPE_FN_TELEPHONE_RINGER  0x04
#define DESCRIPTOR_SUBTYPE_FN_RPT_CAPABILITIES  0x05
#define DESCRIPTOR_SUBTYPE_FN_UNION             0x06
#define DESCRIPTOR_SUBTYPE_FN_COUNTRY_SELECTION 0x07
#define DESCRIPTOR_SUBTYPE_FN_TEL_OP_MODES      0x08
#define DESCRIPTOR_SUBTYPE_FN_USB_TERMINAL      0x09

//==============================================================================
// Endpoint definitions
//==============================================================================
#define ENDPOINT_IN                             0x80
#define ENDPOINT_OUT                            0x00
#define ENDPOINT01_OUT                          0x01
#define ENDPOINT01_IN                           0x81
#define ENDPOINT02_OUT                          0x02
#define ENDPOINT02_IN                           0x82
#define ENDPOINT03_OUT                          0x03
#define ENDPOINT03_IN                           0x83
#define ENDPOINT04_OUT                          0x04
#define ENDPOINT04_IN                           0x84
#define ENDPOINT05_OUT                          0x05
#define ENDPOINT05_IN                           0x85
#define ENDPOINT06_OUT                          0x06
#define ENDPOINT06_IN                           0x86
#define ENDPOINT07_OUT                          0x07
#define ENDPOINT07_IN                           0x87
#define ENDPOINT08_OUT                          0x08
#define ENDPOINT08_IN                           0x88
#define ENDPOINT09_OUT                          0x09
#define ENDPOINT09_IN                           0x89
#define ENDPOINT10_OUT                          0x0A
#define ENDPOINT10_IN                           0x8A
#define ENDPOINT11_OUT                          0x0B
#define ENDPOINT11_IN                           0x8B
#define ENDPOINT12_OUT                          0x0C
#define ENDPOINT12_IN                           0x8C
#define ENDPOINT13_OUT                          0x0D
#define ENDPOINT13_IN                           0x8D
#define ENDPOINT14_OUT                          0x0E
#define ENDPOINT14_IN                           0x8E
#define ENDPOINT15_OUT                          0x0F
#define ENDPOINT15_IN                           0x8F

// Endpoint Transfer Type
#define ENPOINT_TRANSFER_CTRL                   0x00   //Control Transfer
#define ENPOINT_TRANSFER_ISO                    0x01   //Isochronous Transfer
#define ENPOINT_TRANSFER_BULK                   0x02   //Bulk Transfer
#define ENPOINT_TRANSFER_INTERRUPT              0x03   //Bulk Transfer

//==============================================================================
// Line Coding definitions
//==============================================================================
#define LINE_COD_1_STOP_BIT                     0
#define LINE_COD_1_5_STOP_BIT                   1
#define LINE_COD_2_STOP_BIT                     2
#define LINE_COD_1_PARITY_NONE                  0
#define LINE_COD_1_PARITY_ODD                   1
#define LINE_COD_1_PARITY_EVEN                  2
#define LINE_COD_1_PARITY_MARK                  3
#define LINE_COD_1_PARITY_SPACE                 4

//******************************************************************************
// Tipos de dados
//******************************************************************************
#pragma pack(1)
typedef struct
{
    uint8_t length;
    uint8_t descriptorType;
    uint16_t bcdUSB;
    uint8_t deviceClass;
    uint8_t deviceSubClass;
    uint8_t deviceProtocol;
    uint8_t maxPacketSize;
    uint16_t idVendor;
    uint16_t idProduct;
    uint16_t bcdDevice;
    uint8_t iManufacturer;
    uint8_t iProduct;
    uint8_t iSerialNumber;
    uint8_t numConfigurations;
} deviceDescriptor_t;

typedef struct
{
    uint8_t length;
    uint8_t descriptorType;
    uint8_t interfaceNumber;
    uint8_t alternateSetting;
    uint8_t numEndpoints;
    uint8_t interfaceClass;
    uint8_t interfaceSubclass;
    uint8_t interfaceProtocol;
    uint8_t iInterface;
} interfaceDescriptor_t;

typedef struct
{
    uint8_t length;
    uint8_t descriptorType;
    uint8_t descriptorSubtype;
    uint16_t bcdADC;
} functionalDescriptor_t;

typedef struct
{
    uint8_t length;
    uint8_t descriptorType;
    uint8_t descriptorSubtype;
    uint8_t mCapabilities;
} acmFunctionalDescriptor_t;

typedef struct
{
    uint8_t length;
    uint8_t descriptorType;
    uint8_t descriptorSubtype;
    uint8_t controlInterface;
    uint8_t subordinateInterface;
} unionFunctionalDescriptor_t;

typedef struct
{
    uint8_t length;
    uint8_t descriptorType;
    uint8_t descriptorSubtype;
    uint8_t mCapabilities;
    uint8_t dataInterface;
} callManagementDescriptor_t;

typedef struct
{
    uint8_t length;
    uint8_t descriptorType;
    uint8_t endpointAddress;
    uint8_t mAttributes;
    uint16_t maxPacketSize;
    uint8_t pollingInterval;
} endpointDescriptor_t;

typedef struct
{
    uint8_t length;
    uint8_t descriptorType;
    uint16_t totalLength;
    uint8_t numInterfaces;
    uint8_t configurationValue;
    uint8_t iConfiguration;
    uint8_t bmAttributes;
    uint8_t maxPower;    
} configurationDescriptor_t;

typedef struct
{
    configurationDescriptor_t configurationDescriptor;
    interfaceDescriptor_t interface0Descriptor;
    functionalDescriptor_t functionalDescriptor;
    acmFunctionalDescriptor_t acmFunctionalDescriptor;
    unionFunctionalDescriptor_t unionFunctionalDescriptor;
    callManagementDescriptor_t callManagementDescriptor;
    endpointDescriptor_t endpoint1Descriptor;
    interfaceDescriptor_t interface1Descriptor;
    endpointDescriptor_t endpoint2Descriptor;
    endpointDescriptor_t endpoint3Descriptor;
} cdcConfigurationDescriptor_t;

typedef union
{
    struct
    {
        uint8_t bmRequestType;
        uint8_t bRequest;
        uint16_t wValue;
        uint16_t wIndex;
        uint16_t wLength;
    };
    struct
    {
        uint8_t Recipient:5;
        uint8_t RequestType:2;
        uint8_t DataDir:1;
        uint8_t:8;
        uint16_t:16;
        uint16_t:16;
        uint16_t:16;
    };
    struct
    {
        uint8_t:8;
        uint8_t:8;
        uint8_t DeviceAddress:7;
        uint16_t:9;
        uint16_t:16;
        uint16_t:16;
    };
    struct
    {
        uint8_t:8;
        uint8_t:8;
        uint8_t DescriptorIndex;
        uint8_t DescriptorType;
        uint16_t LangID;
        uint16_t:16;
    };
    struct
    {
        uint16_t:16;
        uint8_t bConfigurationValue;
        uint8_t:8;
        uint16_t:16;
        uint16_t:16;
    };
    struct
    {
        uint16_t:16;
        uint8_t AlternateSetting:8;
        uint8_t:8;
        uint8_t Interface;
        uint8_t:8;
        uint16_t:16;
    };
} deviceRequestPacket_t;

typedef struct
{
    int32_t dwDTERate;
    int8_t bCharFormat;
    int8_t bParityType;
    int8_t bDataBits;
} lineCoding_t;
#pragma pack()

//******************************************************************************
// Macros
//******************************************************************************
#define sendAckToEndpoint0()            USBE0CSR0bits.TXRDY = 1
#define sendAckToEndpoint1()            USBE1CSR0bits.TXPKTRDY = 1
#define sendAckToEndpoint2()            USBE2CSR0bits.TXPKTRDY = 1

#endif
//******************************************************************************