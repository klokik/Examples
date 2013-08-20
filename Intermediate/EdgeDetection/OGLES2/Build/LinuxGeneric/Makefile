#
# File			Makefile
# Title			Example makefile
#
# Copyright		Copyright (C) Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../../..
OUTNAME = OGLES2EdgeDetection
APIS    = OGLES2
DEPENDS = PVRSHELL PVRTOOLS

OBJECTS +=	\
           OGLES2EdgeDetection.o	\
           PreFragShader.o	\
           PreVertShader.o	\
           PostFragShader.o	\
           PostVertShader.o	\
           SketchObject.o

include $(SDKDIR)/Builds/Linux/make_example.mak

../../Content/PreFragShader.cpp ../../Content/PreVertShader.cpp ../../Content/PostFragShader.cpp ../../Content/PostVertShader.cpp ../../Content/SketchObject.cpp: wrap_content_files 

