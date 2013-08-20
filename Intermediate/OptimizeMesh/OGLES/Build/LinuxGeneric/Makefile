#
# File			Makefile
# Title			Example makefile
#
# Copyright		Copyright (C) Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../../..
OUTNAME = OGLESOptimizeMesh
APIS    = OGLES
DEPENDS = PVRSHELL PVRTOOLS

OBJECTS +=	\
           OGLESOptimizeMesh.o	\
           Satyr.o	\
           SatyrOpt.o

include $(SDKDIR)/Builds/Linux/make_example.mak

../../Content/Satyr.cpp ../../Content/SatyrOpt.cpp: wrap_content_files 

