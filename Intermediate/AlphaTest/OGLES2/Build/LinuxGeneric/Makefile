#
# File			Makefile
# Title			Example makefile
#
# Copyright		Copyright (C) Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../../..
OUTNAME = OGLES2AlphaTest
APIS    = OGLES2
DEPENDS = PVRSHELL PVRTOOLS

OBJECTS +=	\
           OGLES2AlphaTest.o	\
           TexFragShader.o	\
           DiscardFragShader.o	\
           VertShader.o	\
           Wallwire.o

include $(SDKDIR)/Builds/Linux/make_example.mak

../../Content/TexFragShader.cpp ../../Content/DiscardFragShader.cpp ../../Content/VertShader.cpp ../../Content/Wallwire.cpp: wrap_content_files 

