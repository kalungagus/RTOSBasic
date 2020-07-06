#include <p32xxxx.h>
#include <sys/asm.h>
#include "ISR_Support.h"

	.set	nomips16
	.set 	noreorder
 	
	.extern vTimer2InterruptHandler
	.extern xISRStackTop
	.global	vTimer2InterruptWrapper

	.set	noreorder
	.set 	noat
	.ent	vTimer2InterruptWrapper

	
vTimer2InterruptWrapper:

	portSAVE_CONTEXT
	jal vTimer2InterruptHandler
	nop
	portRESTORE_CONTEXT

	.end	vTimer2InterruptWrapper