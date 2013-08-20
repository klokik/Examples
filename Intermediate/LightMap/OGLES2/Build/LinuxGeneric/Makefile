#
# File			Makefile
# Title			Example makefile
#
# Copyright		Copyright (C) Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../../..
OUTNAME = OGLES2LightMap
APIS    = OGLES2
DEPENDS = PVRSHELL PVRTOOLS

OBJECTS +=	\
           OGLES2LightMap.o	\
           FragShader.o	\
           VertShader.o	\
           Mask.o	\
           Plane.o	\
           Basetex.o	\
           Reflection.o	\
           Shadow.o

include $(SDKDIR)/Builds/Linux/make_example.mak

../../Content/FragShader.cpp ../../Content/VertShader.cpp ../../Content/Mask.cpp ../../Content/Plane.cpp ../../Content/Basetex.cpp ../../Content/Reflection.cpp ../../Content/Shadow.cpp: wrap_content_files 

