#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-PIC32MZ_Release.mk)" "nbproject/Makefile-local-PIC32MZ_Release.mk"
include nbproject/Makefile-local-PIC32MZ_Release.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=PIC32MZ_Release
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/RTOSBasic.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/RTOSBasic.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=SystemHooks.c USBPacketManager.c main.c LEDInterface.c USBFreeRTOS.c USBFreeRTOS_isr.S ADCFreeRTOS.c ADCFreeRTOS_isr.S PWMFreeRTOS.c Source/portable/MemMang/heap_4.c Source/portable/MPLAB/PIC32MZ/port.c Source/portable/MPLAB/PIC32MZ/port_asm.S Source/croutine.c Source/event_groups.c Source/list.c Source/queue.c Source/stream_buffer.c Source/tasks.c Source/timers.c DigitalPort.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/SystemHooks.o ${OBJECTDIR}/USBPacketManager.o ${OBJECTDIR}/main.o ${OBJECTDIR}/LEDInterface.o ${OBJECTDIR}/USBFreeRTOS.o ${OBJECTDIR}/USBFreeRTOS_isr.o ${OBJECTDIR}/ADCFreeRTOS.o ${OBJECTDIR}/ADCFreeRTOS_isr.o ${OBJECTDIR}/PWMFreeRTOS.o ${OBJECTDIR}/Source/portable/MemMang/heap_4.o ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port.o ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o ${OBJECTDIR}/Source/croutine.o ${OBJECTDIR}/Source/event_groups.o ${OBJECTDIR}/Source/list.o ${OBJECTDIR}/Source/queue.o ${OBJECTDIR}/Source/stream_buffer.o ${OBJECTDIR}/Source/tasks.o ${OBJECTDIR}/Source/timers.o ${OBJECTDIR}/DigitalPort.o
POSSIBLE_DEPFILES=${OBJECTDIR}/SystemHooks.o.d ${OBJECTDIR}/USBPacketManager.o.d ${OBJECTDIR}/main.o.d ${OBJECTDIR}/LEDInterface.o.d ${OBJECTDIR}/USBFreeRTOS.o.d ${OBJECTDIR}/USBFreeRTOS_isr.o.d ${OBJECTDIR}/ADCFreeRTOS.o.d ${OBJECTDIR}/ADCFreeRTOS_isr.o.d ${OBJECTDIR}/PWMFreeRTOS.o.d ${OBJECTDIR}/Source/portable/MemMang/heap_4.o.d ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port.o.d ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o.d ${OBJECTDIR}/Source/croutine.o.d ${OBJECTDIR}/Source/event_groups.o.d ${OBJECTDIR}/Source/list.o.d ${OBJECTDIR}/Source/queue.o.d ${OBJECTDIR}/Source/stream_buffer.o.d ${OBJECTDIR}/Source/tasks.o.d ${OBJECTDIR}/Source/timers.o.d ${OBJECTDIR}/DigitalPort.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/SystemHooks.o ${OBJECTDIR}/USBPacketManager.o ${OBJECTDIR}/main.o ${OBJECTDIR}/LEDInterface.o ${OBJECTDIR}/USBFreeRTOS.o ${OBJECTDIR}/USBFreeRTOS_isr.o ${OBJECTDIR}/ADCFreeRTOS.o ${OBJECTDIR}/ADCFreeRTOS_isr.o ${OBJECTDIR}/PWMFreeRTOS.o ${OBJECTDIR}/Source/portable/MemMang/heap_4.o ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port.o ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o ${OBJECTDIR}/Source/croutine.o ${OBJECTDIR}/Source/event_groups.o ${OBJECTDIR}/Source/list.o ${OBJECTDIR}/Source/queue.o ${OBJECTDIR}/Source/stream_buffer.o ${OBJECTDIR}/Source/tasks.o ${OBJECTDIR}/Source/timers.o ${OBJECTDIR}/DigitalPort.o

