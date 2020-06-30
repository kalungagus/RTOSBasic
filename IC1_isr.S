#include <p32xxxx.h>
#include <sys/asm.h>
#include "ISR_Support.h"

	.set	nomips16
	.set 	noreorder
 	
	.extern vIC1InterruptHandler
	.extern xISRStackTop
	.global	vIC1InterruptWrapper

	.set	noreorder
	.set 	noat
	.ent	vIC1InterruptWrapper

	
vIC1InterruptWrapper:

	portSAVE_CONTEXT
	jal vIC1InterruptHandler
	nop
	portRESTORE_CONTEXT

	.end	vIC1InterruptWrapper