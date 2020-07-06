//******************************************************************************
//                               USBConfig
//
// Data:       06/05/2020
// Descrição:  Configurações para a porta USB
//******************************************************************************

#ifndef _USB_CONFIG_
#define _USB_CONFIG_

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
// Buffer Sizes (Múltiplos de 8, por exemplo, 8, 16, 32, 64, 512, 1024
//******************************************************************************
#define EP0BUFFSIZE                         64
#define EP1TXBUFFSIZE                       64
#define EP2TXBUFFSIZE                       512
#define EP3RXBUFFSIZE                       512
#define RECEPTION_BUFFER_SIZE               512

#define VENDOR_ID                           0x04D8
#define PRODUCT_ID                          0x000A
#define DEVICE_RELEASE_BCD_VERSION          0x0200    // 2.0
#define CURRENT_CONSUMPTION_MA              100

#define USB_PACKET_RECEPTION_TIMEOUT_MS     50.0f    

/*********************************************************************
 String Descriptor Table (below) - These must be Unicode 16 (UTF-16)
 *********************************************************************/

 /*********************************************************************
Language ID Descriptor
*********************************************************************/
unsigned char string0[] = {	
/* 	Descriptor Length                       */	4, /* 4 or 0x04 */
/*  DescriptorType: STRING  				*/	0x03,
/* 	Language ID: English					*/	0x09,0x04
												}; // 0x0409
/* *******************************************************************
String Descriptor: "Lewis Technologies Group"
*********************************************************************/
unsigned char string1[] = {	
/* 	Descriptor Length                       */	38, 
/*  DescriptorType: STRING  				*/  0x03,
/*	Vendor Name     						*/	'P',0,'I',0,'C',0,'3',0,'2',0,
'M',0,'Z',0,' ',0,'C',0,'D',0,'C',0,' ',0,'A',0,'C',0,'M',0,' ',0,'v',0,'2',0	
};						

/*********************************************************************
 String Descriptor (Product Name): "USB Example"
 *********************************************************************/
 unsigned char string2[] = {
 /* Descriptor Length                       */ 	40, /* 40 or 0x28 */
/*  DescriptorType: STRING  				*/  0x03,
 /* Product Name                            */	'V',0,'i',0,'r',0,'t',0,
'u',0,'a',0,'l',0,' ',0,'S',0,'e',0,'r',0,'i',0,'a',0,'l',0,' ',0,'P',0,
'o',0,'r',0,'t',0
 }; 
 
/*********************************************************************
 String Descriptor (Serial Number): "xxx-xxxx"
*********************************************************************/
 unsigned char string3[] = {
 /* Descriptor Length                       */ 	18, /* 18 or 0x12 */
/*  DescriptorType: STRING  				*/  0x03,
 /* Serial Number                           */	'1',0,'2',0,'3',0,'-',0,
'4',0,'5',0,'6',0,'7',0
 };	

 unsigned char string4[] = {
 /* Descriptor Length                       */ 	4, /* 4 or 0x04 */
/*  DescriptorType: STRING  				*/  0x03,
 /* Configuration                           */	0x01, 0x00
 };
 
 unsigned char string5[] = {
 /* Descriptor Length                       */ 	10, /* 10 or 0x0A */
/*  DescriptorType: STRING  				*/  0x03,
 /* Interface                               */	'T',0,'e',0,'s',0,'t',0
 };

#endif
//******************************************************************************

