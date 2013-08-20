#
# File			Makefile
# Title			Example makefile
#
# Copyright		Copyright (C) Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../../..
OUTNAME = OGLESLighting
APIS    = OGLES
DEPENDS = PVRSHELL PVRTOOLS

OBJECTS +=	\
           OGLESLighting.o	\
           LightTex.o	\
           Stone.o	\
           LightingScene.o

include $(SDKDIR)/Builds/Linux/make_example.mak

../../Content/LightTex.cpp ../../Content/Stone.cpp ../../Content/LightingScene.cpp: wrap_content_files 

