#
# File			Makefile
# Title			Example makefile
#
# Copyright		Copyright (C) Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../../..
OUTNAME = OGLESFiveSpheres
APIS    = OGLES
DEPENDS = PVRSHELL PVRTOOLS

OBJECTS +=	\
           OGLESFiveSpheres.o	\
           Grass.o

include $(SDKDIR)/Builds/Linux/make_example.mak

../../Content/Grass.cpp: wrap_content_files 

