#
# File			Makefile
# Title			Example makefile
#
# Copyright		Copyright (C) Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../../..
OUTNAME = OGLES2ShadowVolume
APIS    = OGLES2
DEPENDS = PVRSHELL PVRTOOLS

OBJECTS +=	\
           OGLES2ShadowVolume.o	\
           BaseFragShader.o	\
           BaseVertShader.o	\
           ConstFragShader.o	\
           ShadowVolVertShader.o	\
           FullscreenVertShader.o	\
           scene.o	\
           Background.o	\
           Rust.o

include $(SDKDIR)/Builds/Linux/make_example.mak

../../Content/BaseFragShader.cpp ../../Content/BaseVertShader.cpp ../../Content/ConstFragShader.cpp ../../Content/ShadowVolVertShader.cpp ../../Content/FullscreenVertShader.cpp ../../Content/scene.cpp ../../Content/Background.cpp ../../Content/Rust.cpp: wrap_content_files 

