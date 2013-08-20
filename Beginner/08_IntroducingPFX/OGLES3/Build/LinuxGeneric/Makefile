#
# File			Makefile
# Title			Example makefile
#
# Copyright		Copyright (C) Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../../..
OUTNAME = OGLES3IntroducingPFX
APIS    = OGLES3
DEPENDS = PVRSHELL PVRTOOLS

OBJECTS +=	\
           OGLES3IntroducingPFX.o	\
           effect.o	\
           Scene.o	\
           Basetex.o	\
           Reflection.o

include $(SDKDIR)/Builds/Linux/make_example.mak

../../Content/effect.cpp ../../Content/Scene.cpp ../../Content/Basetex.cpp ../../Content/Reflection.cpp: wrap_content_files 

