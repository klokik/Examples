#
# File			Makefile
# Title			Example makefile
#
# Copyright		Copyright (C) Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../../..
OUTNAME = OGLES2IntroducingPOD
APIS    = OGLES2
DEPENDS = PVRSHELL PVRTOOLS

OBJECTS +=	\
           OGLES2IntroducingPOD.o	\
           FragShader.o	\
           VertShader.o	\
           Scene.o	\
           tex_base.o	\
           tex_arm.o

include $(SDKDIR)/Builds/Linux/make_example.mak

../../Content/FragShader.cpp ../../Content/VertShader.cpp ../../Content/Scene.cpp ../../Content/tex_base.cpp ../../Content/tex_arm.cpp: wrap_content_files 

