#
# File			Makefile
# Title			Example makefile
#
# Copyright		Copyright (C) Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../../..
OUTNAME = OGLES3AlphaTest
APIS    = OGLES3
DEPENDS = PVRSHELL PVRTOOLS

OBJECTS +=	\
           OGLES3AlphaTest.o	\
           TexFragShader.o	\
           DiscardFragShader.o	\
           VertShader.o	\
           Wallwire.o

include $(SDKDIR)/Builds/Linux/make_example.mak

../../Content/TexFragShader.cpp ../../Content/DiscardFragShader.cpp ../../Content/VertShader.cpp ../../Content/Wallwire.cpp: wrap_content_files 

