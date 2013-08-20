#
# File			Makefile
# Title			Example makefile
#
# Copyright		Copyright (C) Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../../..
OUTNAME = OGLESIntroducingPVRTools
APIS    = OGLES
DEPENDS = PVRSHELL PVRTOOLS

OBJECTS +=	\
           OGLESIntroducingPVRTools.o	\
           Image.o

include $(SDKDIR)/Builds/Linux/make_example.mak

../../Content/Image.cpp: wrap_content_files 

