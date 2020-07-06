#include <p32xxxx.h>
#include <sys/asm.h>
#include "ISR_Support.h"

	.set	nomips16
	.set 	noreorder
 	
	.extern vChangeNoticeBInterruptHandler
	.extern xISRStackTop
	.global	vChangeNoticeBInterruptWrapper

	.set	noreorder
	.set 	noat
	.ent	vChangeNoticeBInterruptWrapper

vChangeNoticeBInterruptWrapper:

	portSAVE_CONTEXT
	jal vChangeNoticeBInterruptHandler
	nop
	portRESTORE_CONTEXT

	.end	vChangeNoticeBInterruptWrapper



