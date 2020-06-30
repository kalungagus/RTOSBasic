#include <p32xxxx.h>
#include <sys/asm.h>
#include "ISR_Support.h"

	.set	nomips16
	.set 	noreorder
 	
	.extern vADC2InterruptHandler
	.extern xISRStackTop
	.global	vADC2InterruptWrapper

	.set	noreorder
	.set 	noat
	.ent	vADC2InterruptWrapper

	
vADC2InterruptWrapper:

	portSAVE_CONTEXT
	jal vADC2InterruptHandler
	nop
	portRESTORE_CONTEXT

	.end	vADC2InterruptWrapper