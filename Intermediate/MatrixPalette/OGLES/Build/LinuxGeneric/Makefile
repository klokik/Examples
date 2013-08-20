#
# File			Makefile
# Title			Example makefile
#
# Copyright		Copyright (C) Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../../..
OUTNAME = OGLESMatrixPalette
APIS    = OGLES
DEPENDS = PVRSHELL PVRTOOLS

OBJECTS +=	\
           OGLESMatrixPalette.o	\
           model.o	\
           Mallet.o

include $(SDKDIR)/Builds/Linux/make_example.mak

../../Content/model.cpp ../../Content/Mallet.cpp: wrap_content_files 

