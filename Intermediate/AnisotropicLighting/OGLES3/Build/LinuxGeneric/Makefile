#
# File			Makefile
# Title			Example makefile
#
# Copyright		Copyright (C) Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../../..
OUTNAME = OGLES3AnisotropicLighting
APIS    = OGLES3
DEPENDS = PVRSHELL PVRTOOLS

OBJECTS +=	\
           OGLES3AnisotropicLighting.o	\
           FastFragShader.o	\
           FastVertShader.o	\
           SlowFragShader.o	\
           SlowVertShader.o	\
           Mask.o	\
           Basetex.o

include $(SDKDIR)/Builds/Linux/make_example.mak

../../Content/FastFragShader.cpp ../../Content/FastVertShader.cpp ../../Content/SlowFragShader.cpp ../../Content/SlowVertShader.cpp ../../Content/Mask.cpp ../../Content/Basetex.cpp: wrap_content_files 

