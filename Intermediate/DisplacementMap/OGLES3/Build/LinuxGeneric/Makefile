#
# File			Makefile
# Title			Example makefile
#
# Copyright		Copyright (C) Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../../..
OUTNAME = OGLES3DisplacementMap
APIS    = OGLES3
DEPENDS = PVRSHELL PVRTOOLS

OBJECTS +=	\
           OGLES3DisplacementMap.o	\
           FragShader.o	\
           VertShader.o	\
           DisMapScene.o	\
           Cow.o	\
           DisMap.o

include $(SDKDIR)/Builds/Linux/make_example.mak

../../Content/FragShader.cpp ../../Content/VertShader.cpp ../../Content/DisMapScene.cpp ../../Content/Cow.cpp ../../Content/DisMap.cpp: wrap_content_files 

