#include <p32xxxx.h>
#include <sys/asm.h>
#include "ISR_Support.h"

	.set	nomips16
	.set 	noreorder
 	
	.extern vChangeNoticeEInterruptHandler
	.extern xISRStackTop
	.global	vChangeNoticeEInterruptWrapper

	.set	noreorder
	.set 	noat
	.ent	vChangeNoticeEInterruptWrapper

vChangeNoticeEInterruptWrapper:

	portSAVE_CONTEXT
	jal vChangeNoticeEInterruptHandler
	nop
	portRESTORE_CONTEXT

	.end	vChangeNoticeEInterruptWrapper



