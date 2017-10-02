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

# Add your Source files to this variable
SOURCES = /home/sandesh_achari/Desktop/Courses/ese-coursera-course1/assessments/course1/src/main.c \
	/home/sandesh_achari/Desktop/Courses/ese-coursera-course1/assessments/course1/src/stats.c \
	/home/sandesh_achari/Desktop/Courses/ese-coursera-course1/assessments/course1/src/course1.c \
	/home/sandesh_achari/Desktop/Courses/ese-coursera-course1/assessments/course1/src/memory.c \
	/home/sandesh_achari/Desktop/Courses/ese-coursera-course1/assessments/course1/src/data.c

# Add your include paths to this variable
INCLUDES = /home/sandesh_achari/Desktop/Courses/ese-coursera-course1/assessments/course1/src/
INCLUDES1 = /home/sandesh_achari/Desktop/Courses/ese-coursera-course1/assessments/course1/include/common/
INCLUDES2 = /home/sandesh_achari/Desktop/Courses/ese-coursera-course1/assessments/course1/include/msp432/
INCLUDES3 = /home/sandesh_achari/Desktop/Courses/ese-coursera-course1/assessments/course1/include/CMSIS/

# project_folder
# 	|
# 	--------------	src
# 	|				|
# 	|				-------- stats.c
# 	|-------------	include
# 					|
# 					-------- stats.h



# $ gcc -c stats.c -Isrc/ -Iinclude/
# gcc: error: stats.c: No such file or directory


# final: $(OBJDIR)/main.o $(OBJDIR)/TchClaKnn_BuildKdtreeInt.o $(OBJDIR)/TchClaKnn_FreeKdtreeInt.o.... (Go upto 30 files like this)
#     @echo ".Linking"
#     $(CC) $(LFLAGS) -o $(OBJDIR)/main.o $(OBJDIR)/TchClaKnn_BuildKdtreeInt.o $(OBJDIR)/TchClaKnn_FreeKdtreeInt.o..... (Go upto 30 files like this)

#     edit your link line to : -o final $(OBJDIR)/main.o