#
# File			Makefile
# Title			Example makefile
#
# Copyright		Copyright (C) Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../../..
OUTNAME = OGLESShadowTechniques
APIS    = OGLES
DEPENDS = PVRSHELL PVRTOOLS

OBJECTS +=	\
           OGLESShadowTechniques.o	\
           Blob.o	\
           TableCover.o	\
           Kettle.o	\
           Scene.o

include $(SDKDIR)/Builds/Linux/make_example.mak

../../Content/Blob.cpp ../../Content/TableCover.cpp ../../Content/Kettle.cpp ../../Content/Scene.cpp: wrap_content_files 

