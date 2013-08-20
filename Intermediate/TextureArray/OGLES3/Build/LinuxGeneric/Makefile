#
# File			Makefile
# Title			Example makefile
#
# Copyright		Copyright (C) Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../../..
OUTNAME = OGLES3TextureArray
APIS    = OGLES3
DEPENDS = PVRSHELL PVRTOOLS

OBJECTS +=	\
           OGLES3TextureArray.o	\
           textureArray.o	\
           effect.o

include $(SDKDIR)/Builds/Linux/make_example.mak

../../Content/textureArray.cpp ../../Content/effect.cpp: wrap_content_files 

