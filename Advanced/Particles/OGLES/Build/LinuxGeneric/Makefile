#
# File			Makefile
# Title			Example makefile
#
# Copyright		Copyright (C) Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../../..
OUTNAME = OGLESParticles
APIS    = OGLES
DEPENDS = PVRSHELL PVRTOOLS

OBJECTS +=	\
           OGLESParticles.o	\
           LightTex.o	\
           FloorTex8.o

INCLUDES += 	\
         -I../..

include $(SDKDIR)/Builds/Linux/make_example.mak

../../Content/LightTex.cpp ../../Content/FloorTex8.cpp: wrap_content_files 

