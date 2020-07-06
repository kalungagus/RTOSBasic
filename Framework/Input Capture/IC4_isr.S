#include <p32xxxx.h>
#include <sys/asm.h>
#include "ISR_Support.h"

	.set	nomips16
	.set 	noreorder
 	
	.extern vIC4InterruptHandler
	.extern xISRStackTop
	.global	vIC4InterruptWrapper

	.set	noreorder
	.set 	noat
	.ent	vIC4InterruptWrapper

	
vIC4InterruptWrapper:

	portSAVE_CONTEXT
	jal vIC4InterruptHandler
	nop
	portRESTORE_CONTEXT

	.end	vIC4InterruptWrapper