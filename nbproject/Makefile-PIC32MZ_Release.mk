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
SOURCEFILES_QUOTED_IF_SPACED=Source/portable/MemMang/heap_4.c Source/portable/MPLAB/PIC32MZ/port.c Source/portable/MPLAB/PIC32MZ/port_asm.S Source/croutine.c Source/event_groups.c Source/list.c Source/queue.c Source/stream_buffer.c Source/tasks.c Source/timers.c Application/main.c Application/Services/SystemHooks.c Application/Tasks/USBPacketManager.c Framework/ADC/ADC.c Framework/HC-SR04/HC-SR04.c Framework/HX711/HX711.c Framework/I2C/I2C.c Framework/INA219/INA219.c "Framework/Input Capture/InputCapture.c" "Framework/IO Ports/IOPorts.c" "Framework/LED Interface/LEDInterface.c" Framework/PWM/PWM.c Framework/Timer/Timer.c Framework/USB/USB.c "Framework/Input Capture/IC1_isr.S" "Framework/Input Capture/IC2_isr.S" "Framework/Input Capture/IC3_isr.S" "Framework/Input Capture/IC4_isr.S" "Framework/IO Ports/PortAOnChange_isr.S" "Framework/IO Ports/PortBOnChange_isr.S" "Framework/IO Ports/PortCOnChange_isr.S" "Framework/IO Ports/PortDOnChange_isr.S" "Framework/IO Ports/PortEOnChange_isr.S" "Framework/IO Ports/PortFOnChange_isr.S" "Framework/IO Ports/PortGOnChange_isr.S" Framework/Timer/Timer2_isr.S Framework/Timer/Timer3_isr.S Framework/Timer/Timer4_isr.S Framework/Timer/Timer5_isr.S Framework/USB/USB_isr.S

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/Source/portable/MemMang/heap_4.o ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port.o ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o ${OBJECTDIR}/Source/croutine.o ${OBJECTDIR}/Source/event_groups.o ${OBJECTDIR}/Source/list.o ${OBJECTDIR}/Source/queue.o ${OBJECTDIR}/Source/stream_buffer.o ${OBJECTDIR}/Source/tasks.o ${OBJECTDIR}/Source/timers.o ${OBJECTDIR}/Application/main.o ${OBJECTDIR}/Application/Services/SystemHooks.o ${OBJECTDIR}/Application/Tasks/USBPacketManager.o ${OBJECTDIR}/Framework/ADC/ADC.o ${OBJECTDIR}/Framework/HC-SR04/HC-SR04.o ${OBJECTDIR}/Framework/HX711/HX711.o ${OBJECTDIR}/Framework/I2C/I2C.o ${OBJECTDIR}/Framework/INA219/INA219.o "${OBJECTDIR}/Framework/Input Capture/InputCapture.o" "${OBJECTDIR}/Framework/IO Ports/IOPorts.o" "${OBJECTDIR}/Framework/LED Interface/LEDInterface.o" ${OBJECTDIR}/Framework/PWM/PWM.o ${OBJECTDIR}/Framework/Timer/Timer.o ${OBJECTDIR}/Framework/USB/USB.o "${OBJECTDIR}/Framework/Input Capture/IC1_isr.o" "${OBJECTDIR}/Framework/Input Capture/IC2_isr.o" "${OBJECTDIR}/Framework/Input Capture/IC3_isr.o" "${OBJECTDIR}/Framework/Input Capture/IC4_isr.o" "${OBJECTDIR}/Framework/IO Ports/PortAOnChange_isr.o" "${OBJECTDIR}/Framework/IO Ports/PortBOnChange_isr.o" "${OBJECTDIR}/Framework/IO Ports/PortCOnChange_isr.o" "${OBJECTDIR}/Framework/IO Ports/PortDOnChange_isr.o" "${OBJECTDIR}/Framework/IO Ports/PortEOnChange_isr.o" "${OBJECTDIR}/Framework/IO Ports/PortFOnChange_isr.o" "${OBJECTDIR}/Framework/IO Ports/PortGOnChange_isr.o" ${OBJECTDIR}/Framework/Timer/Timer2_isr.o ${OBJECTDIR}/Framework/Timer/Timer3_isr.o ${OBJECTDIR}/Framework/Timer/Timer4_isr.o ${OBJECTDIR}/Framework/Timer/Timer5_isr.o ${OBJECTDIR}/Framework/USB/USB_isr.o
POSSIBLE_DEPFILES=${OBJECTDIR}/Source/portable/MemMang/heap_4.o.d ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port.o.d ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o.d ${OBJECTDIR}/Source/croutine.o.d ${OBJECTDIR}/Source/event_groups.o.d ${OBJECTDIR}/Source/list.o.d ${OBJECTDIR}/Source/queue.o.d ${OBJECTDIR}/Source/stream_buffer.o.d ${OBJECTDIR}/Source/tasks.o.d ${OBJECTDIR}/Source/timers.o.d ${OBJECTDIR}/Application/main.o.d ${OBJECTDIR}/Application/Services/SystemHooks.o.d ${OBJECTDIR}/Application/Tasks/USBPacketManager.o.d ${OBJECTDIR}/Framework/ADC/ADC.o.d ${OBJECTDIR}/Framework/HC-SR04/HC-SR04.o.d ${OBJECTDIR}/Framework/HX711/HX711.o.d ${OBJECTDIR}/Framework/I2C/I2C.o.d ${OBJECTDIR}/Framework/INA219/INA219.o.d "${OBJECTDIR}/Framework/Input Capture/InputCapture.o.d" "${OBJECTDIR}/Framework/IO Ports/IOPorts.o.d" "${OBJECTDIR}/Framework/LED Interface/LEDInterface.o.d" ${OBJECTDIR}/Framework/PWM/PWM.o.d ${OBJECTDIR}/Framework/Timer/Timer.o.d ${OBJECTDIR}/Framework/USB/USB.o.d "${OBJECTDIR}/Framework/Input Capture/IC1_isr.o.d" "${OBJECTDIR}/Framework/Input Capture/IC2_isr.o.d" "${OBJECTDIR}/Framework/Input Capture/IC3_isr.o.d" "${OBJECTDIR}/Framework/Input Capture/IC4_isr.o.d" "${OBJECTDIR}/Framework/IO Ports/PortAOnChange_isr.o.d" "${OBJECTDIR}/Framework/IO Ports/PortBOnChange_isr.o.d" "${OBJECTDIR}/Framework/IO Ports/PortCOnChange_isr.o.d" "${OBJECTDIR}/Framework/IO Ports/PortDOnChange_isr.o.d" "${OBJECTDIR}/Framework/IO Ports/PortEOnChange_isr.o.d" "${OBJECTDIR}/Framework/IO Ports/PortFOnChange_isr.o.d" "${OBJECTDIR}/Framework/IO Ports/PortGOnChange_isr.o.d" ${OBJECTDIR}/Framework/Timer/Timer2_isr.o.d ${OBJECTDIR}/Framework/Timer/Timer3_isr.o.d ${OBJECTDIR}/Framework/Timer/Timer4_isr.o.d ${OBJECTDIR}/Framework/Timer/Timer5_isr.o.d ${OBJECTDIR}/Framework/USB/USB_isr.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/Source/portable/MemMang/heap_4.o ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port.o ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o ${OBJECTDIR}/Source/croutine.o ${OBJECTDIR}/Source/event_groups.o ${OBJECTDIR}/Source/list.o ${OBJECTDIR}/Source/queue.o ${OBJECTDIR}/Source/stream_buffer.o ${OBJECTDIR}/Source/tasks.o ${OBJECTDIR}/Source/timers.o ${OBJECTDIR}/Application/main.o ${OBJECTDIR}/Application/Services/SystemHooks.o ${OBJECTDIR}/Application/Tasks/USBPacketManager.o ${OBJECTDIR}/Framework/ADC/ADC.o ${OBJECTDIR}/Framework/HC-SR04/HC-SR04.o ${OBJECTDIR}/Framework/HX711/HX711.o ${OBJECTDIR}/Framework/I2C/I2C.o ${OBJECTDIR}/Framework/INA219/INA219.o ${OBJECTDIR}/Framework/Input\ Capture/InputCapture.o ${OBJECTDIR}/Framework/IO\ Ports/IOPorts.o ${OBJECTDIR}/Framework/LED\ Interface/LEDInterface.o ${OBJECTDIR}/Framework/PWM/PWM.o ${OBJECTDIR}/Framework/Timer/Timer.o ${OBJECTDIR}/Framework/USB/USB.o ${OBJECTDIR}/Framework/Input\ Capture/IC1_isr.o ${OBJECTDIR}/Framework/Input\ Capture/IC2_isr.o ${OBJECTDIR}/Framework/Input\ Capture/IC3_isr.o ${OBJECTDIR}/Framework/Input\ Capture/IC4_isr.o ${OBJECTDIR}/Framework/IO\ Ports/PortAOnChange_isr.o ${OBJECTDIR}/Framework/IO\ Ports/PortBOnChange_isr.o ${OBJECTDIR}/Framework/IO\ Ports/PortCOnChange_isr.o ${OBJECTDIR}/Framework/IO\ Ports/PortDOnChange_isr.o ${OBJECTDIR}/Framework/IO\ Ports/PortEOnChange_isr.o ${OBJECTDIR}/Framework/IO\ Ports/PortFOnChange_isr.o ${OBJECTDIR}/Framework/IO\ Ports/PortGOnChange_isr.o ${OBJECTDIR}/Framework/Timer/Timer2_isr.o ${OBJECTDIR}/Framework/Timer/Timer3_isr.o ${OBJECTDIR}/Framework/Timer/Timer4_isr.o ${OBJECTDIR}/Framework/Timer/Timer5_isr.o ${OBJECTDIR}/Framework/USB/USB_isr.o

