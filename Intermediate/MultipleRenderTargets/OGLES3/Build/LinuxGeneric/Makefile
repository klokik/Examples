#
# File			Makefile
# Title			Example makefile
#
# Copyright		Copyright (C) Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../../..
OUTNAME = OGLES3MultipleRenderTargets
APIS    = OGLES3
DEPENDS = PVRSHELL PVRTOOLS

OBJECTS +=	\
           OGLES3MultipleRenderTargets.o	\
           texture.o	\
           effect.o	\
           scene.o

include $(SDKDIR)/Builds/Linux/make_example.mak

../../Content/texture.cpp ../../Content/effect.cpp ../../Content/scene.cpp: wrap_content_files 

