#include <p32xxxx.h>
#include <sys/asm.h>
#include "ISR_Support.h"

	.set	nomips16
	.set 	noreorder
 	
	.extern vTimer3InterruptHandler
	.extern xISRStackTop
	.global	vTimer3InterruptWrapper

	.set	noreorder
	.set 	noat
	.ent	vTimer3InterruptWrapper

	
vTimer3InterruptWrapper:

	portSAVE_CONTEXT
	jal vTimer3InterruptHandler
	nop
	portRESTORE_CONTEXT

	.end	vTimer3InterruptWrapper