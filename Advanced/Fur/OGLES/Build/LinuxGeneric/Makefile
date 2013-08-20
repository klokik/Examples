#
# File			Makefile
# Title			Example makefile
#
# Copyright		Copyright (C) Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../../..
OUTNAME = OGLESFur
APIS    = OGLES
DEPENDS = PVRSHELL PVRTOOLS

OBJECTS +=	\
           OGLESFur.o	\
           tBridge.o	\
           tGrass.o	\
           tSkin.o	\
           tWater.o	\
           tCloud.o	\
           tFur.o	\
           Scene.o

include $(SDKDIR)/Builds/Linux/make_example.mak

../../Content/tBridge.cpp ../../Content/tGrass.cpp ../../Content/tSkin.cpp ../../Content/tWater.cpp ../../Content/tCloud.cpp ../../Content/tFur.cpp ../../Content/Scene.cpp: wrap_content_files 

