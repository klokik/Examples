#
# File			Makefile
# Title			Example makefile
#
# Copyright		Copyright (C) Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../../..
OUTNAME = OGLESSkinning
APIS    = OGLES
DEPENDS = PVRSHELL PVRTOOLS

OBJECTS +=	\
           OGLESSkinning.o	\
           man.o	\
           Legs.o	\
           Body.o	\
           Belt.o

include $(SDKDIR)/Builds/Linux/make_example.mak

../../Content/man.cpp ../../Content/Legs.cpp ../../Content/Body.cpp ../../Content/Belt.cpp: wrap_content_files 

