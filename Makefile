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
# Simple makefile for the cortex-M0+ build system
#
# Use: make [TARGET] [OVERRIDES]
#
# Build Targets:
#      <FILE>.o - Builds <FILE>.o object file
#      build - Builds and links all source files
#      all - Same as build
#      clean - removes all generated files
#
# Overrides:
#      CPU - ARM Cortex Architecture (cortex-m0plus, cortex-m4)
#      ARCH - ARM Architecture (arm, thumb)
#      SPECS - Specs file to give the linker (nosys.specs, nano.specs)
#
#
#------------------------------------------------------------------------------
include sources.mk

# Architecture Specific Flags
CPU = cortex-m4
ARCH = armv7-m
SPECS = nosys.specs

# Platform Specific Flags
# PLATFORM = MSP432
PLATFORM = HOST
LINKER_FILE = msp432p401r.lds

# Compile Defines
# CC = arm-none-eabi-gcc
CC = gcc
LD = arm-none-eabi-ld
TARGET = course1
ifeq (CC, gcc)
	LDFLAGS = -Wall
	CFLAGS = -Wextra
else
	LDFLAGS = -Wl,-Map=$(TARGET).map -T $(LINKER_FILE)
	CFLAGS = -mcpu=$(CPU) -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -march=$(ARCH) --specs=$(SPECS) -Wall
endif
OBJS = $(SRCS:.c=.o)

# VPATH = /home/sandesh_achari/Desktop/Courses/ese-coursera-course1/assessments/course1/src/ /home/sandesh_achari/Desktop/Courses/ese-coursera-course1/assessments/course1/include/common/

# %.o : %.c
# 	$(CC) -c $< $(CFLAGS) -o $@

# run: stats.out
# 	./stats.out

# stats.out: stats.o
# 	gcc stats.o -o stats.out

# stats.o: src/stats.c
# 	gcc -c src/stats.c -o stats.o -I$(INCLUDES) -I$(INCLUDES1)
# gcc -c stats.c -o statc.o 

.PHONY: run
run: clean course1.out

course1.out: course1.o main.o stats.o memory.o data.o
	@echo ""
	@echo "Linking"
# $(CC) -o course1.out stats.o course1.o memory.o data.o main.o $(CFLAGS) $(LDFLAGS)
	$(CC) -o course1.out stats.o course1.o memory.o data.o main.o

main.o: src/main.c 
	@echo ""
	@echo "Compiling main.c"
	$(CC) -D$(PLATFORM) -DCOURSE1 -c src/main.c -o main.o -I$(INCLUDES) -I$(INCLUDES1) -I$(INCLUDES2) -I$(INCLUDES3)

stats.o: src/stats.c 
	@echo ""
	@echo "Compiling stats.c"
	$(CC) -D$(PLATFORM) -c src/stats.c -o stats.o -I$(INCLUDES) -I$(INCLUDES1) -I$(INCLUDES2) -I$(INCLUDES3)

memory.o: src/memory.c 
	@echo ""
	@echo "Compiling memory.c"
	$(CC) -D$(PLATFORM) -c src/memory.c -o memory.o -I$(INCLUDES) -I$(INCLUDES1) -I$(INCLUDES2) -I$(INCLUDES3)

data.o: src/data.c 
	@echo ""
	@echo "Compiling data.c"
	$(CC) -D$(PLATFORM) -c src/data.c -o data.o -I$(INCLUDES) -I$(INCLUDES1) -I$(INCLUDES2) -I$(INCLUDES3)		

course1.o: src/course1.c
	@echo ""
	@echo "Compiling course1.c"
	$(CC) -D$(PLATFORM) -c src/course1.c -o course1.o -I$(INCLUDES) -I$(INCLUDES1) -I$(INCLUDES2) -I$(INCLUDES3)

# .PHONY: build
# build: all

# .PHONY: all
# all: $(TARGET).out

# $(TARGET).out: $(OBJS)
# 	$(CC) $(OBJS) $(CFLAGS) $(LDFLAGS) -o $@

.PHONY: clean
clean:
	rm -f *.o *.out *.map
# rm -f $(OBJS) $(TARGET).out $(TARGET).map