# Source Files
SOURCEFILES=Source/portable/MemMang/heap_4.c Source/portable/MPLAB/PIC32MZ/port.c Source/portable/MPLAB/PIC32MZ/port_asm.S Source/croutine.c Source/event_groups.c Source/list.c Source/queue.c Source/stream_buffer.c Source/tasks.c Source/timers.c Application/main.c Application/Services/SystemHooks.c Application/Tasks/USBPacketManager.c Framework/ADC/ADC.c Framework/HC-SR04/HC-SR04.c Framework/HX711/HX711.c Framework/I2C/I2C.c Framework/INA219/INA219.c Framework/Input Capture/InputCapture.c Framework/IO Ports/IOPorts.c Framework/LED Interface/LEDInterface.c Framework/PWM/PWM.c Framework/Timer/Timer.c Framework/USB/USB.c Framework/Input Capture/IC1_isr.S Framework/Input Capture/IC2_isr.S Framework/Input Capture/IC3_isr.S Framework/Input Capture/IC4_isr.S Framework/IO Ports/PortAOnChange_isr.S Framework/IO Ports/PortBOnChange_isr.S Framework/IO Ports/PortCOnChange_isr.S Framework/IO Ports/PortDOnChange_isr.S Framework/IO Ports/PortEOnChange_isr.S Framework/IO Ports/PortFOnChange_isr.S Framework/IO Ports/PortGOnChange_isr.S Framework/Timer/Timer2_isr.S Framework/Timer/Timer3_isr.S Framework/Timer/Timer4_isr.S Framework/Timer/Timer5_isr.S Framework/USB/USB_isr.S



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
${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o: Source/portable/MPLAB/PIC32MZ/port_asm.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ" 
	@${RM} ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o.d 
	@${RM} ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o 
	@${RM} ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o.ok ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o.d" "${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o.d"  -o ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o Source/portable/MPLAB/PIC32MZ/port_asm.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Framework/Input\ Capture/IC1_isr.o: Framework/Input\ Capture/IC1_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Framework/Input Capture" 
	@${RM} "${OBJECTDIR}/Framework/Input Capture/IC1_isr.o".d 
	@${RM} "${OBJECTDIR}/Framework/Input Capture/IC1_isr.o" 
	@${RM} "${OBJECTDIR}/Framework/Input Capture/IC1_isr.o".ok ${OBJECTDIR}/Framework/Input\ Capture/IC1_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Framework/Input Capture/IC1_isr.o.d" "${OBJECTDIR}/Framework/Input Capture/IC1_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Framework/Input Capture/IC1_isr.o.d"  -o "${OBJECTDIR}/Framework/Input Capture/IC1_isr.o" "Framework/Input Capture/IC1_isr.S"  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Framework/Input Capture/IC1_isr.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Framework/Input\ Capture/IC2_isr.o: Framework/Input\ Capture/IC2_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Framework/Input Capture" 
	@${RM} "${OBJECTDIR}/Framework/Input Capture/IC2_isr.o".d 
	@${RM} "${OBJECTDIR}/Framework/Input Capture/IC2_isr.o" 
	@${RM} "${OBJECTDIR}/Framework/Input Capture/IC2_isr.o".ok ${OBJECTDIR}/Framework/Input\ Capture/IC2_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Framework/Input Capture/IC2_isr.o.d" "${OBJECTDIR}/Framework/Input Capture/IC2_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Framework/Input Capture/IC2_isr.o.d"  -o "${OBJECTDIR}/Framework/Input Capture/IC2_isr.o" "Framework/Input Capture/IC2_isr.S"  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Framework/Input Capture/IC2_isr.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Framework/Input\ Capture/IC3_isr.o: Framework/Input\ Capture/IC3_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Framework/Input Capture" 
	@${RM} "${OBJECTDIR}/Framework/Input Capture/IC3_isr.o".d 
	@${RM} "${OBJECTDIR}/Framework/Input Capture/IC3_isr.o" 
	@${RM} "${OBJECTDIR}/Framework/Input Capture/IC3_isr.o".ok ${OBJECTDIR}/Framework/Input\ Capture/IC3_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Framework/Input Capture/IC3_isr.o.d" "${OBJECTDIR}/Framework/Input Capture/IC3_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Framework/Input Capture/IC3_isr.o.d"  -o "${OBJECTDIR}/Framework/Input Capture/IC3_isr.o" "Framework/Input Capture/IC3_isr.S"  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Framework/Input Capture/IC3_isr.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Framework/Input\ Capture/IC4_isr.o: Framework/Input\ Capture/IC4_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Framework/Input Capture" 
	@${RM} "${OBJECTDIR}/Framework/Input Capture/IC4_isr.o".d 
	@${RM} "${OBJECTDIR}/Framework/Input Capture/IC4_isr.o" 
	@${RM} "${OBJECTDIR}/Framework/Input Capture/IC4_isr.o".ok ${OBJECTDIR}/Framework/Input\ Capture/IC4_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Framework/Input Capture/IC4_isr.o.d" "${OBJECTDIR}/Framework/Input Capture/IC4_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Framework/Input Capture/IC4_isr.o.d"  -o "${OBJECTDIR}/Framework/Input Capture/IC4_isr.o" "Framework/Input Capture/IC4_isr.S"  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Framework/Input Capture/IC4_isr.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Framework/IO\ Ports/PortAOnChange_isr.o: Framework/IO\ Ports/PortAOnChange_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Framework/IO Ports" 
	@${RM} "${OBJECTDIR}/Framework/IO Ports/PortAOnChange_isr.o".d 
	@${RM} "${OBJECTDIR}/Framework/IO Ports/PortAOnChange_isr.o" 
	@${RM} "${OBJECTDIR}/Framework/IO Ports/PortAOnChange_isr.o".ok ${OBJECTDIR}/Framework/IO\ Ports/PortAOnChange_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Framework/IO Ports/PortAOnChange_isr.o.d" "${OBJECTDIR}/Framework/IO Ports/PortAOnChange_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Framework/IO Ports/PortAOnChange_isr.o.d"  -o "${OBJECTDIR}/Framework/IO Ports/PortAOnChange_isr.o" "Framework/IO Ports/PortAOnChange_isr.S"  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Framework/IO Ports/PortAOnChange_isr.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Framework/IO\ Ports/PortBOnChange_isr.o: Framework/IO\ Ports/PortBOnChange_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Framework/IO Ports" 
	@${RM} "${OBJECTDIR}/Framework/IO Ports/PortBOnChange_isr.o".d 
	@${RM} "${OBJECTDIR}/Framework/IO Ports/PortBOnChange_isr.o" 
	@${RM} "${OBJECTDIR}/Framework/IO Ports/PortBOnChange_isr.o".ok ${OBJECTDIR}/Framework/IO\ Ports/PortBOnChange_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Framework/IO Ports/PortBOnChange_isr.o.d" "${OBJECTDIR}/Framework/IO Ports/PortBOnChange_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Framework/IO Ports/PortBOnChange_isr.o.d"  -o "${OBJECTDIR}/Framework/IO Ports/PortBOnChange_isr.o" "Framework/IO Ports/PortBOnChange_isr.S"  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Framework/IO Ports/PortBOnChange_isr.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Framework/IO\ Ports/PortCOnChange_isr.o: Framework/IO\ Ports/PortCOnChange_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Framework/IO Ports" 
	@${RM} "${OBJECTDIR}/Framework/IO Ports/PortCOnChange_isr.o".d 
	@${RM} "${OBJECTDIR}/Framework/IO Ports/PortCOnChange_isr.o" 
	@${RM} "${OBJECTDIR}/Framework/IO Ports/PortCOnChange_isr.o".ok ${OBJECTDIR}/Framework/IO\ Ports/PortCOnChange_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Framework/IO Ports/PortCOnChange_isr.o.d" "${OBJECTDIR}/Framework/IO Ports/PortCOnChange_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Framework/IO Ports/PortCOnChange_isr.o.d"  -o "${OBJECTDIR}/Framework/IO Ports/PortCOnChange_isr.o" "Framework/IO Ports/PortCOnChange_isr.S"  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Framework/IO Ports/PortCOnChange_isr.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Framework/IO\ Ports/PortDOnChange_isr.o: Framework/IO\ Ports/PortDOnChange_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Framework/IO Ports" 
	@${RM} "${OBJECTDIR}/Framework/IO Ports/PortDOnChange_isr.o".d 
	@${RM} "${OBJECTDIR}/Framework/IO Ports/PortDOnChange_isr.o" 
	@${RM} "${OBJECTDIR}/Framework/IO Ports/PortDOnChange_isr.o".ok ${OBJECTDIR}/Framework/IO\ Ports/PortDOnChange_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Framework/IO Ports/PortDOnChange_isr.o.d" "${OBJECTDIR}/Framework/IO Ports/PortDOnChange_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Framework/IO Ports/PortDOnChange_isr.o.d"  -o "${OBJECTDIR}/Framework/IO Ports/PortDOnChange_isr.o" "Framework/IO Ports/PortDOnChange_isr.S"  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Framework/IO Ports/PortDOnChange_isr.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Framework/IO\ Ports/PortEOnChange_isr.o: Framework/IO\ Ports/PortEOnChange_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Framework/IO Ports" 
	@${RM} "${OBJECTDIR}/Framework/IO Ports/PortEOnChange_isr.o".d 
	@${RM} "${OBJECTDIR}/Framework/IO Ports/PortEOnChange_isr.o" 
	@${RM} "${OBJECTDIR}/Framework/IO Ports/PortEOnChange_isr.o".ok ${OBJECTDIR}/Framework/IO\ Ports/PortEOnChange_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Framework/IO Ports/PortEOnChange_isr.o.d" "${OBJECTDIR}/Framework/IO Ports/PortEOnChange_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Framework/IO Ports/PortEOnChange_isr.o.d"  -o "${OBJECTDIR}/Framework/IO Ports/PortEOnChange_isr.o" "Framework/IO Ports/PortEOnChange_isr.S"  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Framework/IO Ports/PortEOnChange_isr.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Framework/IO\ Ports/PortFOnChange_isr.o: Framework/IO\ Ports/PortFOnChange_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Framework/IO Ports" 
	@${RM} "${OBJECTDIR}/Framework/IO Ports/PortFOnChange_isr.o".d 
	@${RM} "${OBJECTDIR}/Framework/IO Ports/PortFOnChange_isr.o" 
	@${RM} "${OBJECTDIR}/Framework/IO Ports/PortFOnChange_isr.o".ok ${OBJECTDIR}/Framework/IO\ Ports/PortFOnChange_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Framework/IO Ports/PortFOnChange_isr.o.d" "${OBJECTDIR}/Framework/IO Ports/PortFOnChange_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Framework/IO Ports/PortFOnChange_isr.o.d"  -o "${OBJECTDIR}/Framework/IO Ports/PortFOnChange_isr.o" "Framework/IO Ports/PortFOnChange_isr.S"  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Framework/IO Ports/PortFOnChange_isr.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Framework/IO\ Ports/PortGOnChange_isr.o: Framework/IO\ Ports/PortGOnChange_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Framework/IO Ports" 
	@${RM} "${OBJECTDIR}/Framework/IO Ports/PortGOnChange_isr.o".d 
	@${RM} "${OBJECTDIR}/Framework/IO Ports/PortGOnChange_isr.o" 
	@${RM} "${OBJECTDIR}/Framework/IO Ports/PortGOnChange_isr.o".ok ${OBJECTDIR}/Framework/IO\ Ports/PortGOnChange_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Framework/IO Ports/PortGOnChange_isr.o.d" "${OBJECTDIR}/Framework/IO Ports/PortGOnChange_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Framework/IO Ports/PortGOnChange_isr.o.d"  -o "${OBJECTDIR}/Framework/IO Ports/PortGOnChange_isr.o" "Framework/IO Ports/PortGOnChange_isr.S"  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Framework/IO Ports/PortGOnChange_isr.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Framework/Timer/Timer2_isr.o: Framework/Timer/Timer2_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Framework/Timer" 
	@${RM} ${OBJECTDIR}/Framework/Timer/Timer2_isr.o.d 
	@${RM} ${OBJECTDIR}/Framework/Timer/Timer2_isr.o 
	@${RM} ${OBJECTDIR}/Framework/Timer/Timer2_isr.o.ok ${OBJECTDIR}/Framework/Timer/Timer2_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Framework/Timer/Timer2_isr.o.d" "${OBJECTDIR}/Framework/Timer/Timer2_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Framework/Timer/Timer2_isr.o.d"  -o ${OBJECTDIR}/Framework/Timer/Timer2_isr.o Framework/Timer/Timer2_isr.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Framework/Timer/Timer2_isr.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Framework/Timer/Timer3_isr.o: Framework/Timer/Timer3_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Framework/Timer" 
	@${RM} ${OBJECTDIR}/Framework/Timer/Timer3_isr.o.d 
	@${RM} ${OBJECTDIR}/Framework/Timer/Timer3_isr.o 
	@${RM} ${OBJECTDIR}/Framework/Timer/Timer3_isr.o.ok ${OBJECTDIR}/Framework/Timer/Timer3_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Framework/Timer/Timer3_isr.o.d" "${OBJECTDIR}/Framework/Timer/Timer3_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Framework/Timer/Timer3_isr.o.d"  -o ${OBJECTDIR}/Framework/Timer/Timer3_isr.o Framework/Timer/Timer3_isr.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Framework/Timer/Timer3_isr.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Framework/Timer/Timer4_isr.o: Framework/Timer/Timer4_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Framework/Timer" 
	@${RM} ${OBJECTDIR}/Framework/Timer/Timer4_isr.o.d 
	@${RM} ${OBJECTDIR}/Framework/Timer/Timer4_isr.o 
	@${RM} ${OBJECTDIR}/Framework/Timer/Timer4_isr.o.ok ${OBJECTDIR}/Framework/Timer/Timer4_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Framework/Timer/Timer4_isr.o.d" "${OBJECTDIR}/Framework/Timer/Timer4_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Framework/Timer/Timer4_isr.o.d"  -o ${OBJECTDIR}/Framework/Timer/Timer4_isr.o Framework/Timer/Timer4_isr.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Framework/Timer/Timer4_isr.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Framework/Timer/Timer5_isr.o: Framework/Timer/Timer5_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Framework/Timer" 
	@${RM} ${OBJECTDIR}/Framework/Timer/Timer5_isr.o.d 
	@${RM} ${OBJECTDIR}/Framework/Timer/Timer5_isr.o 
	@${RM} ${OBJECTDIR}/Framework/Timer/Timer5_isr.o.ok ${OBJECTDIR}/Framework/Timer/Timer5_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Framework/Timer/Timer5_isr.o.d" "${OBJECTDIR}/Framework/Timer/Timer5_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Framework/Timer/Timer5_isr.o.d"  -o ${OBJECTDIR}/Framework/Timer/Timer5_isr.o Framework/Timer/Timer5_isr.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Framework/Timer/Timer5_isr.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Framework/USB/USB_isr.o: Framework/USB/USB_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Framework/USB" 
	@${RM} ${OBJECTDIR}/Framework/USB/USB_isr.o.d 
	@${RM} ${OBJECTDIR}/Framework/USB/USB_isr.o 
	@${RM} ${OBJECTDIR}/Framework/USB/USB_isr.o.ok ${OBJECTDIR}/Framework/USB/USB_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Framework/USB/USB_isr.o.d" "${OBJECTDIR}/Framework/USB/USB_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Framework/USB/USB_isr.o.d"  -o ${OBJECTDIR}/Framework/USB/USB_isr.o Framework/USB/USB_isr.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Framework/USB/USB_isr.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1 -mdfp=${DFP_DIR}
	
else
${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o: Source/portable/MPLAB/PIC32MZ/port_asm.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ" 
	@${RM} ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o.d 
	@${RM} ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o 
	@${RM} ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o.ok ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o.d" "${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o.d"  -o ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o Source/portable/MPLAB/PIC32MZ/port_asm.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port_asm.o.asm.d",--gdwarf-2 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Framework/Input\ Capture/IC1_isr.o: Framework/Input\ Capture/IC1_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Framework/Input Capture" 
	@${RM} "${OBJECTDIR}/Framework/Input Capture/IC1_isr.o".d 
	@${RM} "${OBJECTDIR}/Framework/Input Capture/IC1_isr.o" 
	@${RM} "${OBJECTDIR}/Framework/Input Capture/IC1_isr.o".ok ${OBJECTDIR}/Framework/Input\ Capture/IC1_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Framework/Input Capture/IC1_isr.o.d" "${OBJECTDIR}/Framework/Input Capture/IC1_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Framework/Input Capture/IC1_isr.o.d"  -o "${OBJECTDIR}/Framework/Input Capture/IC1_isr.o" "Framework/Input Capture/IC1_isr.S"  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Framework/Input Capture/IC1_isr.o.asm.d",--gdwarf-2 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Framework/Input\ Capture/IC2_isr.o: Framework/Input\ Capture/IC2_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Framework/Input Capture" 
	@${RM} "${OBJECTDIR}/Framework/Input Capture/IC2_isr.o".d 
	@${RM} "${OBJECTDIR}/Framework/Input Capture/IC2_isr.o" 
	@${RM} "${OBJECTDIR}/Framework/Input Capture/IC2_isr.o".ok ${OBJECTDIR}/Framework/Input\ Capture/IC2_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Framework/Input Capture/IC2_isr.o.d" "${OBJECTDIR}/Framework/Input Capture/IC2_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Framework/Input Capture/IC2_isr.o.d"  -o "${OBJECTDIR}/Framework/Input Capture/IC2_isr.o" "Framework/Input Capture/IC2_isr.S"  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Framework/Input Capture/IC2_isr.o.asm.d",--gdwarf-2 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Framework/Input\ Capture/IC3_isr.o: Framework/Input\ Capture/IC3_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Framework/Input Capture" 
	@${RM} "${OBJECTDIR}/Framework/Input Capture/IC3_isr.o".d 
	@${RM} "${OBJECTDIR}/Framework/Input Capture/IC3_isr.o" 
	@${RM} "${OBJECTDIR}/Framework/Input Capture/IC3_isr.o".ok ${OBJECTDIR}/Framework/Input\ Capture/IC3_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Framework/Input Capture/IC3_isr.o.d" "${OBJECTDIR}/Framework/Input Capture/IC3_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Framework/Input Capture/IC3_isr.o.d"  -o "${OBJECTDIR}/Framework/Input Capture/IC3_isr.o" "Framework/Input Capture/IC3_isr.S"  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Framework/Input Capture/IC3_isr.o.asm.d",--gdwarf-2 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Framework/Input\ Capture/IC4_isr.o: Framework/Input\ Capture/IC4_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Framework/Input Capture" 
	@${RM} "${OBJECTDIR}/Framework/Input Capture/IC4_isr.o".d 
	@${RM} "${OBJECTDIR}/Framework/Input Capture/IC4_isr.o" 
	@${RM} "${OBJECTDIR}/Framework/Input Capture/IC4_isr.o".ok ${OBJECTDIR}/Framework/Input\ Capture/IC4_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Framework/Input Capture/IC4_isr.o.d" "${OBJECTDIR}/Framework/Input Capture/IC4_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Framework/Input Capture/IC4_isr.o.d"  -o "${OBJECTDIR}/Framework/Input Capture/IC4_isr.o" "Framework/Input Capture/IC4_isr.S"  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Framework/Input Capture/IC4_isr.o.asm.d",--gdwarf-2 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Framework/IO\ Ports/PortAOnChange_isr.o: Framework/IO\ Ports/PortAOnChange_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Framework/IO Ports" 
	@${RM} "${OBJECTDIR}/Framework/IO Ports/PortAOnChange_isr.o".d 
	@${RM} "${OBJECTDIR}/Framework/IO Ports/PortAOnChange_isr.o" 
	@${RM} "${OBJECTDIR}/Framework/IO Ports/PortAOnChange_isr.o".ok ${OBJECTDIR}/Framework/IO\ Ports/PortAOnChange_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Framework/IO Ports/PortAOnChange_isr.o.d" "${OBJECTDIR}/Framework/IO Ports/PortAOnChange_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Framework/IO Ports/PortAOnChange_isr.o.d"  -o "${OBJECTDIR}/Framework/IO Ports/PortAOnChange_isr.o" "Framework/IO Ports/PortAOnChange_isr.S"  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Framework/IO Ports/PortAOnChange_isr.o.asm.d",--gdwarf-2 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Framework/IO\ Ports/PortBOnChange_isr.o: Framework/IO\ Ports/PortBOnChange_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Framework/IO Ports" 
	@${RM} "${OBJECTDIR}/Framework/IO Ports/PortBOnChange_isr.o".d 
	@${RM} "${OBJECTDIR}/Framework/IO Ports/PortBOnChange_isr.o" 
	@${RM} "${OBJECTDIR}/Framework/IO Ports/PortBOnChange_isr.o".ok ${OBJECTDIR}/Framework/IO\ Ports/PortBOnChange_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Framework/IO Ports/PortBOnChange_isr.o.d" "${OBJECTDIR}/Framework/IO Ports/PortBOnChange_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Framework/IO Ports/PortBOnChange_isr.o.d"  -o "${OBJECTDIR}/Framework/IO Ports/PortBOnChange_isr.o" "Framework/IO Ports/PortBOnChange_isr.S"  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Framework/IO Ports/PortBOnChange_isr.o.asm.d",--gdwarf-2 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Framework/IO\ Ports/PortCOnChange_isr.o: Framework/IO\ Ports/PortCOnChange_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Framework/IO Ports" 
	@${RM} "${OBJECTDIR}/Framework/IO Ports/PortCOnChange_isr.o".d 
	@${RM} "${OBJECTDIR}/Framework/IO Ports/PortCOnChange_isr.o" 
	@${RM} "${OBJECTDIR}/Framework/IO Ports/PortCOnChange_isr.o".ok ${OBJECTDIR}/Framework/IO\ Ports/PortCOnChange_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Framework/IO Ports/PortCOnChange_isr.o.d" "${OBJECTDIR}/Framework/IO Ports/PortCOnChange_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Framework/IO Ports/PortCOnChange_isr.o.d"  -o "${OBJECTDIR}/Framework/IO Ports/PortCOnChange_isr.o" "Framework/IO Ports/PortCOnChange_isr.S"  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Framework/IO Ports/PortCOnChange_isr.o.asm.d",--gdwarf-2 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Framework/IO\ Ports/PortDOnChange_isr.o: Framework/IO\ Ports/PortDOnChange_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Framework/IO Ports" 
	@${RM} "${OBJECTDIR}/Framework/IO Ports/PortDOnChange_isr.o".d 
	@${RM} "${OBJECTDIR}/Framework/IO Ports/PortDOnChange_isr.o" 
	@${RM} "${OBJECTDIR}/Framework/IO Ports/PortDOnChange_isr.o".ok ${OBJECTDIR}/Framework/IO\ Ports/PortDOnChange_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Framework/IO Ports/PortDOnChange_isr.o.d" "${OBJECTDIR}/Framework/IO Ports/PortDOnChange_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Framework/IO Ports/PortDOnChange_isr.o.d"  -o "${OBJECTDIR}/Framework/IO Ports/PortDOnChange_isr.o" "Framework/IO Ports/PortDOnChange_isr.S"  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Framework/IO Ports/PortDOnChange_isr.o.asm.d",--gdwarf-2 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Framework/IO\ Ports/PortEOnChange_isr.o: Framework/IO\ Ports/PortEOnChange_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Framework/IO Ports" 
	@${RM} "${OBJECTDIR}/Framework/IO Ports/PortEOnChange_isr.o".d 
	@${RM} "${OBJECTDIR}/Framework/IO Ports/PortEOnChange_isr.o" 
	@${RM} "${OBJECTDIR}/Framework/IO Ports/PortEOnChange_isr.o".ok ${OBJECTDIR}/Framework/IO\ Ports/PortEOnChange_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Framework/IO Ports/PortEOnChange_isr.o.d" "${OBJECTDIR}/Framework/IO Ports/PortEOnChange_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Framework/IO Ports/PortEOnChange_isr.o.d"  -o "${OBJECTDIR}/Framework/IO Ports/PortEOnChange_isr.o" "Framework/IO Ports/PortEOnChange_isr.S"  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Framework/IO Ports/PortEOnChange_isr.o.asm.d",--gdwarf-2 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Framework/IO\ Ports/PortFOnChange_isr.o: Framework/IO\ Ports/PortFOnChange_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Framework/IO Ports" 
	@${RM} "${OBJECTDIR}/Framework/IO Ports/PortFOnChange_isr.o".d 
	@${RM} "${OBJECTDIR}/Framework/IO Ports/PortFOnChange_isr.o" 
	@${RM} "${OBJECTDIR}/Framework/IO Ports/PortFOnChange_isr.o".ok ${OBJECTDIR}/Framework/IO\ Ports/PortFOnChange_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Framework/IO Ports/PortFOnChange_isr.o.d" "${OBJECTDIR}/Framework/IO Ports/PortFOnChange_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Framework/IO Ports/PortFOnChange_isr.o.d"  -o "${OBJECTDIR}/Framework/IO Ports/PortFOnChange_isr.o" "Framework/IO Ports/PortFOnChange_isr.S"  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Framework/IO Ports/PortFOnChange_isr.o.asm.d",--gdwarf-2 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Framework/IO\ Ports/PortGOnChange_isr.o: Framework/IO\ Ports/PortGOnChange_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Framework/IO Ports" 
	@${RM} "${OBJECTDIR}/Framework/IO Ports/PortGOnChange_isr.o".d 
	@${RM} "${OBJECTDIR}/Framework/IO Ports/PortGOnChange_isr.o" 
	@${RM} "${OBJECTDIR}/Framework/IO Ports/PortGOnChange_isr.o".ok ${OBJECTDIR}/Framework/IO\ Ports/PortGOnChange_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Framework/IO Ports/PortGOnChange_isr.o.d" "${OBJECTDIR}/Framework/IO Ports/PortGOnChange_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Framework/IO Ports/PortGOnChange_isr.o.d"  -o "${OBJECTDIR}/Framework/IO Ports/PortGOnChange_isr.o" "Framework/IO Ports/PortGOnChange_isr.S"  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Framework/IO Ports/PortGOnChange_isr.o.asm.d",--gdwarf-2 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Framework/Timer/Timer2_isr.o: Framework/Timer/Timer2_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Framework/Timer" 
	@${RM} ${OBJECTDIR}/Framework/Timer/Timer2_isr.o.d 
	@${RM} ${OBJECTDIR}/Framework/Timer/Timer2_isr.o 
	@${RM} ${OBJECTDIR}/Framework/Timer/Timer2_isr.o.ok ${OBJECTDIR}/Framework/Timer/Timer2_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Framework/Timer/Timer2_isr.o.d" "${OBJECTDIR}/Framework/Timer/Timer2_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Framework/Timer/Timer2_isr.o.d"  -o ${OBJECTDIR}/Framework/Timer/Timer2_isr.o Framework/Timer/Timer2_isr.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Framework/Timer/Timer2_isr.o.asm.d",--gdwarf-2 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Framework/Timer/Timer3_isr.o: Framework/Timer/Timer3_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Framework/Timer" 
	@${RM} ${OBJECTDIR}/Framework/Timer/Timer3_isr.o.d 
	@${RM} ${OBJECTDIR}/Framework/Timer/Timer3_isr.o 
	@${RM} ${OBJECTDIR}/Framework/Timer/Timer3_isr.o.ok ${OBJECTDIR}/Framework/Timer/Timer3_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Framework/Timer/Timer3_isr.o.d" "${OBJECTDIR}/Framework/Timer/Timer3_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Framework/Timer/Timer3_isr.o.d"  -o ${OBJECTDIR}/Framework/Timer/Timer3_isr.o Framework/Timer/Timer3_isr.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Framework/Timer/Timer3_isr.o.asm.d",--gdwarf-2 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Framework/Timer/Timer4_isr.o: Framework/Timer/Timer4_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Framework/Timer" 
	@${RM} ${OBJECTDIR}/Framework/Timer/Timer4_isr.o.d 
	@${RM} ${OBJECTDIR}/Framework/Timer/Timer4_isr.o 
	@${RM} ${OBJECTDIR}/Framework/Timer/Timer4_isr.o.ok ${OBJECTDIR}/Framework/Timer/Timer4_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Framework/Timer/Timer4_isr.o.d" "${OBJECTDIR}/Framework/Timer/Timer4_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Framework/Timer/Timer4_isr.o.d"  -o ${OBJECTDIR}/Framework/Timer/Timer4_isr.o Framework/Timer/Timer4_isr.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Framework/Timer/Timer4_isr.o.asm.d",--gdwarf-2 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Framework/Timer/Timer5_isr.o: Framework/Timer/Timer5_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Framework/Timer" 
	@${RM} ${OBJECTDIR}/Framework/Timer/Timer5_isr.o.d 
	@${RM} ${OBJECTDIR}/Framework/Timer/Timer5_isr.o 
	@${RM} ${OBJECTDIR}/Framework/Timer/Timer5_isr.o.ok ${OBJECTDIR}/Framework/Timer/Timer5_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Framework/Timer/Timer5_isr.o.d" "${OBJECTDIR}/Framework/Timer/Timer5_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Framework/Timer/Timer5_isr.o.d"  -o ${OBJECTDIR}/Framework/Timer/Timer5_isr.o Framework/Timer/Timer5_isr.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Framework/Timer/Timer5_isr.o.asm.d",--gdwarf-2 -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Framework/USB/USB_isr.o: Framework/USB/USB_isr.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Framework/USB" 
	@${RM} ${OBJECTDIR}/Framework/USB/USB_isr.o.d 
	@${RM} ${OBJECTDIR}/Framework/USB/USB_isr.o 
	@${RM} ${OBJECTDIR}/Framework/USB/USB_isr.o.ok ${OBJECTDIR}/Framework/USB/USB_isr.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Framework/USB/USB_isr.o.d" "${OBJECTDIR}/Framework/USB/USB_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"." -I"Source/portable/MPLAB/PIC32MZ" -MMD -MF "${OBJECTDIR}/Framework/USB/USB_isr.o.d"  -o ${OBJECTDIR}/Framework/USB/USB_isr.o Framework/USB/USB_isr.S  -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Framework/USB/USB_isr.o.asm.d",--gdwarf-2 -mdfp=${DFP_DIR}
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/Source/portable/MemMang/heap_4.o: Source/portable/MemMang/heap_4.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Source/portable/MemMang" 
	@${RM} ${OBJECTDIR}/Source/portable/MemMang/heap_4.o.d 
	@${RM} ${OBJECTDIR}/Source/portable/MemMang/heap_4.o 
	@${FIXDEPS} "${OBJECTDIR}/Source/portable/MemMang/heap_4.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -I"System Configs" -MMD -MF "${OBJECTDIR}/Source/portable/MemMang/heap_4.o.d" -o ${OBJECTDIR}/Source/portable/MemMang/heap_4.o Source/portable/MemMang/heap_4.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port.o: Source/portable/MPLAB/PIC32MZ/port.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ" 
	@${RM} ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port.o.d 
	@${RM} ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port.o 
	@${FIXDEPS} "${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -I"System Configs" -MMD -MF "${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port.o.d" -o ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port.o Source/portable/MPLAB/PIC32MZ/port.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Source/croutine.o: Source/croutine.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Source" 
	@${RM} ${OBJECTDIR}/Source/croutine.o.d 
	@${RM} ${OBJECTDIR}/Source/croutine.o 
	@${FIXDEPS} "${OBJECTDIR}/Source/croutine.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -I"System Configs" -MMD -MF "${OBJECTDIR}/Source/croutine.o.d" -o ${OBJECTDIR}/Source/croutine.o Source/croutine.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Source/event_groups.o: Source/event_groups.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Source" 
	@${RM} ${OBJECTDIR}/Source/event_groups.o.d 
	@${RM} ${OBJECTDIR}/Source/event_groups.o 
	@${FIXDEPS} "${OBJECTDIR}/Source/event_groups.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -I"System Configs" -MMD -MF "${OBJECTDIR}/Source/event_groups.o.d" -o ${OBJECTDIR}/Source/event_groups.o Source/event_groups.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Source/list.o: Source/list.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Source" 
	@${RM} ${OBJECTDIR}/Source/list.o.d 
	@${RM} ${OBJECTDIR}/Source/list.o 
	@${FIXDEPS} "${OBJECTDIR}/Source/list.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -I"System Configs" -MMD -MF "${OBJECTDIR}/Source/list.o.d" -o ${OBJECTDIR}/Source/list.o Source/list.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Source/queue.o: Source/queue.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Source" 
	@${RM} ${OBJECTDIR}/Source/queue.o.d 
	@${RM} ${OBJECTDIR}/Source/queue.o 
	@${FIXDEPS} "${OBJECTDIR}/Source/queue.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -I"System Configs" -MMD -MF "${OBJECTDIR}/Source/queue.o.d" -o ${OBJECTDIR}/Source/queue.o Source/queue.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Source/stream_buffer.o: Source/stream_buffer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Source" 
	@${RM} ${OBJECTDIR}/Source/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/Source/stream_buffer.o 
	@${FIXDEPS} "${OBJECTDIR}/Source/stream_buffer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -I"System Configs" -MMD -MF "${OBJECTDIR}/Source/stream_buffer.o.d" -o ${OBJECTDIR}/Source/stream_buffer.o Source/stream_buffer.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Source/tasks.o: Source/tasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Source" 
	@${RM} ${OBJECTDIR}/Source/tasks.o.d 
	@${RM} ${OBJECTDIR}/Source/tasks.o 
	@${FIXDEPS} "${OBJECTDIR}/Source/tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -I"System Configs" -MMD -MF "${OBJECTDIR}/Source/tasks.o.d" -o ${OBJECTDIR}/Source/tasks.o Source/tasks.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Source/timers.o: Source/timers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Source" 
	@${RM} ${OBJECTDIR}/Source/timers.o.d 
	@${RM} ${OBJECTDIR}/Source/timers.o 
	@${FIXDEPS} "${OBJECTDIR}/Source/timers.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -I"System Configs" -MMD -MF "${OBJECTDIR}/Source/timers.o.d" -o ${OBJECTDIR}/Source/timers.o Source/timers.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Application/main.o: Application/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Application" 
	@${RM} ${OBJECTDIR}/Application/main.o.d 
	@${RM} ${OBJECTDIR}/Application/main.o 
	@${FIXDEPS} "${OBJECTDIR}/Application/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -I"System Configs" -MMD -MF "${OBJECTDIR}/Application/main.o.d" -o ${OBJECTDIR}/Application/main.o Application/main.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Application/Services/SystemHooks.o: Application/Services/SystemHooks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Application/Services" 
	@${RM} ${OBJECTDIR}/Application/Services/SystemHooks.o.d 
	@${RM} ${OBJECTDIR}/Application/Services/SystemHooks.o 
	@${FIXDEPS} "${OBJECTDIR}/Application/Services/SystemHooks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -I"System Configs" -MMD -MF "${OBJECTDIR}/Application/Services/SystemHooks.o.d" -o ${OBJECTDIR}/Application/Services/SystemHooks.o Application/Services/SystemHooks.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Application/Tasks/USBPacketManager.o: Application/Tasks/USBPacketManager.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Application/Tasks" 
	@${RM} ${OBJECTDIR}/Application/Tasks/USBPacketManager.o.d 
	@${RM} ${OBJECTDIR}/Application/Tasks/USBPacketManager.o 
	@${FIXDEPS} "${OBJECTDIR}/Application/Tasks/USBPacketManager.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -I"System Configs" -MMD -MF "${OBJECTDIR}/Application/Tasks/USBPacketManager.o.d" -o ${OBJECTDIR}/Application/Tasks/USBPacketManager.o Application/Tasks/USBPacketManager.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Framework/ADC/ADC.o: Framework/ADC/ADC.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Framework/ADC" 
	@${RM} ${OBJECTDIR}/Framework/ADC/ADC.o.d 
	@${RM} ${OBJECTDIR}/Framework/ADC/ADC.o 
	@${FIXDEPS} "${OBJECTDIR}/Framework/ADC/ADC.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -I"System Configs" -MMD -MF "${OBJECTDIR}/Framework/ADC/ADC.o.d" -o ${OBJECTDIR}/Framework/ADC/ADC.o Framework/ADC/ADC.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Framework/HC-SR04/HC-SR04.o: Framework/HC-SR04/HC-SR04.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Framework/HC-SR04" 
	@${RM} ${OBJECTDIR}/Framework/HC-SR04/HC-SR04.o.d 
	@${RM} ${OBJECTDIR}/Framework/HC-SR04/HC-SR04.o 
	@${FIXDEPS} "${OBJECTDIR}/Framework/HC-SR04/HC-SR04.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -I"System Configs" -MMD -MF "${OBJECTDIR}/Framework/HC-SR04/HC-SR04.o.d" -o ${OBJECTDIR}/Framework/HC-SR04/HC-SR04.o Framework/HC-SR04/HC-SR04.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Framework/HX711/HX711.o: Framework/HX711/HX711.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Framework/HX711" 
	@${RM} ${OBJECTDIR}/Framework/HX711/HX711.o.d 
	@${RM} ${OBJECTDIR}/Framework/HX711/HX711.o 
	@${FIXDEPS} "${OBJECTDIR}/Framework/HX711/HX711.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -I"System Configs" -MMD -MF "${OBJECTDIR}/Framework/HX711/HX711.o.d" -o ${OBJECTDIR}/Framework/HX711/HX711.o Framework/HX711/HX711.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Framework/I2C/I2C.o: Framework/I2C/I2C.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Framework/I2C" 
	@${RM} ${OBJECTDIR}/Framework/I2C/I2C.o.d 
	@${RM} ${OBJECTDIR}/Framework/I2C/I2C.o 
	@${FIXDEPS} "${OBJECTDIR}/Framework/I2C/I2C.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -I"System Configs" -MMD -MF "${OBJECTDIR}/Framework/I2C/I2C.o.d" -o ${OBJECTDIR}/Framework/I2C/I2C.o Framework/I2C/I2C.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Framework/INA219/INA219.o: Framework/INA219/INA219.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Framework/INA219" 
	@${RM} ${OBJECTDIR}/Framework/INA219/INA219.o.d 
	@${RM} ${OBJECTDIR}/Framework/INA219/INA219.o 
	@${FIXDEPS} "${OBJECTDIR}/Framework/INA219/INA219.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -I"System Configs" -MMD -MF "${OBJECTDIR}/Framework/INA219/INA219.o.d" -o ${OBJECTDIR}/Framework/INA219/INA219.o Framework/INA219/INA219.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Framework/Input\ Capture/InputCapture.o: Framework/Input\ Capture/InputCapture.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Framework/Input Capture" 
	@${RM} "${OBJECTDIR}/Framework/Input Capture/InputCapture.o".d 
	@${RM} "${OBJECTDIR}/Framework/Input Capture/InputCapture.o" 
	@${FIXDEPS} "${OBJECTDIR}/Framework/Input Capture/InputCapture.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -I"System Configs" -MMD -MF "${OBJECTDIR}/Framework/Input Capture/InputCapture.o.d" -o "${OBJECTDIR}/Framework/Input Capture/InputCapture.o" "Framework/Input Capture/InputCapture.c"    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Framework/IO\ Ports/IOPorts.o: Framework/IO\ Ports/IOPorts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Framework/IO Ports" 
	@${RM} "${OBJECTDIR}/Framework/IO Ports/IOPorts.o".d 
	@${RM} "${OBJECTDIR}/Framework/IO Ports/IOPorts.o" 
	@${FIXDEPS} "${OBJECTDIR}/Framework/IO Ports/IOPorts.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -I"System Configs" -MMD -MF "${OBJECTDIR}/Framework/IO Ports/IOPorts.o.d" -o "${OBJECTDIR}/Framework/IO Ports/IOPorts.o" "Framework/IO Ports/IOPorts.c"    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Framework/LED\ Interface/LEDInterface.o: Framework/LED\ Interface/LEDInterface.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Framework/LED Interface" 
	@${RM} "${OBJECTDIR}/Framework/LED Interface/LEDInterface.o".d 
	@${RM} "${OBJECTDIR}/Framework/LED Interface/LEDInterface.o" 
	@${FIXDEPS} "${OBJECTDIR}/Framework/LED Interface/LEDInterface.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -I"System Configs" -MMD -MF "${OBJECTDIR}/Framework/LED Interface/LEDInterface.o.d" -o "${OBJECTDIR}/Framework/LED Interface/LEDInterface.o" "Framework/LED Interface/LEDInterface.c"    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Framework/PWM/PWM.o: Framework/PWM/PWM.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Framework/PWM" 
	@${RM} ${OBJECTDIR}/Framework/PWM/PWM.o.d 
	@${RM} ${OBJECTDIR}/Framework/PWM/PWM.o 
	@${FIXDEPS} "${OBJECTDIR}/Framework/PWM/PWM.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -I"System Configs" -MMD -MF "${OBJECTDIR}/Framework/PWM/PWM.o.d" -o ${OBJECTDIR}/Framework/PWM/PWM.o Framework/PWM/PWM.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Framework/Timer/Timer.o: Framework/Timer/Timer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Framework/Timer" 
	@${RM} ${OBJECTDIR}/Framework/Timer/Timer.o.d 
	@${RM} ${OBJECTDIR}/Framework/Timer/Timer.o 
	@${FIXDEPS} "${OBJECTDIR}/Framework/Timer/Timer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -I"System Configs" -MMD -MF "${OBJECTDIR}/Framework/Timer/Timer.o.d" -o ${OBJECTDIR}/Framework/Timer/Timer.o Framework/Timer/Timer.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Framework/USB/USB.o: Framework/USB/USB.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Framework/USB" 
	@${RM} ${OBJECTDIR}/Framework/USB/USB.o.d 
	@${RM} ${OBJECTDIR}/Framework/USB/USB.o 
	@${FIXDEPS} "${OBJECTDIR}/Framework/USB/USB.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -I"System Configs" -MMD -MF "${OBJECTDIR}/Framework/USB/USB.o.d" -o ${OBJECTDIR}/Framework/USB/USB.o Framework/USB/USB.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
else
${OBJECTDIR}/Source/portable/MemMang/heap_4.o: Source/portable/MemMang/heap_4.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Source/portable/MemMang" 
	@${RM} ${OBJECTDIR}/Source/portable/MemMang/heap_4.o.d 
	@${RM} ${OBJECTDIR}/Source/portable/MemMang/heap_4.o 
	@${FIXDEPS} "${OBJECTDIR}/Source/portable/MemMang/heap_4.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -I"System Configs" -MMD -MF "${OBJECTDIR}/Source/portable/MemMang/heap_4.o.d" -o ${OBJECTDIR}/Source/portable/MemMang/heap_4.o Source/portable/MemMang/heap_4.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port.o: Source/portable/MPLAB/PIC32MZ/port.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ" 
	@${RM} ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port.o.d 
	@${RM} ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port.o 
	@${FIXDEPS} "${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -I"System Configs" -MMD -MF "${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port.o.d" -o ${OBJECTDIR}/Source/portable/MPLAB/PIC32MZ/port.o Source/portable/MPLAB/PIC32MZ/port.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Source/croutine.o: Source/croutine.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Source" 
	@${RM} ${OBJECTDIR}/Source/croutine.o.d 
	@${RM} ${OBJECTDIR}/Source/croutine.o 
	@${FIXDEPS} "${OBJECTDIR}/Source/croutine.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -I"System Configs" -MMD -MF "${OBJECTDIR}/Source/croutine.o.d" -o ${OBJECTDIR}/Source/croutine.o Source/croutine.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Source/event_groups.o: Source/event_groups.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Source" 
	@${RM} ${OBJECTDIR}/Source/event_groups.o.d 
	@${RM} ${OBJECTDIR}/Source/event_groups.o 
	@${FIXDEPS} "${OBJECTDIR}/Source/event_groups.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -I"System Configs" -MMD -MF "${OBJECTDIR}/Source/event_groups.o.d" -o ${OBJECTDIR}/Source/event_groups.o Source/event_groups.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Source/list.o: Source/list.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Source" 
	@${RM} ${OBJECTDIR}/Source/list.o.d 
	@${RM} ${OBJECTDIR}/Source/list.o 
	@${FIXDEPS} "${OBJECTDIR}/Source/list.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -I"System Configs" -MMD -MF "${OBJECTDIR}/Source/list.o.d" -o ${OBJECTDIR}/Source/list.o Source/list.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Source/queue.o: Source/queue.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Source" 
	@${RM} ${OBJECTDIR}/Source/queue.o.d 
	@${RM} ${OBJECTDIR}/Source/queue.o 
	@${FIXDEPS} "${OBJECTDIR}/Source/queue.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -I"System Configs" -MMD -MF "${OBJECTDIR}/Source/queue.o.d" -o ${OBJECTDIR}/Source/queue.o Source/queue.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Source/stream_buffer.o: Source/stream_buffer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Source" 
	@${RM} ${OBJECTDIR}/Source/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/Source/stream_buffer.o 
	@${FIXDEPS} "${OBJECTDIR}/Source/stream_buffer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -I"System Configs" -MMD -MF "${OBJECTDIR}/Source/stream_buffer.o.d" -o ${OBJECTDIR}/Source/stream_buffer.o Source/stream_buffer.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Source/tasks.o: Source/tasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Source" 
	@${RM} ${OBJECTDIR}/Source/tasks.o.d 
	@${RM} ${OBJECTDIR}/Source/tasks.o 
	@${FIXDEPS} "${OBJECTDIR}/Source/tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -I"System Configs" -MMD -MF "${OBJECTDIR}/Source/tasks.o.d" -o ${OBJECTDIR}/Source/tasks.o Source/tasks.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Source/timers.o: Source/timers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Source" 
	@${RM} ${OBJECTDIR}/Source/timers.o.d 
	@${RM} ${OBJECTDIR}/Source/timers.o 
	@${FIXDEPS} "${OBJECTDIR}/Source/timers.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -I"System Configs" -MMD -MF "${OBJECTDIR}/Source/timers.o.d" -o ${OBJECTDIR}/Source/timers.o Source/timers.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Application/main.o: Application/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Application" 
	@${RM} ${OBJECTDIR}/Application/main.o.d 
	@${RM} ${OBJECTDIR}/Application/main.o 
	@${FIXDEPS} "${OBJECTDIR}/Application/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -I"System Configs" -MMD -MF "${OBJECTDIR}/Application/main.o.d" -o ${OBJECTDIR}/Application/main.o Application/main.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Application/Services/SystemHooks.o: Application/Services/SystemHooks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Application/Services" 
	@${RM} ${OBJECTDIR}/Application/Services/SystemHooks.o.d 
	@${RM} ${OBJECTDIR}/Application/Services/SystemHooks.o 
	@${FIXDEPS} "${OBJECTDIR}/Application/Services/SystemHooks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -I"System Configs" -MMD -MF "${OBJECTDIR}/Application/Services/SystemHooks.o.d" -o ${OBJECTDIR}/Application/Services/SystemHooks.o Application/Services/SystemHooks.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Application/Tasks/USBPacketManager.o: Application/Tasks/USBPacketManager.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Application/Tasks" 
	@${RM} ${OBJECTDIR}/Application/Tasks/USBPacketManager.o.d 
	@${RM} ${OBJECTDIR}/Application/Tasks/USBPacketManager.o 
	@${FIXDEPS} "${OBJECTDIR}/Application/Tasks/USBPacketManager.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -I"System Configs" -MMD -MF "${OBJECTDIR}/Application/Tasks/USBPacketManager.o.d" -o ${OBJECTDIR}/Application/Tasks/USBPacketManager.o Application/Tasks/USBPacketManager.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Framework/ADC/ADC.o: Framework/ADC/ADC.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Framework/ADC" 
	@${RM} ${OBJECTDIR}/Framework/ADC/ADC.o.d 
	@${RM} ${OBJECTDIR}/Framework/ADC/ADC.o 
	@${FIXDEPS} "${OBJECTDIR}/Framework/ADC/ADC.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -I"System Configs" -MMD -MF "${OBJECTDIR}/Framework/ADC/ADC.o.d" -o ${OBJECTDIR}/Framework/ADC/ADC.o Framework/ADC/ADC.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Framework/HC-SR04/HC-SR04.o: Framework/HC-SR04/HC-SR04.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Framework/HC-SR04" 
	@${RM} ${OBJECTDIR}/Framework/HC-SR04/HC-SR04.o.d 
	@${RM} ${OBJECTDIR}/Framework/HC-SR04/HC-SR04.o 
	@${FIXDEPS} "${OBJECTDIR}/Framework/HC-SR04/HC-SR04.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -I"System Configs" -MMD -MF "${OBJECTDIR}/Framework/HC-SR04/HC-SR04.o.d" -o ${OBJECTDIR}/Framework/HC-SR04/HC-SR04.o Framework/HC-SR04/HC-SR04.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Framework/HX711/HX711.o: Framework/HX711/HX711.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Framework/HX711" 
	@${RM} ${OBJECTDIR}/Framework/HX711/HX711.o.d 
	@${RM} ${OBJECTDIR}/Framework/HX711/HX711.o 
	@${FIXDEPS} "${OBJECTDIR}/Framework/HX711/HX711.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -I"System Configs" -MMD -MF "${OBJECTDIR}/Framework/HX711/HX711.o.d" -o ${OBJECTDIR}/Framework/HX711/HX711.o Framework/HX711/HX711.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Framework/I2C/I2C.o: Framework/I2C/I2C.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Framework/I2C" 
	@${RM} ${OBJECTDIR}/Framework/I2C/I2C.o.d 
	@${RM} ${OBJECTDIR}/Framework/I2C/I2C.o 
	@${FIXDEPS} "${OBJECTDIR}/Framework/I2C/I2C.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -I"System Configs" -MMD -MF "${OBJECTDIR}/Framework/I2C/I2C.o.d" -o ${OBJECTDIR}/Framework/I2C/I2C.o Framework/I2C/I2C.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Framework/INA219/INA219.o: Framework/INA219/INA219.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Framework/INA219" 
	@${RM} ${OBJECTDIR}/Framework/INA219/INA219.o.d 
	@${RM} ${OBJECTDIR}/Framework/INA219/INA219.o 
	@${FIXDEPS} "${OBJECTDIR}/Framework/INA219/INA219.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -I"System Configs" -MMD -MF "${OBJECTDIR}/Framework/INA219/INA219.o.d" -o ${OBJECTDIR}/Framework/INA219/INA219.o Framework/INA219/INA219.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Framework/Input\ Capture/InputCapture.o: Framework/Input\ Capture/InputCapture.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Framework/Input Capture" 
	@${RM} "${OBJECTDIR}/Framework/Input Capture/InputCapture.o".d 
	@${RM} "${OBJECTDIR}/Framework/Input Capture/InputCapture.o" 
	@${FIXDEPS} "${OBJECTDIR}/Framework/Input Capture/InputCapture.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -I"System Configs" -MMD -MF "${OBJECTDIR}/Framework/Input Capture/InputCapture.o.d" -o "${OBJECTDIR}/Framework/Input Capture/InputCapture.o" "Framework/Input Capture/InputCapture.c"    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Framework/IO\ Ports/IOPorts.o: Framework/IO\ Ports/IOPorts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Framework/IO Ports" 
	@${RM} "${OBJECTDIR}/Framework/IO Ports/IOPorts.o".d 
	@${RM} "${OBJECTDIR}/Framework/IO Ports/IOPorts.o" 
	@${FIXDEPS} "${OBJECTDIR}/Framework/IO Ports/IOPorts.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -I"System Configs" -MMD -MF "${OBJECTDIR}/Framework/IO Ports/IOPorts.o.d" -o "${OBJECTDIR}/Framework/IO Ports/IOPorts.o" "Framework/IO Ports/IOPorts.c"    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Framework/LED\ Interface/LEDInterface.o: Framework/LED\ Interface/LEDInterface.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Framework/LED Interface" 
	@${RM} "${OBJECTDIR}/Framework/LED Interface/LEDInterface.o".d 
	@${RM} "${OBJECTDIR}/Framework/LED Interface/LEDInterface.o" 
	@${FIXDEPS} "${OBJECTDIR}/Framework/LED Interface/LEDInterface.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -I"System Configs" -MMD -MF "${OBJECTDIR}/Framework/LED Interface/LEDInterface.o.d" -o "${OBJECTDIR}/Framework/LED Interface/LEDInterface.o" "Framework/LED Interface/LEDInterface.c"    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Framework/PWM/PWM.o: Framework/PWM/PWM.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Framework/PWM" 
	@${RM} ${OBJECTDIR}/Framework/PWM/PWM.o.d 
	@${RM} ${OBJECTDIR}/Framework/PWM/PWM.o 
	@${FIXDEPS} "${OBJECTDIR}/Framework/PWM/PWM.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -I"System Configs" -MMD -MF "${OBJECTDIR}/Framework/PWM/PWM.o.d" -o ${OBJECTDIR}/Framework/PWM/PWM.o Framework/PWM/PWM.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Framework/Timer/Timer.o: Framework/Timer/Timer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Framework/Timer" 
	@${RM} ${OBJECTDIR}/Framework/Timer/Timer.o.d 
	@${RM} ${OBJECTDIR}/Framework/Timer/Timer.o 
	@${FIXDEPS} "${OBJECTDIR}/Framework/Timer/Timer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -I"System Configs" -MMD -MF "${OBJECTDIR}/Framework/Timer/Timer.o.d" -o ${OBJECTDIR}/Framework/Timer/Timer.o Framework/Timer/Timer.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/Framework/USB/USB.o: Framework/USB/USB.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Framework/USB" 
	@${RM} ${OBJECTDIR}/Framework/USB/USB.o.d 
	@${RM} ${OBJECTDIR}/Framework/USB/USB.o 
	@${FIXDEPS} "${OBJECTDIR}/Framework/USB/USB.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"." -I"Source/include" -I"Source/portable/MPLAB/PIC32MZ" -I"System Configs" -MMD -MF "${OBJECTDIR}/Framework/USB/USB.o.d" -o ${OBJECTDIR}/Framework/USB/USB.o Framework/USB/USB.c    -DXPRJ_PIC32MZ_Release=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
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
