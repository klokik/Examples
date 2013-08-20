#
# File			Makefile
# Title			Example makefile
#
# Copyright		Copyright (C) Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../../..
OUTNAME = OGLES3FresnelReflections
APIS    = OGLES3
DEPENDS = PVRSHELL PVRTOOLS

OBJECTS +=	\
           OGLES3FresnelReflections.o	\
           FragShader.o	\
           VertShader.o	\
           Mask.o	\
           Basetex.o	\
           Reflection.o

include $(SDKDIR)/Builds/Linux/make_example.mak

../../Content/FragShader.cpp ../../Content/VertShader.cpp ../../Content/Mask.cpp ../../Content/Basetex.cpp ../../Content/Reflection.cpp: wrap_content_files 

