#
# File			Makefile
# Title			Example makefile
#
# Copyright		Copyright (C) Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../../..
OUTNAME = OGLES3Skinning
APIS    = OGLES3
DEPENDS = PVRSHELL PVRTOOLS

OBJECTS +=	\
           OGLES3Skinning.o	\
           FragShader.o	\
           VertShader.o	\
           man.o	\
           Body.o	\
           Legs.o	\
           Belt.o

include $(SDKDIR)/Builds/Linux/make_example.mak

../../Content/FragShader.cpp ../../Content/VertShader.cpp ../../Content/man.cpp ../../Content/Body.cpp ../../Content/Legs.cpp ../../Content/Belt.cpp: wrap_content_files 

