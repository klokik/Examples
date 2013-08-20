#
# File			Makefile
# Title			Example makefile
#
# Copyright		Copyright (C) Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../../..
OUTNAME = OGLES2DeferredShading
APIS    = OGLES2
DEPENDS = PVRSHELL PVRTOOLS

OBJECTS +=	\
           OGLES2DeferredShading.o	\
           effect.o	\
           scene.o	\
           pointlight.o	\
           light_cubemap.o	\
           mask_texture.o	\
           mask_bump.o

include $(SDKDIR)/Builds/Linux/make_example.mak

../../Content/effect.cpp ../../Content/scene.cpp ../../Content/pointlight.cpp ../../Content/light_cubemap.cpp ../../Content/mask_texture.cpp ../../Content/mask_bump.cpp: wrap_content_files 

