#******************************************************************************
# Copyright (C) 2017 by Alex Fosdick - University of Colorado
#
# Redistribution, modification or use of this software in source or binary
# forms is permitted as long as the files maintain this copyright. Users are 
# permitted to modify this and use it to learn about the field of embedded
# software. Alex Fosdick and the University of Colorado are not liable for any
# misuse of this material. 
#
#*****************************************************************************

ifeq ($(PLATFORM),MSP432)
# Add your Source files to this variable
	#SOURCES = *.c
	SOURCES = main.c \
		src/memory.c \
		src/system_msp432p401r.c \
		src/startup_msp432p401r_gcc.c \
		src/interrupts_msp432p401r_gcc.c
# Add your include paths to this variable
	INCLUDES = -I../src \
		-I../include/CMSIS/ \
	   	-I../include/common/ \
	   	-I../include/msp432/

else
	SOURCES = src/main.c \
		  src/memory.c

	INCLUDES = -I../src \
		-I../include/common/
endif
