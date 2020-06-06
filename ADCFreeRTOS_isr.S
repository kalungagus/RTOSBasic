#include <p32xxxx.h>
#include <sys/asm.h>
#include "ISR_Support.h"

// ACD2 ===================================================
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

// ACD3 ===================================================
	.set	nomips16
	.set 	noreorder
 	
	.extern vADC3InterruptHandler
	.extern xISRStackTop
	.global	vADC3InterruptWrapper

	.set	noreorder
	.set 	noat
	.ent	vADC3InterruptWrapper

	
vADC3InterruptWrapper:

	portSAVE_CONTEXT
	jal vADC3InterruptHandler
	nop
	portRESTORE_CONTEXT

	.end	vADC3InterruptWrapper