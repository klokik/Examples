#
# File			Makefile
# Title			Example makefile
#
# Copyright		Copyright (C) Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../../..
OUTNAME = OGLESPolyBump
APIS    = OGLES
DEPENDS = PVRSHELL PVRTOOLS

OBJECTS +=	\
           OGLESPolyBump.o	\
           Head_clonespacePVRTC.o	\
           Head_clonespaceBGRA.o	\
           Head_diffuse.o	\
           Head.o

include $(SDKDIR)/Builds/Linux/make_example.mak

../../Content/Head_clonespacePVRTC.cpp ../../Content/Head_clonespaceBGRA.cpp ../../Content/Head_diffuse.cpp ../../Content/Head.cpp: wrap_content_files 

