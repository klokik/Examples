#
# File			Makefile
# Title			Example makefile
#
# Copyright		Copyright (C) Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../../..
OUTNAME = OGLES2IntroducingPFX
APIS    = OGLES2
DEPENDS = PVRSHELL PVRTOOLS

OBJECTS +=	\
           OGLES2IntroducingPFX.o	\
           effect.o	\
           Scene.o	\
           Basetex.o	\
           Reflection.o

include $(SDKDIR)/Builds/Linux/make_example.mak

../../Content/effect.cpp ../../Content/Scene.cpp ../../Content/Basetex.cpp ../../Content/Reflection.cpp: wrap_content_files 

