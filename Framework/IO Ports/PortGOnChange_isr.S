#include <p32xxxx.h>
#include <sys/asm.h>
#include "ISR_Support.h"

	.set	nomips16
	.set 	noreorder
 	
	.extern vChangeNoticeGInterruptHandler
	.extern xISRStackTop
	.global	vChangeNoticeGInterruptWrapper

	.set	noreorder
	.set 	noat
	.ent	vChangeNoticeGInterruptWrapper

vChangeNoticeGInterruptWrapper:

	portSAVE_CONTEXT
	jal vChangeNoticeGInterruptHandler
	nop
	portRESTORE_CONTEXT

	.end	vChangeNoticeGInterruptWrapper



