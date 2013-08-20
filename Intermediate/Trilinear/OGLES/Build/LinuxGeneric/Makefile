#
# File			Makefile
# Title			Example makefile
#
# Copyright		Copyright (C) Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../../..
OUTNAME = OGLESTrilinear
APIS    = OGLES
DEPENDS = PVRSHELL PVRTOOLS

OBJECTS +=	\
           OGLESTrilinear.o	\
           Back.o	\
           Tape.o	\
           Ball.o	\
           Info.o	\
           o_model.o

include $(SDKDIR)/Builds/Linux/make_example.mak

../../Content/Back.cpp ../../Content/Tape.cpp ../../Content/Ball.cpp ../../Content/Info.cpp ../../Content/o_model.cpp: wrap_content_files 

