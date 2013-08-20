#
# File			Makefile
# Title			Example makefile
#
# Copyright		Copyright (C) Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../../..
OUTNAME = OGLES3PhantomMask
APIS    = OGLES3
DEPENDS = PVRSHELL PVRTOOLS

OBJECTS +=	\
           OGLES3PhantomMask.o	\
           MaskMain.o	\
           RoomStill.o	\
           FragShader.o	\
           SHVertShader.o	\
           DiffuseVertShader.o	\
           PhantomMask.o

include $(SDKDIR)/Builds/Linux/make_example.mak

../../Content/MaskMain.cpp ../../Content/RoomStill.cpp ../../Content/FragShader.cpp ../../Content/SHVertShader.cpp ../../Content/DiffuseVertShader.cpp ../../Content/PhantomMask.cpp: wrap_content_files 

