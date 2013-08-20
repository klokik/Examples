#
# File			Makefile
# Title			Example makefile
#
# Copyright		Copyright (C) Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../../..
OUTNAME = OGLESAlphaBlend
APIS    = OGLES
DEPENDS = PVRSHELL PVRTOOLS

OBJECTS +=	\
           OGLESAlphaBlend.o	\
           Background.o	\
           Foreground.o

include $(SDKDIR)/Builds/Linux/make_example.mak

../../Content/Background.cpp ../../Content/Foreground.cpp: wrap_content_files 

