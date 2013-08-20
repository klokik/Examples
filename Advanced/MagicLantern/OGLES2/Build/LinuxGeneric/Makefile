#
# File			Makefile
# Title			Example makefile
#
# Copyright		Copyright (C) Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../../..
OUTNAME = OGLES2MagicLantern
APIS    = OGLES2
DEPENDS = PVRSHELL PVRTOOLS

OBJECTS +=	\
           OGLES2MagicLantern.o	\
           Marble.o	\
           Floor.o	\
           LanternCubemap.o	\
           MagicLanternShaders.o	\
           MagicLantern.o

include $(SDKDIR)/Builds/Linux/make_example.mak

../../Content/Marble.cpp ../../Content/Floor.cpp ../../Content/LanternCubemap.cpp ../../Content/MagicLanternShaders.cpp ../../Content/MagicLantern.cpp: wrap_content_files 

