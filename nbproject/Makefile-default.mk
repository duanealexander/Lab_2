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
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=cof
DEBUGGABLE_SUFFIX=cof
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/uP_Lab2-1.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=cof
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/uP_Lab2-1.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=code_lab2_1.c cus_xlcd/writdata.c cus_xlcd/setcgram.c cus_xlcd/setddram.c cus_xlcd/putsxlcd.c cus_xlcd/putrxlcd.c cus_xlcd/readdata.c cus_xlcd/wcmdxlcd.c cus_xlcd/busyxlcd.c cus_xlcd/readaddr.c cus_xlcd/openxlcd.c Port/vectors.c Port/os_cpu_c.c Source/ucos_ii.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/code_lab2_1.o ${OBJECTDIR}/cus_xlcd/writdata.o ${OBJECTDIR}/cus_xlcd/setcgram.o ${OBJECTDIR}/cus_xlcd/setddram.o ${OBJECTDIR}/cus_xlcd/putsxlcd.o ${OBJECTDIR}/cus_xlcd/putrxlcd.o ${OBJECTDIR}/cus_xlcd/readdata.o ${OBJECTDIR}/cus_xlcd/wcmdxlcd.o ${OBJECTDIR}/cus_xlcd/busyxlcd.o ${OBJECTDIR}/cus_xlcd/readaddr.o ${OBJECTDIR}/cus_xlcd/openxlcd.o ${OBJECTDIR}/Port/vectors.o ${OBJECTDIR}/Port/os_cpu_c.o ${OBJECTDIR}/Source/ucos_ii.o
POSSIBLE_DEPFILES=${OBJECTDIR}/code_lab2_1.o.d ${OBJECTDIR}/cus_xlcd/writdata.o.d ${OBJECTDIR}/cus_xlcd/setcgram.o.d ${OBJECTDIR}/cus_xlcd/setddram.o.d ${OBJECTDIR}/cus_xlcd/putsxlcd.o.d ${OBJECTDIR}/cus_xlcd/putrxlcd.o.d ${OBJECTDIR}/cus_xlcd/readdata.o.d ${OBJECTDIR}/cus_xlcd/wcmdxlcd.o.d ${OBJECTDIR}/cus_xlcd/busyxlcd.o.d ${OBJECTDIR}/cus_xlcd/readaddr.o.d ${OBJECTDIR}/cus_xlcd/openxlcd.o.d ${OBJECTDIR}/Port/vectors.o.d ${OBJECTDIR}/Port/os_cpu_c.o.d ${OBJECTDIR}/Source/ucos_ii.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/code_lab2_1.o ${OBJECTDIR}/cus_xlcd/writdata.o ${OBJECTDIR}/cus_xlcd/setcgram.o ${OBJECTDIR}/cus_xlcd/setddram.o ${OBJECTDIR}/cus_xlcd/putsxlcd.o ${OBJECTDIR}/cus_xlcd/putrxlcd.o ${OBJECTDIR}/cus_xlcd/readdata.o ${OBJECTDIR}/cus_xlcd/wcmdxlcd.o ${OBJECTDIR}/cus_xlcd/busyxlcd.o ${OBJECTDIR}/cus_xlcd/readaddr.o ${OBJECTDIR}/cus_xlcd/openxlcd.o ${OBJECTDIR}/Port/vectors.o ${OBJECTDIR}/Port/os_cpu_c.o ${OBJECTDIR}/Source/ucos_ii.o

