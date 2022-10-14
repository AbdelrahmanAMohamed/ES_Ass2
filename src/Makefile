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

#------------------------------------------------------------------------------
# <Put a Description Here>
#
# Use: make [TARGET] [PLATFORM-OVERRIDES]
#
# Build Targets:
#      <Put a description of the supported targets here>
#
# Platform Overrides:
#      <Put a description of the supported Overrides here
#
#------------------------------------------------------------------------------
include sources.mk

# Platform Overrides
PLATFORM = 
TARGET = c1m2
# Architectures Specific Flags
ifeq ($(PLATFORM),MSP432)
	LINKER_FILE =  ../msp432p401r.lds
	CPU = cortex-m4
	ARCH = armv7e-m
	SPECS = nosys.specs

# Compiler Flags and Defines
	CC = arm-none-eabi-gcc
	LD = arm-none-eabi-ld
	LDFLAGS = -Wl,-Map=$(TARGET).map -T $(LINKER_FILE)
	CFLAGS = -mcpu=$(CPU) -march=$(ARCH) -mfloat-abi=hard -mfpu=fpv4-sp-d16 -mthumb --specs=$(SPECS) -Wall -Werror -g -O0 -std=c99
	CPPFLAGs = -DMSP432 $(INCLUDES) #-M -MF test.d
	PFT = -DMSP432
endif

ifeq ($(PLATFORM),HOST)
	#LINKER_FILE = msp432p401r.lds
	CPU = x86_64
	ARCH = $(shell arch)
	#SPECS = nosys.specs

# Compiler Flags and Defines
	CC = gcc
	#LD = arm-none-eabi-ld
	LDFLAGS = -Wl,-Map=$(TARGET).map
	CFLAGS =  -Wall -Werror -g -O0 -std=c99
	CPPFLAGs = -DHOST $(INCLUDES) #-M -MF test.d
	PTF = -DHOST
endif

OBJS = $(SOURCES:.c=.o)
ASMS = $(SOURCES:.c=.asm)
PPS = $(SOURCES:.c=.i)
DEPS = $(SOURCES:.c=.d)
MAPS:= $(SOURCES:.c=.map)
OUTS:= $(SOURCES:.c=.out)


%.i: %.c
	$(CC) -E $< $(CFLAGS) $(CPPFLAGS) -o $@

%.asm: %.c
	$(CC) -S $< $(CFLAGS) $(CPPFLAGS) -o $@

%.o: %.c
	$(CC) -c $< $(CFLAGS) $(CPPFLAGS) -o $@

%.d: %.c
	$(CC) -E -M $<  $(CPPFLAGS) -o $@

.PHONY: compile-all
compile-all: $(OBJS)  

.PHONY: build
build: $(TARGET).out


$(TARGET).out: $(OBJS)
	$(CC) $(OBJS) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -o $@
	$(SIZE) $@

 
.PHONY: clean
clean:
	rm -f *.i *.out *.map *.d *.s *.o *.asm
