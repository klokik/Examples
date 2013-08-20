#
# File			Makefile
# Title			Example makefile
#
# Copyright		Copyright (C) Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../../..
OUTNAME = OGLESMultitexture
APIS    = OGLES
DEPENDS = PVRSHELL PVRTOOLS

OBJECTS +=	\
           OGLESMultitexture.o	\
           Crate.o	\
           stamp.o	\
           stampnm.o

include $(SDKDIR)/Builds/Linux/make_example.mak

../../Content/Crate.cpp ../../Content/stamp.cpp ../../Content/stampnm.cpp: wrap_content_files 

