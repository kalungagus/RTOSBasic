#include <p32xxxx.h>
#include <sys/asm.h>
#include "ISR_Support.h"

	.set	nomips16
	.set 	noreorder
 	
	.extern vChangeNoticeCInterruptHandler
	.extern xISRStackTop
	.global	vChangeNoticeCInterruptWrapper

	.set	noreorder
	.set 	noat
	.ent	vChangeNoticeCInterruptWrapper

vChangeNoticeCInterruptWrapper:

	portSAVE_CONTEXT
	jal vChangeNoticeCInterruptHandler
	nop
	portRESTORE_CONTEXT

	.end	vChangeNoticeCInterruptWrapper



