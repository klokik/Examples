#
# File			Makefile
# Title			Example makefile
#
# Copyright		Copyright (C) Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../../..
OUTNAME = OGLESAntialiasedLines
APIS    = OGLES
DEPENDS = PVRSHELL PVRTOOLS

OBJECTS +=	\
           OGLESAntialiasedLines.o	\
           LineRound.o

include $(SDKDIR)/Builds/Linux/make_example.mak

../../Content/LineRound.cpp: wrap_content_files 

