#
# File			Makefile
# Title			Example makefile
#
# Copyright		Copyright (C) Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../../..
OUTNAME = OGLES2ToneMapping
APIS    = OGLES2
DEPENDS = PVRSHELL PVRTOOLS

OBJECTS +=	\
           OGLES2ToneMapping.o	\
           effects.o	\
           hdrscene.o

include $(SDKDIR)/Builds/Linux/make_example.mak

../../Content/effects.cpp ../../Content/hdrscene.cpp: wrap_content_files 

