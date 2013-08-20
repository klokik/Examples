#
# File			Makefile
# Title			Example makefile
#
# Copyright		Copyright (C) Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../../..
OUTNAME = OGLESVase
APIS    = OGLES
DEPENDS = PVRSHELL PVRTOOLS

OBJECTS +=	\
           OGLESVase.o	\
           Flora.o	\
           Backgrnd.o	\
           Reflection.o	\
           Vase.o

include $(SDKDIR)/Builds/Linux/make_example.mak

../../Content/Flora.cpp ../../Content/Backgrnd.cpp ../../Content/Reflection.cpp ../../Content/Vase.cpp: wrap_content_files 