# Source Files
SOURCEFILES=SystemHooks.c USBPacketManager.c main.c LEDInterface.c USBFreeRTOS.c USBFreeRTOS_isr.S ADCFreeRTOS.c ADCFreeRTOS_isr.S PWMFreeRTOS.c Source/portable/MemMang/heap_4.c Source/portable/MPLAB/PIC32MZ/port.c Source/portable/MPLAB/PIC32MZ/port_asm.S Source/croutine.c Source/event_groups.c Source/list.c Source/queue.c Source/stream_buffer.c Source/tasks.c Source/timers.c DigitalPort.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-PIC32MZ_Release.mk dist/${CND_CONF}/${IMAGE_TYPE}/RTOSBasic.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MZ2048EFM100
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/USBFreeRTOS_isr.o: USBFreeRTOS_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/USBFreeRTOS_isr.o.d 
	@${RM} ${OBJECTDIR}/USBFreeRTOS_isr.o 
	@${RM} ${OBJECTDIR}/USBFreeRTOS_isr.o.ok ${OBJECTDIR}/USBFreeRTOS_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/USBFreeRTOS_isr.o.d" "${OBJECTDIR}/USBFreeRTOS_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/USBFreeRTOS_isr.o.d"  -o ${OBJECTDIR}/USBFreeRTOS_isr.o USBFreeRTOS_isr.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/USBFreeRTOS_isr.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/ADCFreeRTOS_isr.o: ADCFreeRTOS_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ADCFreeRTOS_isr.o.d 
	@${RM} ${OBJECTDIR}/ADCFreeRTOS_isr.o 
	@${RM} ${OBJECTDIR}/ADCFreeRTOS_isr.o.ok ${OBJECTDIR}/ADCFreeRTOS_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/ADCFreeRTOS_isr.o.d" "${OBJECTDIR}/ADCFreeRTOS_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/ADCFreeRTOS_isr.o.d"  -o ${OBJECTDIR}/ADCFreeRTOS_isr.o ADCFreeRTOS_isr.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/ADCFreeRTOS_isr.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o: Source/portable/MPLAB/PIC32MZ/port_asm.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ" 
	@${RM} ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o.d 
	@${RM} ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o 
	@${RM} ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o.ok ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o.d" "${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o.d"  -o ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o Source/portable/MPLAB/PIC32MZ/port_asm.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1 -mdfp=${DFP_DIR}
	
else
${OBJECTDIR}/USBFreeRTOS_isr.o: USBFreeRTOS_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/USBFreeRTOS_isr.o.d 
	@${RM} ${OBJECTDIR}/USBFreeRTOS_isr.o 
	@${RM} ${OBJECTDIR}/USBFreeRTOS_isr.o.ok ${OBJECTDIR}/USBFreeRTOS_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/USBFreeRTOS_isr.o.d" "${OBJECTDIR}/USBFreeRTOS_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/USBFreeRTOS_isr.o.d"  -o ${OBJECTDIR}/USBFreeRTOS_isr.o USBFreeRTOS_isr.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/USBFreeRTOS_isr.o.asm.d",--gdwarf-2 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/ADCFreeRTOS_isr.o: ADCFreeRTOS_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ADCFreeRTOS_isr.o.d 
	@${RM} ${OBJECTDIR}/ADCFreeRTOS_isr.o 
	@${RM} ${OBJECTDIR}/ADCFreeRTOS_isr.o.ok ${OBJECTDIR}/ADCFreeRTOS_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/ADCFreeRTOS_isr.o.d" "${OBJECTDIR}/ADCFreeRTOS_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/ADCFreeRTOS_isr.o.d"  -o ${OBJECTDIR}/ADCFreeRTOS_isr.o ADCFreeRTOS_isr.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/ADCFreeRTOS_isr.o.asm.d",--gdwarf-2 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o: Source/portable/MPLAB/PIC32MZ/port_asm.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ" 
	@${RM} ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o.d 
	@${RM} ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o 
	@${RM} ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o.ok ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o.d" "${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o.d"  -o ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o Source/portable/MPLAB/PIC32MZ/port_asm.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o.asm.d",--gdwarf-2 -mdfp=${DFP_DIR}
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/SystemHooks.o: SystemHooks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/SystemHooks.o.d 
	@${RM} ${OBJECTDIR}/SystemHooks.o 
	@${FIXDEPS} "${OBJECTDIR}/SystemHooks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/SystemHooks.o.d" -o ${OBJECTDIR}/SystemHooks.o SystemHooks.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/USBPacketManager.o: USBPacketManager.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/USBPacketManager.o.d 
	@${RM} ${OBJECTDIR}/USBPacketManager.o 
	@${FIXDEPS} "${OBJECTDIR}/USBPacketManager.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/USBPacketManager.o.d" -o ${OBJECTDIR}/USBPacketManager.o USBPacketManager.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/LEDInterface.o: LEDInterface.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/LEDInterface.o.d 
	@${RM} ${OBJECTDIR}/LEDInterface.o 
	@${FIXDEPS} "${OBJECTDIR}/LEDInterface.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/LEDInterface.o.d" -o ${OBJECTDIR}/LEDInterface.o LEDInterface.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/USBFreeRTOS.o: USBFreeRTOS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/USBFreeRTOS.o.d 
	@${RM} ${OBJECTDIR}/USBFreeRTOS.o 
	@${FIXDEPS} "${OBJECTDIR}/USBFreeRTOS.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/USBFreeRTOS.o.d" -o ${OBJECTDIR}/USBFreeRTOS.o USBFreeRTOS.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/ADCFreeRTOS.o: ADCFreeRTOS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ADCFreeRTOS.o.d 
	@${RM} ${OBJECTDIR}/ADCFreeRTOS.o 
	@${FIXDEPS} "${OBJECTDIR}/ADCFreeRTOS.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/ADCFreeRTOS.o.d" -o ${OBJECTDIR}/ADCFreeRTOS.o ADCFreeRTOS.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/PWMFreeRTOS.o: PWMFreeRTOS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/PWMFreeRTOS.o.d 
	@${RM} ${OBJECTDIR}/PWMFreeRTOS.o 
	@${FIXDEPS} "${OBJECTDIR}/PWMFreeRTOS.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/PWMFreeRTOS.o.d" -o ${OBJECTDIR}/PWMFreeRTOS.o PWMFreeRTOS.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Source/portable/MemMang/heap_4.o: Source/portable/MemMang/heap_4.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Source/portable/MemMang" 
	@${RM} ${OBJECTDIR}/Source/portable/MemMang/heap_4.o.d 
	@${RM} ${OBJECTDIR}/Source/portable/MemMang/heap_4.o 
	@${FIXDEPS} "${OBJECTDIR}/Source/portable/MemMang/heap_4.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Source/portable/MemMang/heap_4.o.d" -o ${OBJECTDIR}/Source/portable/MemMang/heap_4.o Source/portable/MemMang/heap_4.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port.o: Source/portable/MPLAB/PIC32MZ/port.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ" 
	@${RM} ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port.o.d 
	@${RM} ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port.o 
	@${FIXDEPS} "${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port.o.d" -o ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port.o Source/portable/MPLAB/PIC32MZ/port.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Source/croutine.o: Source/croutine.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Source" 
	@${RM} ${OBJECTDIR}/Source/croutine.o.d 
	@${RM} ${OBJECTDIR}/Source/croutine.o 
	@${FIXDEPS} "${OBJECTDIR}/Source/croutine.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Source/croutine.o.d" -o ${OBJECTDIR}/Source/croutine.o Source/croutine.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Source/event_groups.o: Source/event_groups.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Source" 
	@${RM} ${OBJECTDIR}/Source/event_groups.o.d 
	@${RM} ${OBJECTDIR}/Source/event_groups.o 
	@${FIXDEPS} "${OBJECTDIR}/Source/event_groups.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Source/event_groups.o.d" -o ${OBJECTDIR}/Source/event_groups.o Source/event_groups.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Source/list.o: Source/list.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Source" 
	@${RM} ${OBJECTDIR}/Source/list.o.d 
	@${RM} ${OBJECTDIR}/Source/list.o 
	@${FIXDEPS} "${OBJECTDIR}/Source/list.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Source/list.o.d" -o ${OBJECTDIR}/Source/list.o Source/list.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Source/queue.o: Source/queue.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Source" 
	@${RM} ${OBJECTDIR}/Source/queue.o.d 
	@${RM} ${OBJECTDIR}/Source/queue.o 
	@${FIXDEPS} "${OBJECTDIR}/Source/queue.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Source/queue.o.d" -o ${OBJECTDIR}/Source/queue.o Source/queue.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Source/stream_buffer.o: Source/stream_buffer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Source" 
	@${RM} ${OBJECTDIR}/Source/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/Source/stream_buffer.o 
	@${FIXDEPS} "${OBJECTDIR}/Source/stream_buffer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Source/stream_buffer.o.d" -o ${OBJECTDIR}/Source/stream_buffer.o Source/stream_buffer.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Source/tasks.o: Source/tasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Source" 
	@${RM} ${OBJECTDIR}/Source/tasks.o.d 
	@${RM} ${OBJECTDIR}/Source/tasks.o 
	@${FIXDEPS} "${OBJECTDIR}/Source/tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Source/tasks.o.d" -o ${OBJECTDIR}/Source/tasks.o Source/tasks.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Source/timers.o: Source/timers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Source" 
	@${RM} ${OBJECTDIR}/Source/timers.o.d 
	@${RM} ${OBJECTDIR}/Source/timers.o 
	@${FIXDEPS} "${OBJECTDIR}/Source/timers.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Source/timers.o.d" -o ${OBJECTDIR}/Source/timers.o Source/timers.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/DigitalPort.o: DigitalPort.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/DigitalPort.o.d 
	@${RM} ${OBJECTDIR}/DigitalPort.o 
	@${FIXDEPS} "${OBJECTDIR}/DigitalPort.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/DigitalPort.o.d" -o ${OBJECTDIR}/DigitalPort.o DigitalPort.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
else
${OBJECTDIR}/SystemHooks.o: SystemHooks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/SystemHooks.o.d 
	@${RM} ${OBJECTDIR}/SystemHooks.o 
	@${FIXDEPS} "${OBJECTDIR}/SystemHooks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/SystemHooks.o.d" -o ${OBJECTDIR}/SystemHooks.o SystemHooks.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/USBPacketManager.o: USBPacketManager.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/USBPacketManager.o.d 
	@${RM} ${OBJECTDIR}/USBPacketManager.o 
	@${FIXDEPS} "${OBJECTDIR}/USBPacketManager.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/USBPacketManager.o.d" -o ${OBJECTDIR}/USBPacketManager.o USBPacketManager.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/LEDInterface.o: LEDInterface.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/LEDInterface.o.d 
	@${RM} ${OBJECTDIR}/LEDInterface.o 
	@${FIXDEPS} "${OBJECTDIR}/LEDInterface.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/LEDInterface.o.d" -o ${OBJECTDIR}/LEDInterface.o LEDInterface.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/USBFreeRTOS.o: USBFreeRTOS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/USBFreeRTOS.o.d 
	@${RM} ${OBJECTDIR}/USBFreeRTOS.o 
	@${FIXDEPS} "${OBJECTDIR}/USBFreeRTOS.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/USBFreeRTOS.o.d" -o ${OBJECTDIR}/USBFreeRTOS.o USBFreeRTOS.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/ADCFreeRTOS.o: ADCFreeRTOS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ADCFreeRTOS.o.d 
	@${RM} ${OBJECTDIR}/ADCFreeRTOS.o 
	@${FIXDEPS} "${OBJECTDIR}/ADCFreeRTOS.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/ADCFreeRTOS.o.d" -o ${OBJECTDIR}/ADCFreeRTOS.o ADCFreeRTOS.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/PWMFreeRTOS.o: PWMFreeRTOS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/PWMFreeRTOS.o.d 
	@${RM} ${OBJECTDIR}/PWMFreeRTOS.o 
	@${FIXDEPS} "${OBJECTDIR}/PWMFreeRTOS.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/PWMFreeRTOS.o.d" -o ${OBJECTDIR}/PWMFreeRTOS.o PWMFreeRTOS.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Source/portable/MemMang/heap_4.o: Source/portable/MemMang/heap_4.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Source/portable/MemMang" 
	@${RM} ${OBJECTDIR}/Source/portable/MemMang/heap_4.o.d 
	@${RM} ${OBJECTDIR}/Source/portable/MemMang/heap_4.o 
	@${FIXDEPS} "${OBJECTDIR}/Source/portable/MemMang/heap_4.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Source/portable/MemMang/heap_4.o.d" -o ${OBJECTDIR}/Source/portable/MemMang/heap_4.o Source/portable/MemMang/heap_4.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port.o: Source/portable/MPLAB/PIC32MZ/port.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ" 
	@${RM} ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port.o.d 
	@${RM} ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port.o 
	@${FIXDEPS} "${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port.o.d" -o ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port.o Source/portable/MPLAB/PIC32MZ/port.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Source/croutine.o: Source/croutine.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Source" 
	@${RM} ${OBJECTDIR}/Source/croutine.o.d 
	@${RM} ${OBJECTDIR}/Source/croutine.o 
	@${FIXDEPS} "${OBJECTDIR}/Source/croutine.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Source/croutine.o.d" -o ${OBJECTDIR}/Source/croutine.o Source/croutine.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Source/event_groups.o: Source/event_groups.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Source" 
	@${RM} ${OBJECTDIR}/Source/event_groups.o.d 
	@${RM} ${OBJECTDIR}/Source/event_groups.o 
	@${FIXDEPS} "${OBJECTDIR}/Source/event_groups.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Source/event_groups.o.d" -o ${OBJECTDIR}/Source/event_groups.o Source/event_groups.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Source/list.o: Source/list.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Source" 
	@${RM} ${OBJECTDIR}/Source/list.o.d 
	@${RM} ${OBJECTDIR}/Source/list.o 
	@${FIXDEPS} "${OBJECTDIR}/Source/list.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Source/list.o.d" -o ${OBJECTDIR}/Source/list.o Source/list.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Source/queue.o: Source/queue.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Source" 
	@${RM} ${OBJECTDIR}/Source/queue.o.d 
	@${RM} ${OBJECTDIR}/Source/queue.o 
	@${FIXDEPS} "${OBJECTDIR}/Source/queue.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Source/queue.o.d" -o ${OBJECTDIR}/Source/queue.o Source/queue.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Source/stream_buffer.o: Source/stream_buffer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Source" 
	@${RM} ${OBJECTDIR}/Source/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/Source/stream_buffer.o 
	@${FIXDEPS} "${OBJECTDIR}/Source/stream_buffer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Source/stream_buffer.o.d" -o ${OBJECTDIR}/Source/stream_buffer.o Source/stream_buffer.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Source/tasks.o: Source/tasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Source" 
	@${RM} ${OBJECTDIR}/Source/tasks.o.d 
	@${RM} ${OBJECTDIR}/Source/tasks.o 
	@${FIXDEPS} "${OBJECTDIR}/Source/tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Source/tasks.o.d" -o ${OBJECTDIR}/Source/tasks.o Source/tasks.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Source/timers.o: Source/timers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Source" 
	@${RM} ${OBJECTDIR}/Source/timers.o.d 
	@${RM} ${OBJECTDIR}/Source/timers.o 
	@${FIXDEPS} "${OBJECTDIR}/Source/timers.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Source/timers.o.d" -o ${OBJECTDIR}/Source/timers.o Source/timers.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/DigitalPort.o: DigitalPort.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/DigitalPort.o.d 
	@${RM} ${OBJECTDIR}/DigitalPort.o 
	@${FIXDEPS} "${OBJECTDIR}/DigitalPort.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/DigitalPort.o.d" -o ${OBJECTDIR}/DigitalPort.o DigitalPort.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/RTOSBasic.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g -mdebugger -D__MPLAB_DEBUGGER_PK3=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/RTOSBasic.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x0:0x37F   -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=__MPLAB_DEBUGGER_PK3=1,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp=${DFP_DIR}
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/RTOSBasic.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/RTOSBasic.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp=${DFP_DIR}
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/RTOSBasic.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/PIC32MZ_Release
	${RM} -r dist/PIC32MZ_Release

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
