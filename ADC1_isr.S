#include <p32xxxx.h>
#include <sys/asm.h>
#include "ISR_Support.h"

	.set	nomips16
	.set 	noreorder
 	
	.extern vADC1InterruptHandler
	.extern xISRStackTop
	.global	vADC1InterruptWrapper

	.set	noreorder
	.set 	noat
	.ent	vADC1InterruptWrapper

	
vADC1InterruptWrapper:

	portSAVE_CONTEXT
	jal vADC1InterruptHandler
	nop
	portRESTORE_CONTEXT

	.end	vADC1InterruptWrapper