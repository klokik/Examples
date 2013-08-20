#
# File			Makefile
# Title			Example makefile
#
# Copyright		Copyright (C) Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../../..
OUTNAME = OGLES3ShadowMapping
APIS    = OGLES3
DEPENDS = PVRSHELL PVRTOOLS

OBJECTS +=	\
           OGLES3ShadowMapping.o	\
           effect.o	\
           Scene.o	\
           Mask.o	\
           TableCover.o	\
           Torus.o

include $(SDKDIR)/Builds/Linux/make_example.mak

../../Content/effect.cpp ../../Content/Scene.cpp ../../Content/Mask.cpp ../../Content/TableCover.cpp ../../Content/Torus.cpp: wrap_content_files 

