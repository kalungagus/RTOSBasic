#include <p32xxxx.h>
#include <sys/asm.h>
#include "ISR_Support.h"

	.set	nomips16
	.set 	noreorder
 	
	.extern vTimer4InterruptHandler
	.extern xISRStackTop
	.global	vTimer4InterruptWrapper

	.set	noreorder
	.set 	noat
	.ent	vTimer4InterruptWrapper

	
vTimer4InterruptWrapper:

	portSAVE_CONTEXT
	jal vTimer4InterruptHandler
	nop
	portRESTORE_CONTEXT

	.end	vTimer4InterruptWrapper