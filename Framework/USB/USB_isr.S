#include <p32xxxx.h>
#include <sys/asm.h>
#include "ISR_Support.h"

	.set	nomips16
	.set 	noreorder
 	
	.extern vUSBInterruptHandler
	.extern xISRStackTop
	.global	vUSBInterruptWrapper

	.set	noreorder
	.set 	noat
	.ent	vUSBInterruptWrapper

vUSBInterruptWrapper:

	portSAVE_CONTEXT
	jal vUSBInterruptHandler
	nop
	portRESTORE_CONTEXT

	.end	vUSBInterruptWrapper



