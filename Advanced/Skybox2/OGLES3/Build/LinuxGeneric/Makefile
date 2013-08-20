#
# File			Makefile
# Title			Example makefile
#
# Copyright		Copyright (C) Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../../..
OUTNAME = OGLES3Skybox2
APIS    = OGLES3
DEPENDS = PVRSHELL PVRTOOLS

OBJECTS +=	\
           OGLES3Skybox2.o	\
           Balloon.o	\
           Balloon_pvr.o	\
           Noise.o	\
           Skybox.o	\
           SkyboxMidnight.o	\
           effects.o	\
           Scene.o

include $(SDKDIR)/Builds/Linux/make_example.mak

../../Content/Balloon.cpp ../../Content/Balloon_pvr.cpp ../../Content/Noise.cpp ../../Content/Skybox.cpp ../../Content/SkyboxMidnight.cpp ../../Content/effects.cpp ../../Content/Scene.cpp: wrap_content_files 

