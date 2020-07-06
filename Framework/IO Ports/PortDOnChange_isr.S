#include <p32xxxx.h>
#include <sys/asm.h>
#include "ISR_Support.h"

	.set	nomips16
	.set 	noreorder
 	
	.extern vChangeNoticeDInterruptHandler
	.extern xISRStackTop
	.global	vChangeNoticeDInterruptWrapper

	.set	noreorder
	.set 	noat
	.ent	vChangeNoticeDInterruptWrapper

vChangeNoticeDInterruptWrapper:

	portSAVE_CONTEXT
	jal vChangeNoticeDInterruptHandler
	nop
	portRESTORE_CONTEXT

	.end	vChangeNoticeDInterruptWrapper



