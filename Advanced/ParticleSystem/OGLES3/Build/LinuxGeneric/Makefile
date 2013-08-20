#
# File			Makefile
# Title			Example makefile
#
# Copyright		Copyright (C) Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../../..
OUTNAME = OGLES3ParticleSystem
APIS    = OGLES3
DEPENDS = PVRSHELL PVRTOOLS

OBJECTS +=	\
           OGLES3ParticleSystem.o	\
           ParticleSystemCPU.o	\
           sphere.o	\
           ParticleGradient.o	\
           FragShader.o	\
           VertShader.o	\
           ParticleFragShader.o	\
           ParticleVertShader.o

INCLUDES += 	\
         -I../..

include $(SDKDIR)/Builds/Linux/make_example.mak

../../Content/sphere.cpp ../../Content/ParticleGradient.cpp ../../Content/FragShader.cpp ../../Content/VertShader.cpp ../../Content/ParticleFragShader.cpp ../../Content/ParticleVertShader.cpp: wrap_content_files 

