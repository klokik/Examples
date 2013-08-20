#
# File			Makefile
# Title			Example makefile
#
# Copyright		Copyright (C) Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../../..
OUTNAME = OGLES2ShadowMapping
APIS    = OGLES2
DEPENDS = PVRSHELL PVRTOOLS

OBJECTS +=	\
           OGLES2ShadowMapping.o	\
           FragShader.o	\
           VertShader.o	\
           ShadowFragShader.o	\
           ShadowVertShader.o	\
           Scene.o	\
           Mask.o	\
           TableCover.o	\
           Torus.o

include $(SDKDIR)/Builds/Linux/make_example.mak

../../Content/FragShader.cpp ../../Content/VertShader.cpp ../../Content/ShadowFragShader.cpp ../../Content/ShadowVertShader.cpp ../../Content/Scene.cpp ../../Content/Mask.cpp ../../Content/TableCover.cpp ../../Content/Torus.cpp: wrap_content_files 