# Source Files
SOURCEFILES=code_lab2_1.c cus_xlcd/writdata.c cus_xlcd/setcgram.c cus_xlcd/setddram.c cus_xlcd/putsxlcd.c cus_xlcd/putrxlcd.c cus_xlcd/readdata.c cus_xlcd/wcmdxlcd.c cus_xlcd/busyxlcd.c cus_xlcd/readaddr.c cus_xlcd/openxlcd.c Port/vectors.c Port/os_cpu_c.c Source/ucos_ii.c


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
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/uP_Lab2-1.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=18F452
MP_PROCESSOR_OPTION_LD=18f452
MP_LINKER_DEBUG_OPTION=-r=ROM@0x7DC0:0x7FFF -r=RAM@GPR:0x5F4:0x5FF -u_DEBUGSTACK
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/code_lab2_1.o: code_lab2_1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/code_lab2_1.o.d 
	@${RM} ${OBJECTDIR}/code_lab2_1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/App" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/Port" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/Source" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X" -ml -oa- -Ls -o-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/code_lab2_1.o   code_lab2_1.c 
	@${DEP_GEN} -d ${OBJECTDIR}/code_lab2_1.o 
	@${FIXDEPS} "${OBJECTDIR}/code_lab2_1.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/cus_xlcd/writdata.o: cus_xlcd/writdata.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/cus_xlcd" 
	@${RM} ${OBJECTDIR}/cus_xlcd/writdata.o.d 
	@${RM} ${OBJECTDIR}/cus_xlcd/writdata.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/App" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/Port" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/Source" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X" -ml -oa- -Ls -o-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/cus_xlcd/writdata.o   cus_xlcd/writdata.c 
	@${DEP_GEN} -d ${OBJECTDIR}/cus_xlcd/writdata.o 
	@${FIXDEPS} "${OBJECTDIR}/cus_xlcd/writdata.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/cus_xlcd/setcgram.o: cus_xlcd/setcgram.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/cus_xlcd" 
	@${RM} ${OBJECTDIR}/cus_xlcd/setcgram.o.d 
	@${RM} ${OBJECTDIR}/cus_xlcd/setcgram.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/App" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/Port" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/Source" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X" -ml -oa- -Ls -o-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/cus_xlcd/setcgram.o   cus_xlcd/setcgram.c 
	@${DEP_GEN} -d ${OBJECTDIR}/cus_xlcd/setcgram.o 
	@${FIXDEPS} "${OBJECTDIR}/cus_xlcd/setcgram.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/cus_xlcd/setddram.o: cus_xlcd/setddram.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/cus_xlcd" 
	@${RM} ${OBJECTDIR}/cus_xlcd/setddram.o.d 
	@${RM} ${OBJECTDIR}/cus_xlcd/setddram.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/App" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/Port" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/Source" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X" -ml -oa- -Ls -o-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/cus_xlcd/setddram.o   cus_xlcd/setddram.c 
	@${DEP_GEN} -d ${OBJECTDIR}/cus_xlcd/setddram.o 
	@${FIXDEPS} "${OBJECTDIR}/cus_xlcd/setddram.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/cus_xlcd/putsxlcd.o: cus_xlcd/putsxlcd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/cus_xlcd" 
	@${RM} ${OBJECTDIR}/cus_xlcd/putsxlcd.o.d 
	@${RM} ${OBJECTDIR}/cus_xlcd/putsxlcd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/App" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/Port" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/Source" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X" -ml -oa- -Ls -o-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/cus_xlcd/putsxlcd.o   cus_xlcd/putsxlcd.c 
	@${DEP_GEN} -d ${OBJECTDIR}/cus_xlcd/putsxlcd.o 
	@${FIXDEPS} "${OBJECTDIR}/cus_xlcd/putsxlcd.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/cus_xlcd/putrxlcd.o: cus_xlcd/putrxlcd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/cus_xlcd" 
	@${RM} ${OBJECTDIR}/cus_xlcd/putrxlcd.o.d 
	@${RM} ${OBJECTDIR}/cus_xlcd/putrxlcd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/App" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/Port" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/Source" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X" -ml -oa- -Ls -o-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/cus_xlcd/putrxlcd.o   cus_xlcd/putrxlcd.c 
	@${DEP_GEN} -d ${OBJECTDIR}/cus_xlcd/putrxlcd.o 
	@${FIXDEPS} "${OBJECTDIR}/cus_xlcd/putrxlcd.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/cus_xlcd/readdata.o: cus_xlcd/readdata.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/cus_xlcd" 
	@${RM} ${OBJECTDIR}/cus_xlcd/readdata.o.d 
	@${RM} ${OBJECTDIR}/cus_xlcd/readdata.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/App" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/Port" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/Source" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X" -ml -oa- -Ls -o-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/cus_xlcd/readdata.o   cus_xlcd/readdata.c 
	@${DEP_GEN} -d ${OBJECTDIR}/cus_xlcd/readdata.o 
	@${FIXDEPS} "${OBJECTDIR}/cus_xlcd/readdata.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/cus_xlcd/wcmdxlcd.o: cus_xlcd/wcmdxlcd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/cus_xlcd" 
	@${RM} ${OBJECTDIR}/cus_xlcd/wcmdxlcd.o.d 
	@${RM} ${OBJECTDIR}/cus_xlcd/wcmdxlcd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/App" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/Port" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/Source" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X" -ml -oa- -Ls -o-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/cus_xlcd/wcmdxlcd.o   cus_xlcd/wcmdxlcd.c 
	@${DEP_GEN} -d ${OBJECTDIR}/cus_xlcd/wcmdxlcd.o 
	@${FIXDEPS} "${OBJECTDIR}/cus_xlcd/wcmdxlcd.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/cus_xlcd/busyxlcd.o: cus_xlcd/busyxlcd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/cus_xlcd" 
	@${RM} ${OBJECTDIR}/cus_xlcd/busyxlcd.o.d 
	@${RM} ${OBJECTDIR}/cus_xlcd/busyxlcd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/App" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/Port" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/Source" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X" -ml -oa- -Ls -o-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/cus_xlcd/busyxlcd.o   cus_xlcd/busyxlcd.c 
	@${DEP_GEN} -d ${OBJECTDIR}/cus_xlcd/busyxlcd.o 
	@${FIXDEPS} "${OBJECTDIR}/cus_xlcd/busyxlcd.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/cus_xlcd/readaddr.o: cus_xlcd/readaddr.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/cus_xlcd" 
	@${RM} ${OBJECTDIR}/cus_xlcd/readaddr.o.d 
	@${RM} ${OBJECTDIR}/cus_xlcd/readaddr.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/App" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/Port" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/Source" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X" -ml -oa- -Ls -o-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/cus_xlcd/readaddr.o   cus_xlcd/readaddr.c 
	@${DEP_GEN} -d ${OBJECTDIR}/cus_xlcd/readaddr.o 
	@${FIXDEPS} "${OBJECTDIR}/cus_xlcd/readaddr.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/cus_xlcd/openxlcd.o: cus_xlcd/openxlcd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/cus_xlcd" 
	@${RM} ${OBJECTDIR}/cus_xlcd/openxlcd.o.d 
	@${RM} ${OBJECTDIR}/cus_xlcd/openxlcd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/App" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/Port" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/Source" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X" -ml -oa- -Ls -o-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/cus_xlcd/openxlcd.o   cus_xlcd/openxlcd.c 
	@${DEP_GEN} -d ${OBJECTDIR}/cus_xlcd/openxlcd.o 
	@${FIXDEPS} "${OBJECTDIR}/cus_xlcd/openxlcd.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/Port/vectors.o: Port/vectors.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Port" 
	@${RM} ${OBJECTDIR}/Port/vectors.o.d 
	@${RM} ${OBJECTDIR}/Port/vectors.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/App" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/Port" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/Source" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X" -ml -oa- -Ls -o-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/Port/vectors.o   Port/vectors.c 
	@${DEP_GEN} -d ${OBJECTDIR}/Port/vectors.o 
	@${FIXDEPS} "${OBJECTDIR}/Port/vectors.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/Port/os_cpu_c.o: Port/os_cpu_c.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Port" 
	@${RM} ${OBJECTDIR}/Port/os_cpu_c.o.d 
	@${RM} ${OBJECTDIR}/Port/os_cpu_c.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/App" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/Port" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/Source" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X" -ml -oa- -Ls -o-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/Port/os_cpu_c.o   Port/os_cpu_c.c 
	@${DEP_GEN} -d ${OBJECTDIR}/Port/os_cpu_c.o 
	@${FIXDEPS} "${OBJECTDIR}/Port/os_cpu_c.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/Source/ucos_ii.o: Source/ucos_ii.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Source" 
	@${RM} ${OBJECTDIR}/Source/ucos_ii.o.d 
	@${RM} ${OBJECTDIR}/Source/ucos_ii.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/App" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/Port" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/Source" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X" -ml -oa- -Ls -o-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/Source/ucos_ii.o   Source/ucos_ii.c 
	@${DEP_GEN} -d ${OBJECTDIR}/Source/ucos_ii.o 
	@${FIXDEPS} "${OBJECTDIR}/Source/ucos_ii.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
