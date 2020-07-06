#include <p32xxxx.h>
#include <sys/asm.h>
#include "ISR_Support.h"

	.set	nomips16
	.set 	noreorder
 	
	.extern vChangeNoticeFInterruptHandler
	.extern xISRStackTop
	.global	vChangeNoticeFInterruptWrapper

	.set	noreorder
	.set 	noat
	.ent	vChangeNoticeFInterruptWrapper

vChangeNoticeFInterruptWrapper:

	portSAVE_CONTEXT
	jal vChangeNoticeFInterruptHandler
	nop
	portRESTORE_CONTEXT

	.end	vChangeNoticeFInterruptWrapper



