#
# File			Makefile
# Title			Example makefile
#
# Copyright		Copyright (C) Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../../..
OUTNAME = OGLES3CubeShadowMapping
APIS    = OGLES3
DEPENDS = PVRSHELL PVRTOOLS

OBJECTS +=	\
           OGLES3CubeShadowMapping.o	\
           scene.o	\
           effect.o	\
           wall_left.o	\
           wall_right.o	\
           wall_top.o	\
           wall_bottom.o	\
           wall_back.o	\
           mask.o

include $(SDKDIR)/Builds/Linux/make_example.mak

../../Content/scene.cpp ../../Content/effect.cpp ../../Content/wall_left.cpp ../../Content/wall_right.cpp ../../Content/wall_top.cpp ../../Content/wall_bottom.cpp ../../Content/wall_back.cpp ../../Content/mask.cpp: wrap_content_files 

