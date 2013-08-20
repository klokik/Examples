#
# File			Makefile
# Title			Example makefile
#
# Copyright		Copyright (C) Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../../..
OUTNAME = OGLESRenderToTexture
APIS    = OGLES
DEPENDS = PVRSHELL PVRTOOLS

OBJECTS +=	\
           OGLESRenderToTexture.o	\
           RenderToTexture.o	\
           YellowWood.o

include $(SDKDIR)/Builds/Linux/make_example.mak

../../Content/RenderToTexture.cpp ../../Content/YellowWood.cpp: wrap_content_files 

