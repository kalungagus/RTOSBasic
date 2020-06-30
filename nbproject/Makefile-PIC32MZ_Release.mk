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
SOURCEFILES_QUOTED_IF_SPACED=SystemHooks.c USBPacketManager.c main.c ADCFreeRTOS.c ADC2_isr.S ADC3_isr.S ADC1_isr.S ADC4_isr.S HC-SR04.c HX711.c I2C.c INA219.c InputCapture.c IC2_isr.S IC4_isr.S IC1_isr.S IC3_isr.S IOPorts.c LEDInterface.c PWMFreeRTOS.c Timer.c Timer3_isr.S Timer2_isr.S Timer4_isr.S Timer5_isr.S USBFreeRTOS_isr.S USBFreeRTOS.c Source/portable/MemMang/heap_4.c Source/portable/MPLAB/PIC32MZ/port.c Source/portable/MPLAB/PIC32MZ/port_asm.S Source/croutine.c Source/event_groups.c Source/list.c Source/queue.c Source/stream_buffer.c Source/tasks.c Source/timers.c PortAOnChange_isr.S PortBOnChange_isr.S PortCOnChange_isr.S PortDOnChange_isr.S PortEOnChange_isr.S PortFOnChange_isr.S PortGOnChange_isr.S

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/SystemHooks.o ${OBJECTDIR}/USBPacketManager.o ${OBJECTDIR}/main.o ${OBJECTDIR}/ADCFreeRTOS.o ${OBJECTDIR}/ADC2_isr.o ${OBJECTDIR}/ADC3_isr.o ${OBJECTDIR}/ADC1_isr.o ${OBJECTDIR}/ADC4_isr.o ${OBJECTDIR}/HC-SR04.o ${OBJECTDIR}/HX711.o ${OBJECTDIR}/I2C.o ${OBJECTDIR}/INA219.o ${OBJECTDIR}/InputCapture.o ${OBJECTDIR}/IC2_isr.o ${OBJECTDIR}/IC4_isr.o ${OBJECTDIR}/IC1_isr.o ${OBJECTDIR}/IC3_isr.o ${OBJECTDIR}/IOPorts.o ${OBJECTDIR}/LEDInterface.o ${OBJECTDIR}/PWMFreeRTOS.o ${OBJECTDIR}/Timer.o ${OBJECTDIR}/Timer3_isr.o ${OBJECTDIR}/Timer2_isr.o ${OBJECTDIR}/Timer4_isr.o ${OBJECTDIR}/Timer5_isr.o ${OBJECTDIR}/USBFreeRTOS_isr.o ${OBJECTDIR}/USBFreeRTOS.o ${OBJECTDIR}/Source/portable/MemMang/heap_4.o ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port.o ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o ${OBJECTDIR}/Source/croutine.o ${OBJECTDIR}/Source/event_groups.o ${OBJECTDIR}/Source/list.o ${OBJECTDIR}/Source/queue.o ${OBJECTDIR}/Source/stream_buffer.o ${OBJECTDIR}/Source/tasks.o ${OBJECTDIR}/Source/timers.o ${OBJECTDIR}/PortAOnChange_isr.o ${OBJECTDIR}/PortBOnChange_isr.o ${OBJECTDIR}/PortCOnChange_isr.o ${OBJECTDIR}/PortDOnChange_isr.o ${OBJECTDIR}/PortEOnChange_isr.o ${OBJECTDIR}/PortFOnChange_isr.o ${OBJECTDIR}/PortGOnChange_isr.o
POSSIBLE_DEPFILES=${OBJECTDIR}/SystemHooks.o.d ${OBJECTDIR}/USBPacketManager.o.d ${OBJECTDIR}/main.o.d ${OBJECTDIR}/ADCFreeRTOS.o.d ${OBJECTDIR}/ADC2_isr.o.d ${OBJECTDIR}/ADC3_isr.o.d ${OBJECTDIR}/ADC1_isr.o.d ${OBJECTDIR}/ADC4_isr.o.d ${OBJECTDIR}/HC-SR04.o.d ${OBJECTDIR}/HX711.o.d ${OBJECTDIR}/I2C.o.d ${OBJECTDIR}/INA219.o.d ${OBJECTDIR}/InputCapture.o.d ${OBJECTDIR}/IC2_isr.o.d ${OBJECTDIR}/IC4_isr.o.d ${OBJECTDIR}/IC1_isr.o.d ${OBJECTDIR}/IC3_isr.o.d ${OBJECTDIR}/IOPorts.o.d ${OBJECTDIR}/LEDInterface.o.d ${OBJECTDIR}/PWMFreeRTOS.o.d ${OBJECTDIR}/Timer.o.d ${OBJECTDIR}/Timer3_isr.o.d ${OBJECTDIR}/Timer2_isr.o.d ${OBJECTDIR}/Timer4_isr.o.d ${OBJECTDIR}/Timer5_isr.o.d ${OBJECTDIR}/USBFreeRTOS_isr.o.d ${OBJECTDIR}/USBFreeRTOS.o.d ${OBJECTDIR}/Source/portable/MemMang/heap_4.o.d ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port.o.d ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o.d ${OBJECTDIR}/Source/croutine.o.d ${OBJECTDIR}/Source/event_groups.o.d ${OBJECTDIR}/Source/list.o.d ${OBJECTDIR}/Source/queue.o.d ${OBJECTDIR}/Source/stream_buffer.o.d ${OBJECTDIR}/Source/tasks.o.d ${OBJECTDIR}/Source/timers.o.d ${OBJECTDIR}/PortAOnChange_isr.o.d ${OBJECTDIR}/PortBOnChange_isr.o.d ${OBJECTDIR}/PortCOnChange_isr.o.d ${OBJECTDIR}/PortDOnChange_isr.o.d ${OBJECTDIR}/PortEOnChange_isr.o.d ${OBJECTDIR}/PortFOnChange_isr.o.d ${OBJECTDIR}/PortGOnChange_isr.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/SystemHooks.o ${OBJECTDIR}/USBPacketManager.o ${OBJECTDIR}/main.o ${OBJECTDIR}/ADCFreeRTOS.o ${OBJECTDIR}/ADC2_isr.o ${OBJECTDIR}/ADC3_isr.o ${OBJECTDIR}/ADC1_isr.o ${OBJECTDIR}/ADC4_isr.o ${OBJECTDIR}/HC-SR04.o ${OBJECTDIR}/HX711.o ${OBJECTDIR}/I2C.o ${OBJECTDIR}/INA219.o ${OBJECTDIR}/InputCapture.o ${OBJECTDIR}/IC2_isr.o ${OBJECTDIR}/IC4_isr.o ${OBJECTDIR}/IC1_isr.o ${OBJECTDIR}/IC3_isr.o ${OBJECTDIR}/IOPorts.o ${OBJECTDIR}/LEDInterface.o ${OBJECTDIR}/PWMFreeRTOS.o ${OBJECTDIR}/Timer.o ${OBJECTDIR}/Timer3_isr.o ${OBJECTDIR}/Timer2_isr.o ${OBJECTDIR}/Timer4_isr.o ${OBJECTDIR}/Timer5_isr.o ${OBJECTDIR}/USBFreeRTOS_isr.o ${OBJECTDIR}/USBFreeRTOS.o ${OBJECTDIR}/Source/portable/MemMang/heap_4.o ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port.o ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o ${OBJECTDIR}/Source/croutine.o ${OBJECTDIR}/Source/event_groups.o ${OBJECTDIR}/Source/list.o ${OBJECTDIR}/Source/queue.o ${OBJECTDIR}/Source/stream_buffer.o ${OBJECTDIR}/Source/tasks.o ${OBJECTDIR}/Source/timers.o ${OBJECTDIR}/PortAOnChange_isr.o ${OBJECTDIR}/PortBOnChange_isr.o ${OBJECTDIR}/PortCOnChange_isr.o ${OBJECTDIR}/PortDOnChange_isr.o ${OBJECTDIR}/PortEOnChange_isr.o ${OBJECTDIR}/PortFOnChange_isr.o ${OBJECTDIR}/PortGOnChange_isr.o

