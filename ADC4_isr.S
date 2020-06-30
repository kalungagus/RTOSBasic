#include <p32xxxx.h>
#include <sys/asm.h>
#include "ISR_Support.h"

	.set	nomips16
	.set 	noreorder
 	
	.extern vADC4InterruptHandler
	.extern xISRStackTop
	.global	vADC4InterruptWrapper

	.set	noreorder
	.set 	noat
	.ent	vADC4InterruptWrapper

	
vADC4InterruptWrapper:

	portSAVE_CONTEXT
	jal vADC4InterruptHandler
	nop
	portRESTORE_CONTEXT

	.end	vADC4InterruptWrapper