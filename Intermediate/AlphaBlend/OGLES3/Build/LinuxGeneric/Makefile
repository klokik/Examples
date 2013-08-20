#
# File			Makefile
# Title			Example makefile
#
# Copyright		Copyright (C) Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../../..
OUTNAME = OGLES3AlphaBlend
APIS    = OGLES3
DEPENDS = PVRSHELL PVRTOOLS

OBJECTS +=	\
           OGLES3AlphaBlend.o	\
           Background.o	\
           Foreground.o	\
           FragShader.o	\
           VertShader.o

include $(SDKDIR)/Builds/Linux/make_example.mak

../../Content/Background.cpp ../../Content/Foreground.cpp ../../Content/FragShader.cpp ../../Content/VertShader.cpp: wrap_content_files 