# Source Files
SOURCEFILES=SystemHooks.c USBPacketManager.c main.c ADCFreeRTOS.c ADC2_isr.S ADC3_isr.S ADC1_isr.S ADC4_isr.S HC-SR04.c HX711.c I2C.c INA219.c InputCapture.c IC2_isr.S IC4_isr.S IC1_isr.S IC3_isr.S IOPorts.c LEDInterface.c PWMFreeRTOS.c Timer.c Timer3_isr.S Timer2_isr.S Timer4_isr.S Timer5_isr.S USBFreeRTOS_isr.S USBFreeRTOS.c Source/portable/MemMang/heap_4.c Source/portable/MPLAB/PIC32MZ/port.c Source/portable/MPLAB/PIC32MZ/port_asm.S Source/croutine.c Source/event_groups.c Source/list.c Source/queue.c Source/stream_buffer.c Source/tasks.c Source/timers.c PortAOnChange_isr.S PortBOnChange_isr.S PortCOnChange_isr.S PortDOnChange_isr.S PortEOnChange_isr.S PortFOnChange_isr.S PortGOnChange_isr.S



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
${OBJECTDIR}/ADC2_isr.o: ADC2_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ADC2_isr.o.d 
	@${RM} ${OBJECTDIR}/ADC2_isr.o 
	@${RM} ${OBJECTDIR}/ADC2_isr.o.ok ${OBJECTDIR}/ADC2_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/ADC2_isr.o.d" "${OBJECTDIR}/ADC2_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/ADC2_isr.o.d"  -o ${OBJECTDIR}/ADC2_isr.o ADC2_isr.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/ADC2_isr.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/ADC3_isr.o: ADC3_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ADC3_isr.o.d 
	@${RM} ${OBJECTDIR}/ADC3_isr.o 
	@${RM} ${OBJECTDIR}/ADC3_isr.o.ok ${OBJECTDIR}/ADC3_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/ADC3_isr.o.d" "${OBJECTDIR}/ADC3_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/ADC3_isr.o.d"  -o ${OBJECTDIR}/ADC3_isr.o ADC3_isr.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/ADC3_isr.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/ADC1_isr.o: ADC1_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ADC1_isr.o.d 
	@${RM} ${OBJECTDIR}/ADC1_isr.o 
	@${RM} ${OBJECTDIR}/ADC1_isr.o.ok ${OBJECTDIR}/ADC1_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/ADC1_isr.o.d" "${OBJECTDIR}/ADC1_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/ADC1_isr.o.d"  -o ${OBJECTDIR}/ADC1_isr.o ADC1_isr.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/ADC1_isr.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/ADC4_isr.o: ADC4_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ADC4_isr.o.d 
	@${RM} ${OBJECTDIR}/ADC4_isr.o 
	@${RM} ${OBJECTDIR}/ADC4_isr.o.ok ${OBJECTDIR}/ADC4_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/ADC4_isr.o.d" "${OBJECTDIR}/ADC4_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/ADC4_isr.o.d"  -o ${OBJECTDIR}/ADC4_isr.o ADC4_isr.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/ADC4_isr.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/IC2_isr.o: IC2_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/IC2_isr.o.d 
	@${RM} ${OBJECTDIR}/IC2_isr.o 
	@${RM} ${OBJECTDIR}/IC2_isr.o.ok ${OBJECTDIR}/IC2_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/IC2_isr.o.d" "${OBJECTDIR}/IC2_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/IC2_isr.o.d"  -o ${OBJECTDIR}/IC2_isr.o IC2_isr.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/IC2_isr.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/IC4_isr.o: IC4_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/IC4_isr.o.d 
	@${RM} ${OBJECTDIR}/IC4_isr.o 
	@${RM} ${OBJECTDIR}/IC4_isr.o.ok ${OBJECTDIR}/IC4_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/IC4_isr.o.d" "${OBJECTDIR}/IC4_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/IC4_isr.o.d"  -o ${OBJECTDIR}/IC4_isr.o IC4_isr.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/IC4_isr.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/IC1_isr.o: IC1_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/IC1_isr.o.d 
	@${RM} ${OBJECTDIR}/IC1_isr.o 
	@${RM} ${OBJECTDIR}/IC1_isr.o.ok ${OBJECTDIR}/IC1_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/IC1_isr.o.d" "${OBJECTDIR}/IC1_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/IC1_isr.o.d"  -o ${OBJECTDIR}/IC1_isr.o IC1_isr.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/IC1_isr.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/IC3_isr.o: IC3_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/IC3_isr.o.d 
	@${RM} ${OBJECTDIR}/IC3_isr.o 
	@${RM} ${OBJECTDIR}/IC3_isr.o.ok ${OBJECTDIR}/IC3_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/IC3_isr.o.d" "${OBJECTDIR}/IC3_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/IC3_isr.o.d"  -o ${OBJECTDIR}/IC3_isr.o IC3_isr.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/IC3_isr.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Timer3_isr.o: Timer3_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Timer3_isr.o.d 
	@${RM} ${OBJECTDIR}/Timer3_isr.o 
	@${RM} ${OBJECTDIR}/Timer3_isr.o.ok ${OBJECTDIR}/Timer3_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Timer3_isr.o.d" "${OBJECTDIR}/Timer3_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Timer3_isr.o.d"  -o ${OBJECTDIR}/Timer3_isr.o Timer3_isr.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Timer3_isr.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Timer2_isr.o: Timer2_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Timer2_isr.o.d 
	@${RM} ${OBJECTDIR}/Timer2_isr.o 
	@${RM} ${OBJECTDIR}/Timer2_isr.o.ok ${OBJECTDIR}/Timer2_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Timer2_isr.o.d" "${OBJECTDIR}/Timer2_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Timer2_isr.o.d"  -o ${OBJECTDIR}/Timer2_isr.o Timer2_isr.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Timer2_isr.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Timer4_isr.o: Timer4_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Timer4_isr.o.d 
	@${RM} ${OBJECTDIR}/Timer4_isr.o 
	@${RM} ${OBJECTDIR}/Timer4_isr.o.ok ${OBJECTDIR}/Timer4_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Timer4_isr.o.d" "${OBJECTDIR}/Timer4_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Timer4_isr.o.d"  -o ${OBJECTDIR}/Timer4_isr.o Timer4_isr.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Timer4_isr.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Timer5_isr.o: Timer5_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Timer5_isr.o.d 
	@${RM} ${OBJECTDIR}/Timer5_isr.o 
	@${RM} ${OBJECTDIR}/Timer5_isr.o.ok ${OBJECTDIR}/Timer5_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Timer5_isr.o.d" "${OBJECTDIR}/Timer5_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Timer5_isr.o.d"  -o ${OBJECTDIR}/Timer5_isr.o Timer5_isr.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Timer5_isr.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/USBFreeRTOS_isr.o: USBFreeRTOS_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/USBFreeRTOS_isr.o.d 
	@${RM} ${OBJECTDIR}/USBFreeRTOS_isr.o 
	@${RM} ${OBJECTDIR}/USBFreeRTOS_isr.o.ok ${OBJECTDIR}/USBFreeRTOS_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/USBFreeRTOS_isr.o.d" "${OBJECTDIR}/USBFreeRTOS_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/USBFreeRTOS_isr.o.d"  -o ${OBJECTDIR}/USBFreeRTOS_isr.o USBFreeRTOS_isr.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/USBFreeRTOS_isr.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o: Source/portable/MPLAB/PIC32MZ/port_asm.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ" 
	@${RM} ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o.d 
	@${RM} ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o 
	@${RM} ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o.ok ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o.d" "${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o.d"  -o ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o Source/portable/MPLAB/PIC32MZ/port_asm.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/PortAOnChange_isr.o: PortAOnChange_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/PortAOnChange_isr.o.d 
	@${RM} ${OBJECTDIR}/PortAOnChange_isr.o 
	@${RM} ${OBJECTDIR}/PortAOnChange_isr.o.ok ${OBJECTDIR}/PortAOnChange_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/PortAOnChange_isr.o.d" "${OBJECTDIR}/PortAOnChange_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/PortAOnChange_isr.o.d"  -o ${OBJECTDIR}/PortAOnChange_isr.o PortAOnChange_isr.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/PortAOnChange_isr.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/PortBOnChange_isr.o: PortBOnChange_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/PortBOnChange_isr.o.d 
	@${RM} ${OBJECTDIR}/PortBOnChange_isr.o 
	@${RM} ${OBJECTDIR}/PortBOnChange_isr.o.ok ${OBJECTDIR}/PortBOnChange_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/PortBOnChange_isr.o.d" "${OBJECTDIR}/PortBOnChange_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/PortBOnChange_isr.o.d"  -o ${OBJECTDIR}/PortBOnChange_isr.o PortBOnChange_isr.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/PortBOnChange_isr.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/PortCOnChange_isr.o: PortCOnChange_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/PortCOnChange_isr.o.d 
	@${RM} ${OBJECTDIR}/PortCOnChange_isr.o 
	@${RM} ${OBJECTDIR}/PortCOnChange_isr.o.ok ${OBJECTDIR}/PortCOnChange_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/PortCOnChange_isr.o.d" "${OBJECTDIR}/PortCOnChange_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/PortCOnChange_isr.o.d"  -o ${OBJECTDIR}/PortCOnChange_isr.o PortCOnChange_isr.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/PortCOnChange_isr.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/PortDOnChange_isr.o: PortDOnChange_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/PortDOnChange_isr.o.d 
	@${RM} ${OBJECTDIR}/PortDOnChange_isr.o 
	@${RM} ${OBJECTDIR}/PortDOnChange_isr.o.ok ${OBJECTDIR}/PortDOnChange_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/PortDOnChange_isr.o.d" "${OBJECTDIR}/PortDOnChange_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/PortDOnChange_isr.o.d"  -o ${OBJECTDIR}/PortDOnChange_isr.o PortDOnChange_isr.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/PortDOnChange_isr.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/PortEOnChange_isr.o: PortEOnChange_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/PortEOnChange_isr.o.d 
	@${RM} ${OBJECTDIR}/PortEOnChange_isr.o 
	@${RM} ${OBJECTDIR}/PortEOnChange_isr.o.ok ${OBJECTDIR}/PortEOnChange_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/PortEOnChange_isr.o.d" "${OBJECTDIR}/PortEOnChange_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/PortEOnChange_isr.o.d"  -o ${OBJECTDIR}/PortEOnChange_isr.o PortEOnChange_isr.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/PortEOnChange_isr.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/PortFOnChange_isr.o: PortFOnChange_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/PortFOnChange_isr.o.d 
	@${RM} ${OBJECTDIR}/PortFOnChange_isr.o 
	@${RM} ${OBJECTDIR}/PortFOnChange_isr.o.ok ${OBJECTDIR}/PortFOnChange_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/PortFOnChange_isr.o.d" "${OBJECTDIR}/PortFOnChange_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/PortFOnChange_isr.o.d"  -o ${OBJECTDIR}/PortFOnChange_isr.o PortFOnChange_isr.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/PortFOnChange_isr.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/PortGOnChange_isr.o: PortGOnChange_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/PortGOnChange_isr.o.d 
	@${RM} ${OBJECTDIR}/PortGOnChange_isr.o 
	@${RM} ${OBJECTDIR}/PortGOnChange_isr.o.ok ${OBJECTDIR}/PortGOnChange_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/PortGOnChange_isr.o.d" "${OBJECTDIR}/PortGOnChange_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/PortGOnChange_isr.o.d"  -o ${OBJECTDIR}/PortGOnChange_isr.o PortGOnChange_isr.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/PortGOnChange_isr.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1 -mdfp=${DFP_DIR}
	
else
${OBJECTDIR}/ADC2_isr.o: ADC2_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ADC2_isr.o.d 
	@${RM} ${OBJECTDIR}/ADC2_isr.o 
	@${RM} ${OBJECTDIR}/ADC2_isr.o.ok ${OBJECTDIR}/ADC2_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/ADC2_isr.o.d" "${OBJECTDIR}/ADC2_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/ADC2_isr.o.d"  -o ${OBJECTDIR}/ADC2_isr.o ADC2_isr.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/ADC2_isr.o.asm.d",--gdwarf-2 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/ADC3_isr.o: ADC3_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ADC3_isr.o.d 
	@${RM} ${OBJECTDIR}/ADC3_isr.o 
	@${RM} ${OBJECTDIR}/ADC3_isr.o.ok ${OBJECTDIR}/ADC3_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/ADC3_isr.o.d" "${OBJECTDIR}/ADC3_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/ADC3_isr.o.d"  -o ${OBJECTDIR}/ADC3_isr.o ADC3_isr.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/ADC3_isr.o.asm.d",--gdwarf-2 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/ADC1_isr.o: ADC1_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ADC1_isr.o.d 
	@${RM} ${OBJECTDIR}/ADC1_isr.o 
	@${RM} ${OBJECTDIR}/ADC1_isr.o.ok ${OBJECTDIR}/ADC1_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/ADC1_isr.o.d" "${OBJECTDIR}/ADC1_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/ADC1_isr.o.d"  -o ${OBJECTDIR}/ADC1_isr.o ADC1_isr.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/ADC1_isr.o.asm.d",--gdwarf-2 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/ADC4_isr.o: ADC4_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ADC4_isr.o.d 
	@${RM} ${OBJECTDIR}/ADC4_isr.o 
	@${RM} ${OBJECTDIR}/ADC4_isr.o.ok ${OBJECTDIR}/ADC4_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/ADC4_isr.o.d" "${OBJECTDIR}/ADC4_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/ADC4_isr.o.d"  -o ${OBJECTDIR}/ADC4_isr.o ADC4_isr.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/ADC4_isr.o.asm.d",--gdwarf-2 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/IC2_isr.o: IC2_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/IC2_isr.o.d 
	@${RM} ${OBJECTDIR}/IC2_isr.o 
	@${RM} ${OBJECTDIR}/IC2_isr.o.ok ${OBJECTDIR}/IC2_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/IC2_isr.o.d" "${OBJECTDIR}/IC2_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/IC2_isr.o.d"  -o ${OBJECTDIR}/IC2_isr.o IC2_isr.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/IC2_isr.o.asm.d",--gdwarf-2 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/IC4_isr.o: IC4_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/IC4_isr.o.d 
	@${RM} ${OBJECTDIR}/IC4_isr.o 
	@${RM} ${OBJECTDIR}/IC4_isr.o.ok ${OBJECTDIR}/IC4_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/IC4_isr.o.d" "${OBJECTDIR}/IC4_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/IC4_isr.o.d"  -o ${OBJECTDIR}/IC4_isr.o IC4_isr.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/IC4_isr.o.asm.d",--gdwarf-2 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/IC1_isr.o: IC1_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/IC1_isr.o.d 
	@${RM} ${OBJECTDIR}/IC1_isr.o 
	@${RM} ${OBJECTDIR}/IC1_isr.o.ok ${OBJECTDIR}/IC1_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/IC1_isr.o.d" "${OBJECTDIR}/IC1_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/IC1_isr.o.d"  -o ${OBJECTDIR}/IC1_isr.o IC1_isr.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/IC1_isr.o.asm.d",--gdwarf-2 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/IC3_isr.o: IC3_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/IC3_isr.o.d 
	@${RM} ${OBJECTDIR}/IC3_isr.o 
	@${RM} ${OBJECTDIR}/IC3_isr.o.ok ${OBJECTDIR}/IC3_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/IC3_isr.o.d" "${OBJECTDIR}/IC3_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/IC3_isr.o.d"  -o ${OBJECTDIR}/IC3_isr.o IC3_isr.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/IC3_isr.o.asm.d",--gdwarf-2 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Timer3_isr.o: Timer3_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Timer3_isr.o.d 
	@${RM} ${OBJECTDIR}/Timer3_isr.o 
	@${RM} ${OBJECTDIR}/Timer3_isr.o.ok ${OBJECTDIR}/Timer3_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Timer3_isr.o.d" "${OBJECTDIR}/Timer3_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Timer3_isr.o.d"  -o ${OBJECTDIR}/Timer3_isr.o Timer3_isr.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Timer3_isr.o.asm.d",--gdwarf-2 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Timer2_isr.o: Timer2_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Timer2_isr.o.d 
	@${RM} ${OBJECTDIR}/Timer2_isr.o 
	@${RM} ${OBJECTDIR}/Timer2_isr.o.ok ${OBJECTDIR}/Timer2_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Timer2_isr.o.d" "${OBJECTDIR}/Timer2_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Timer2_isr.o.d"  -o ${OBJECTDIR}/Timer2_isr.o Timer2_isr.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Timer2_isr.o.asm.d",--gdwarf-2 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Timer4_isr.o: Timer4_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Timer4_isr.o.d 
	@${RM} ${OBJECTDIR}/Timer4_isr.o 
	@${RM} ${OBJECTDIR}/Timer4_isr.o.ok ${OBJECTDIR}/Timer4_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Timer4_isr.o.d" "${OBJECTDIR}/Timer4_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Timer4_isr.o.d"  -o ${OBJECTDIR}/Timer4_isr.o Timer4_isr.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Timer4_isr.o.asm.d",--gdwarf-2 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Timer5_isr.o: Timer5_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Timer5_isr.o.d 
	@${RM} ${OBJECTDIR}/Timer5_isr.o 
	@${RM} ${OBJECTDIR}/Timer5_isr.o.ok ${OBJECTDIR}/Timer5_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Timer5_isr.o.d" "${OBJECTDIR}/Timer5_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Timer5_isr.o.d"  -o ${OBJECTDIR}/Timer5_isr.o Timer5_isr.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Timer5_isr.o.asm.d",--gdwarf-2 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/USBFreeRTOS_isr.o: USBFreeRTOS_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/USBFreeRTOS_isr.o.d 
	@${RM} ${OBJECTDIR}/USBFreeRTOS_isr.o 
	@${RM} ${OBJECTDIR}/USBFreeRTOS_isr.o.ok ${OBJECTDIR}/USBFreeRTOS_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/USBFreeRTOS_isr.o.d" "${OBJECTDIR}/USBFreeRTOS_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/USBFreeRTOS_isr.o.d"  -o ${OBJECTDIR}/USBFreeRTOS_isr.o USBFreeRTOS_isr.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/USBFreeRTOS_isr.o.asm.d",--gdwarf-2 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o: Source/portable/MPLAB/PIC32MZ/port_asm.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ" 
	@${RM} ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o.d 
	@${RM} ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o 
	@${RM} ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o.ok ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o.d" "${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o.d"  -o ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o Source/portable/MPLAB/PIC32MZ/port_asm.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o.asm.d",--gdwarf-2 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/PortAOnChange_isr.o: PortAOnChange_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/PortAOnChange_isr.o.d 
	@${RM} ${OBJECTDIR}/PortAOnChange_isr.o 
	@${RM} ${OBJECTDIR}/PortAOnChange_isr.o.ok ${OBJECTDIR}/PortAOnChange_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/PortAOnChange_isr.o.d" "${OBJECTDIR}/PortAOnChange_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/PortAOnChange_isr.o.d"  -o ${OBJECTDIR}/PortAOnChange_isr.o PortAOnChange_isr.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/PortAOnChange_isr.o.asm.d",--gdwarf-2 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/PortBOnChange_isr.o: PortBOnChange_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/PortBOnChange_isr.o.d 
	@${RM} ${OBJECTDIR}/PortBOnChange_isr.o 
	@${RM} ${OBJECTDIR}/PortBOnChange_isr.o.ok ${OBJECTDIR}/PortBOnChange_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/PortBOnChange_isr.o.d" "${OBJECTDIR}/PortBOnChange_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/PortBOnChange_isr.o.d"  -o ${OBJECTDIR}/PortBOnChange_isr.o PortBOnChange_isr.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/PortBOnChange_isr.o.asm.d",--gdwarf-2 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/PortCOnChange_isr.o: PortCOnChange_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/PortCOnChange_isr.o.d 
	@${RM} ${OBJECTDIR}/PortCOnChange_isr.o 
	@${RM} ${OBJECTDIR}/PortCOnChange_isr.o.ok ${OBJECTDIR}/PortCOnChange_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/PortCOnChange_isr.o.d" "${OBJECTDIR}/PortCOnChange_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/PortCOnChange_isr.o.d"  -o ${OBJECTDIR}/PortCOnChange_isr.o PortCOnChange_isr.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/PortCOnChange_isr.o.asm.d",--gdwarf-2 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/PortDOnChange_isr.o: PortDOnChange_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/PortDOnChange_isr.o.d 
	@${RM} ${OBJECTDIR}/PortDOnChange_isr.o 
	@${RM} ${OBJECTDIR}/PortDOnChange_isr.o.ok ${OBJECTDIR}/PortDOnChange_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/PortDOnChange_isr.o.d" "${OBJECTDIR}/PortDOnChange_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/PortDOnChange_isr.o.d"  -o ${OBJECTDIR}/PortDOnChange_isr.o PortDOnChange_isr.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/PortDOnChange_isr.o.asm.d",--gdwarf-2 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/PortEOnChange_isr.o: PortEOnChange_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/PortEOnChange_isr.o.d 
	@${RM} ${OBJECTDIR}/PortEOnChange_isr.o 
	@${RM} ${OBJECTDIR}/PortEOnChange_isr.o.ok ${OBJECTDIR}/PortEOnChange_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/PortEOnChange_isr.o.d" "${OBJECTDIR}/PortEOnChange_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/PortEOnChange_isr.o.d"  -o ${OBJECTDIR}/PortEOnChange_isr.o PortEOnChange_isr.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/PortEOnChange_isr.o.asm.d",--gdwarf-2 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/PortFOnChange_isr.o: PortFOnChange_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/PortFOnChange_isr.o.d 
	@${RM} ${OBJECTDIR}/PortFOnChange_isr.o 
	@${RM} ${OBJECTDIR}/PortFOnChange_isr.o.ok ${OBJECTDIR}/PortFOnChange_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/PortFOnChange_isr.o.d" "${OBJECTDIR}/PortFOnChange_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/PortFOnChange_isr.o.d"  -o ${OBJECTDIR}/PortFOnChange_isr.o PortFOnChange_isr.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/PortFOnChange_isr.o.asm.d",--gdwarf-2 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/PortGOnChange_isr.o: PortGOnChange_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/PortGOnChange_isr.o.d 
	@${RM} ${OBJECTDIR}/PortGOnChange_isr.o 
	@${RM} ${OBJECTDIR}/PortGOnChange_isr.o.ok ${OBJECTDIR}/PortGOnChange_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/PortGOnChange_isr.o.d" "${OBJECTDIR}/PortGOnChange_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/PortGOnChange_isr.o.d"  -o ${OBJECTDIR}/PortGOnChange_isr.o PortGOnChange_isr.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/PortGOnChange_isr.o.asm.d",--gdwarf-2 -mdfp=${DFP_DIR}
	
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
	
${OBJECTDIR}/ADCFreeRTOS.o: ADCFreeRTOS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ADCFreeRTOS.o.d 
	@${RM} ${OBJECTDIR}/ADCFreeRTOS.o 
	@${FIXDEPS} "${OBJECTDIR}/ADCFreeRTOS.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/ADCFreeRTOS.o.d" -o ${OBJECTDIR}/ADCFreeRTOS.o ADCFreeRTOS.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/HC-SR04.o: HC-SR04.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/HC-SR04.o.d 
	@${RM} ${OBJECTDIR}/HC-SR04.o 
	@${FIXDEPS} "${OBJECTDIR}/HC-SR04.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/HC-SR04.o.d" -o ${OBJECTDIR}/HC-SR04.o HC-SR04.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/HX711.o: HX711.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/HX711.o.d 
	@${RM} ${OBJECTDIR}/HX711.o 
	@${FIXDEPS} "${OBJECTDIR}/HX711.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/HX711.o.d" -o ${OBJECTDIR}/HX711.o HX711.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/I2C.o: I2C.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/I2C.o.d 
	@${RM} ${OBJECTDIR}/I2C.o 
	@${FIXDEPS} "${OBJECTDIR}/I2C.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/I2C.o.d" -o ${OBJECTDIR}/I2C.o I2C.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/INA219.o: INA219.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/INA219.o.d 
	@${RM} ${OBJECTDIR}/INA219.o 
	@${FIXDEPS} "${OBJECTDIR}/INA219.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/INA219.o.d" -o ${OBJECTDIR}/INA219.o INA219.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/InputCapture.o: InputCapture.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/InputCapture.o.d 
	@${RM} ${OBJECTDIR}/InputCapture.o 
	@${FIXDEPS} "${OBJECTDIR}/InputCapture.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/InputCapture.o.d" -o ${OBJECTDIR}/InputCapture.o InputCapture.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/IOPorts.o: IOPorts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/IOPorts.o.d 
	@${RM} ${OBJECTDIR}/IOPorts.o 
	@${FIXDEPS} "${OBJECTDIR}/IOPorts.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/IOPorts.o.d" -o ${OBJECTDIR}/IOPorts.o IOPorts.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/LEDInterface.o: LEDInterface.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/LEDInterface.o.d 
	@${RM} ${OBJECTDIR}/LEDInterface.o 
	@${FIXDEPS} "${OBJECTDIR}/LEDInterface.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/LEDInterface.o.d" -o ${OBJECTDIR}/LEDInterface.o LEDInterface.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/PWMFreeRTOS.o: PWMFreeRTOS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/PWMFreeRTOS.o.d 
	@${RM} ${OBJECTDIR}/PWMFreeRTOS.o 
	@${FIXDEPS} "${OBJECTDIR}/PWMFreeRTOS.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/PWMFreeRTOS.o.d" -o ${OBJECTDIR}/PWMFreeRTOS.o PWMFreeRTOS.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Timer.o: Timer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Timer.o.d 
	@${RM} ${OBJECTDIR}/Timer.o 
	@${FIXDEPS} "${OBJECTDIR}/Timer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Timer.o.d" -o ${OBJECTDIR}/Timer.o Timer.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/USBFreeRTOS.o: USBFreeRTOS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/USBFreeRTOS.o.d 
	@${RM} ${OBJECTDIR}/USBFreeRTOS.o 
	@${FIXDEPS} "${OBJECTDIR}/USBFreeRTOS.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/USBFreeRTOS.o.d" -o ${OBJECTDIR}/USBFreeRTOS.o USBFreeRTOS.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
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
	
${OBJECTDIR}/ADCFreeRTOS.o: ADCFreeRTOS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ADCFreeRTOS.o.d 
	@${RM} ${OBJECTDIR}/ADCFreeRTOS.o 
	@${FIXDEPS} "${OBJECTDIR}/ADCFreeRTOS.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/ADCFreeRTOS.o.d" -o ${OBJECTDIR}/ADCFreeRTOS.o ADCFreeRTOS.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/HC-SR04.o: HC-SR04.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/HC-SR04.o.d 
	@${RM} ${OBJECTDIR}/HC-SR04.o 
	@${FIXDEPS} "${OBJECTDIR}/HC-SR04.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/HC-SR04.o.d" -o ${OBJECTDIR}/HC-SR04.o HC-SR04.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/HX711.o: HX711.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/HX711.o.d 
	@${RM} ${OBJECTDIR}/HX711.o 
	@${FIXDEPS} "${OBJECTDIR}/HX711.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/HX711.o.d" -o ${OBJECTDIR}/HX711.o HX711.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/I2C.o: I2C.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/I2C.o.d 
	@${RM} ${OBJECTDIR}/I2C.o 
	@${FIXDEPS} "${OBJECTDIR}/I2C.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/I2C.o.d" -o ${OBJECTDIR}/I2C.o I2C.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/INA219.o: INA219.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/INA219.o.d 
	@${RM} ${OBJECTDIR}/INA219.o 
	@${FIXDEPS} "${OBJECTDIR}/INA219.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/INA219.o.d" -o ${OBJECTDIR}/INA219.o INA219.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/InputCapture.o: InputCapture.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/InputCapture.o.d 
	@${RM} ${OBJECTDIR}/InputCapture.o 
	@${FIXDEPS} "${OBJECTDIR}/InputCapture.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/InputCapture.o.d" -o ${OBJECTDIR}/InputCapture.o InputCapture.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/IOPorts.o: IOPorts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/IOPorts.o.d 
	@${RM} ${OBJECTDIR}/IOPorts.o 
	@${FIXDEPS} "${OBJECTDIR}/IOPorts.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/IOPorts.o.d" -o ${OBJECTDIR}/IOPorts.o IOPorts.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/LEDInterface.o: LEDInterface.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/LEDInterface.o.d 
	@${RM} ${OBJECTDIR}/LEDInterface.o 
	@${FIXDEPS} "${OBJECTDIR}/LEDInterface.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/LEDInterface.o.d" -o ${OBJECTDIR}/LEDInterface.o LEDInterface.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/PWMFreeRTOS.o: PWMFreeRTOS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/PWMFreeRTOS.o.d 
	@${RM} ${OBJECTDIR}/PWMFreeRTOS.o 
	@${FIXDEPS} "${OBJECTDIR}/PWMFreeRTOS.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/PWMFreeRTOS.o.d" -o ${OBJECTDIR}/PWMFreeRTOS.o PWMFreeRTOS.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Timer.o: Timer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Timer.o.d 
	@${RM} ${OBJECTDIR}/Timer.o 
	@${FIXDEPS} "${OBJECTDIR}/Timer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Timer.o.d" -o ${OBJECTDIR}/Timer.o Timer.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/USBFreeRTOS.o: USBFreeRTOS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/USBFreeRTOS.o.d 
	@${RM} ${OBJECTDIR}/USBFreeRTOS.o 
	@${FIXDEPS} "${OBJECTDIR}/USBFreeRTOS.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/USBFreeRTOS.o.d" -o ${OBJECTDIR}/USBFreeRTOS.o USBFreeRTOS.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
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