else
${OBJECTDIR}/code_lab2_1.o: code_lab2_1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/code_lab2_1.o.d 
	@${RM} ${OBJECTDIR}/code_lab2_1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/App" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/Port" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/Source" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X" -ml -oa- -Ls -o-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/code_lab2_1.o   code_lab2_1.c 
	@${DEP_GEN} -d ${OBJECTDIR}/code_lab2_1.o 
	@${FIXDEPS} "${OBJECTDIR}/code_lab2_1.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/cus_xlcd/writdata.o: cus_xlcd/writdata.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/cus_xlcd" 
	@${RM} ${OBJECTDIR}/cus_xlcd/writdata.o.d 
	@${RM} ${OBJECTDIR}/cus_xlcd/writdata.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/App" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/Port" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/Source" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X" -ml -oa- -Ls -o-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/cus_xlcd/writdata.o   cus_xlcd/writdata.c 
	@${DEP_GEN} -d ${OBJECTDIR}/cus_xlcd/writdata.o 
	@${FIXDEPS} "${OBJECTDIR}/cus_xlcd/writdata.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/cus_xlcd/setcgram.o: cus_xlcd/setcgram.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/cus_xlcd" 
	@${RM} ${OBJECTDIR}/cus_xlcd/setcgram.o.d 
	@${RM} ${OBJECTDIR}/cus_xlcd/setcgram.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/App" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/Port" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/Source" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X" -ml -oa- -Ls -o-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/cus_xlcd/setcgram.o   cus_xlcd/setcgram.c 
	@${DEP_GEN} -d ${OBJECTDIR}/cus_xlcd/setcgram.o 
	@${FIXDEPS} "${OBJECTDIR}/cus_xlcd/setcgram.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/cus_xlcd/setddram.o: cus_xlcd/setddram.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/cus_xlcd" 
	@${RM} ${OBJECTDIR}/cus_xlcd/setddram.o.d 
	@${RM} ${OBJECTDIR}/cus_xlcd/setddram.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/App" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/Port" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/Source" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X" -ml -oa- -Ls -o-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/cus_xlcd/setddram.o   cus_xlcd/setddram.c 
	@${DEP_GEN} -d ${OBJECTDIR}/cus_xlcd/setddram.o 
	@${FIXDEPS} "${OBJECTDIR}/cus_xlcd/setddram.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/cus_xlcd/putsxlcd.o: cus_xlcd/putsxlcd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/cus_xlcd" 
	@${RM} ${OBJECTDIR}/cus_xlcd/putsxlcd.o.d 
	@${RM} ${OBJECTDIR}/cus_xlcd/putsxlcd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/App" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/Port" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/Source" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X" -ml -oa- -Ls -o-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/cus_xlcd/putsxlcd.o   cus_xlcd/putsxlcd.c 
	@${DEP_GEN} -d ${OBJECTDIR}/cus_xlcd/putsxlcd.o 
	@${FIXDEPS} "${OBJECTDIR}/cus_xlcd/putsxlcd.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/cus_xlcd/putrxlcd.o: cus_xlcd/putrxlcd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/cus_xlcd" 
	@${RM} ${OBJECTDIR}/cus_xlcd/putrxlcd.o.d 
	@${RM} ${OBJECTDIR}/cus_xlcd/putrxlcd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/App" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/Port" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/Source" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X" -ml -oa- -Ls -o-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/cus_xlcd/putrxlcd.o   cus_xlcd/putrxlcd.c 
	@${DEP_GEN} -d ${OBJECTDIR}/cus_xlcd/putrxlcd.o 
	@${FIXDEPS} "${OBJECTDIR}/cus_xlcd/putrxlcd.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/cus_xlcd/readdata.o: cus_xlcd/readdata.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/cus_xlcd" 
	@${RM} ${OBJECTDIR}/cus_xlcd/readdata.o.d 
	@${RM} ${OBJECTDIR}/cus_xlcd/readdata.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/App" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/Port" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/Source" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X" -ml -oa- -Ls -o-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/cus_xlcd/readdata.o   cus_xlcd/readdata.c 
	@${DEP_GEN} -d ${OBJECTDIR}/cus_xlcd/readdata.o 
	@${FIXDEPS} "${OBJECTDIR}/cus_xlcd/readdata.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/cus_xlcd/wcmdxlcd.o: cus_xlcd/wcmdxlcd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/cus_xlcd" 
	@${RM} ${OBJECTDIR}/cus_xlcd/wcmdxlcd.o.d 
	@${RM} ${OBJECTDIR}/cus_xlcd/wcmdxlcd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/App" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/Port" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/Source" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X" -ml -oa- -Ls -o-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/cus_xlcd/wcmdxlcd.o   cus_xlcd/wcmdxlcd.c 
	@${DEP_GEN} -d ${OBJECTDIR}/cus_xlcd/wcmdxlcd.o 
	@${FIXDEPS} "${OBJECTDIR}/cus_xlcd/wcmdxlcd.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/cus_xlcd/busyxlcd.o: cus_xlcd/busyxlcd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/cus_xlcd" 
	@${RM} ${OBJECTDIR}/cus_xlcd/busyxlcd.o.d 
	@${RM} ${OBJECTDIR}/cus_xlcd/busyxlcd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/App" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/Port" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/Source" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X" -ml -oa- -Ls -o-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/cus_xlcd/busyxlcd.o   cus_xlcd/busyxlcd.c 
	@${DEP_GEN} -d ${OBJECTDIR}/cus_xlcd/busyxlcd.o 
	@${FIXDEPS} "${OBJECTDIR}/cus_xlcd/busyxlcd.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/cus_xlcd/readaddr.o: cus_xlcd/readaddr.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/cus_xlcd" 
	@${RM} ${OBJECTDIR}/cus_xlcd/readaddr.o.d 
	@${RM} ${OBJECTDIR}/cus_xlcd/readaddr.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/App" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/Port" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/Source" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X" -ml -oa- -Ls -o-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/cus_xlcd/readaddr.o   cus_xlcd/readaddr.c 
	@${DEP_GEN} -d ${OBJECTDIR}/cus_xlcd/readaddr.o 
	@${FIXDEPS} "${OBJECTDIR}/cus_xlcd/readaddr.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/cus_xlcd/openxlcd.o: cus_xlcd/openxlcd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/cus_xlcd" 
	@${RM} ${OBJECTDIR}/cus_xlcd/openxlcd.o.d 
	@${RM} ${OBJECTDIR}/cus_xlcd/openxlcd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/App" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/Port" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/Source" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X" -ml -oa- -Ls -o-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/cus_xlcd/openxlcd.o   cus_xlcd/openxlcd.c 
	@${DEP_GEN} -d ${OBJECTDIR}/cus_xlcd/openxlcd.o 
	@${FIXDEPS} "${OBJECTDIR}/cus_xlcd/openxlcd.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/Port/vectors.o: Port/vectors.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Port" 
	@${RM} ${OBJECTDIR}/Port/vectors.o.d 
	@${RM} ${OBJECTDIR}/Port/vectors.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/App" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/Port" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/Source" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X" -ml -oa- -Ls -o-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/Port/vectors.o   Port/vectors.c 
	@${DEP_GEN} -d ${OBJECTDIR}/Port/vectors.o 
	@${FIXDEPS} "${OBJECTDIR}/Port/vectors.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/Port/os_cpu_c.o: Port/os_cpu_c.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Port" 
	@${RM} ${OBJECTDIR}/Port/os_cpu_c.o.d 
	@${RM} ${OBJECTDIR}/Port/os_cpu_c.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/App" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/Port" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/Source" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X" -ml -oa- -Ls -o-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/Port/os_cpu_c.o   Port/os_cpu_c.c 
	@${DEP_GEN} -d ${OBJECTDIR}/Port/os_cpu_c.o 
	@${FIXDEPS} "${OBJECTDIR}/Port/os_cpu_c.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/Source/ucos_ii.o: Source/ucos_ii.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Source" 
	@${RM} ${OBJECTDIR}/Source/ucos_ii.o.d 
	@${RM} ${OBJECTDIR}/Source/ucos_ii.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/App" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/Port" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X/Source" -I"C:/Users/Duane/Desktop/Lab 2/uP Lab2-1.X" -ml -oa- -Ls -o-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/Source/ucos_ii.o   Source/ucos_ii.c 
	@${DEP_GEN} -d ${OBJECTDIR}/Source/ucos_ii.o 
	@${FIXDEPS} "${OBJECTDIR}/Source/ucos_ii.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/uP_Lab2-1.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    uc-18f452i.lkr
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_LD} $(MP_EXTRA_LD_PRE) "uc-18f452i.lkr"  -p$(MP_PROCESSOR_OPTION_LD)  -w -x -u_DEBUG -m"${DISTDIR}/${PROJECTNAME}.LO2_815006722(FINAL).X.${IMAGE_TYPE}.map"  -z__MPLAB_BUILD=1  -u_CRUNTIME -z__MPLAB_DEBUG=1 -z__MPLAB_DEBUGGER_PK3=1 $(MP_LINKER_DEBUG_OPTION) -l ${MP_CC_DIR}\\..\\lib  -o dist/${CND_CONF}/${IMAGE_TYPE}/uP_Lab2-1.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}   
else
dist/${CND_CONF}/${IMAGE_TYPE}/uP_Lab2-1.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   uc-18f452i.lkr
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_LD} $(MP_EXTRA_LD_PRE) "uc-18f452i.lkr"  -p$(MP_PROCESSOR_OPTION_LD)  -w  -m"${DISTDIR}/${PROJECTNAME}.LO2_815006722(FINAL).X.${IMAGE_TYPE}.map"  -z__MPLAB_BUILD=1  -u_CRUNTIME -l ${MP_CC_DIR}\\..\\lib  -o dist/${CND_CONF}/${IMAGE_TYPE}/uP_Lab2-1.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}   
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
