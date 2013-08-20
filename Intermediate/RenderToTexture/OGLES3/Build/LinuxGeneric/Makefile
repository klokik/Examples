#
# File			Makefile
# Title			Example makefile
#
# Copyright		Copyright (C) Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../../..
OUTNAME = OGLES3RenderToTexture
APIS    = OGLES3
DEPENDS = PVRSHELL PVRTOOLS

OBJECTS +=	\
           OGLES3RenderToTexture.o	\
           FragShader.o	\
           VertShader.o	\
           RenderToTexture.o	\
           YellowWood.o

include $(SDKDIR)/Builds/Linux/make_example.mak

../../Content/FragShader.cpp ../../Content/VertShader.cpp ../../Content/RenderToTexture.cpp ../../Content/YellowWood.cpp: wrap_content_files 

