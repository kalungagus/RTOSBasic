#include <p32xxxx.h>
#include <sys/asm.h>
#include "ISR_Support.h"

	.set	nomips16
	.set 	noreorder
 	
	.extern vTimer5InterruptHandler
	.extern xISRStackTop
	.global	vTimer5InterruptWrapper

	.set	noreorder
	.set 	noat
	.ent	vTimer5InterruptWrapper

	
vTimer5InterruptWrapper:

	portSAVE_CONTEXT
	jal vTimer5InterruptHandler
	nop
	portRESTORE_CONTEXT

	.end	vTimer5InterruptWrapper