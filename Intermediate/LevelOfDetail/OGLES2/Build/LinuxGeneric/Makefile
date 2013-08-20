#
# File			Makefile
# Title			Example makefile
#
# Copyright		Copyright (C) Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../../..
OUTNAME = OGLES2LevelOfDetail
APIS    = OGLES2
DEPENDS = PVRSHELL PVRTOOLS

OBJECTS +=	\
           OGLES2LevelOfDetail.o	\
           FragShader.o	\
           VertShader.o	\
           Mask.o	\
           Reflection.o	\
           NormalMap.o

include $(SDKDIR)/Builds/Linux/make_example.mak

../../Content/FragShader.cpp ../../Content/VertShader.cpp ../../Content/Mask.cpp ../../Content/Reflection.cpp ../../Content/NormalMap.cpp: wrap_content_files 

