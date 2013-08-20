#
# File			Makefile
# Title			Example makefile
#
# Copyright		Copyright (C) Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../../..
OUTNAME = OGLES2MaximumIntensityProjection
APIS    = OGLES2
DEPENDS = PVRSHELL PVRTOOLS

OBJECTS +=	\
           OGLES2MaximumIntensityProjection.o	\
           effect.o	\
           blend_minmax_scene.o	\
           skinTex.o

include $(SDKDIR)/Builds/Linux/make_example.mak

../../Content/effect.cpp ../../Content/blend_minmax_scene.cpp ../../Content/skinTex.cpp: wrap_content_files 

