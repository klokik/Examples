#
# File			Makefile
# Title			Example makefile
#
# Copyright		Copyright (C) Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../../..
OUTNAME = OGLESIntroducingPOD
APIS    = OGLES
DEPENDS = PVRSHELL PVRTOOLS

OBJECTS +=	\
           OGLESIntroducingPOD.o	\
           IntroducingPOD.o	\
           tex_base.o	\
           tex_arm.o

include $(SDKDIR)/Builds/Linux/make_example.mak

../../Content/IntroducingPOD.cpp ../../Content/tex_base.cpp ../../Content/tex_arm.cpp: wrap_content_files 

