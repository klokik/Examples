#
# File			Makefile
# Title			Example makefile
#
# Copyright		Copyright (C) Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../../..
OUTNAME = OGLESUserClipPlanes
APIS    = OGLES
DEPENDS = PVRSHELL PVRTOOLS

OBJECTS +=	\
           OGLESUserClipPlanes.o	\
           Granite.o	\
           Mesh.o

include $(SDKDIR)/Builds/Linux/make_example.mak

../../Content/Granite.cpp ../../Content/Mesh.cpp: wrap_content_files 

