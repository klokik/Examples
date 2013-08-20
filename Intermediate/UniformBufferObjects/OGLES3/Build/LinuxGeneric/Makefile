#
# File			Makefile
# Title			Example makefile
#
# Copyright		Copyright (C) Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../../..
OUTNAME = OGLES3UniformBufferObjects
APIS    = OGLES3
DEPENDS = PVRSHELL PVRTOOLS

OBJECTS +=	\
           OGLES3UniformBufferObjects.o	\
           effect.o	\
           scene.o	\
           corrodedmetal.o	\
           marble.o

include $(SDKDIR)/Builds/Linux/make_example.mak

../../Content/effect.cpp ../../Content/scene.cpp ../../Content/corrodedmetal.cpp ../../Content/marble.cpp: wrap_content_files 

