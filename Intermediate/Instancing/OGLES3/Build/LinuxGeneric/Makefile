#
# File			Makefile
# Title			Example makefile
#
# Copyright		Copyright (C) Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../../..
OUTNAME = OGLES3Instancing
APIS    = OGLES3
DEPENDS = PVRSHELL PVRTOOLS

OBJECTS +=	\
           OGLES3Instancing.o	\
           effect.o	\
           scene.o

include $(SDKDIR)/Builds/Linux/make_example.mak

../../Content/effect.cpp ../../Content/scene.cpp: wrap_content_files 

