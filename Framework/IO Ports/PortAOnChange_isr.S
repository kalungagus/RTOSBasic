#include <p32xxxx.h>
#include <sys/asm.h>
#include "ISR_Support.h"

	.set	nomips16
	.set 	noreorder
 	
	.extern vChangeNoticeAInterruptHandler
	.extern xISRStackTop
	.global	vChangeNoticeAInterruptWrapper

	.set	noreorder
	.set 	noat
	.ent	vChangeNoticeAInterruptWrapper

vChangeNoticeAInterruptWrapper:

	portSAVE_CONTEXT
	jal vChangeNoticeAInterruptHandler
	nop
	portRESTORE_CONTEXT

	.end	vChangeNoticeAInterruptWrapper



