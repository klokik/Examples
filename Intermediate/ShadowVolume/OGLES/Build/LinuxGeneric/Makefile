#
# File			Makefile
# Title			Example makefile
#
# Copyright		Copyright (C) Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../../..
OUTNAME = OGLESShadowVolume
APIS    = OGLES
DEPENDS = PVRSHELL PVRTOOLS

OBJECTS +=	\
           OGLESShadowVolume.o	\
           scene.o	\
           Background.o	\
           Rust.o

include $(SDKDIR)/Builds/Linux/make_example.mak

../../Content/scene.cpp ../../Content/Background.cpp ../../Content/Rust.cpp: wrap_content_files 

