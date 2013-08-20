#
# File			Makefile
# Title			Example makefile
#
# Copyright		Copyright (C) Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../../..
OUTNAME = OGLES2Water
APIS    = OGLES2
DEPENDS = PVRSHELL PVRTOOLS

OBJECTS +=	\
           OGLES2Water.o	\
           NewNormalMap.o	\
           Mountain.o	\
           wood.o	\
           sail.o	\
           MountainFloor.o	\
           FragShader.o	\
           VertShader.o	\
           SkyboxFShader.o	\
           SkyboxVShader.o	\
           ModelFShader.o	\
           ModelVShader.o	\
           Tex2DFShader.o	\
           Tex2DVShader.o	\
           PlaneTexFShader.o	\
           PlaneTexVShader.o	\
           Scene.o

include $(SDKDIR)/Builds/Linux/make_example.mak

../../Content/NewNormalMap.cpp ../../Content/Mountain.cpp ../../Content/wood.cpp ../../Content/sail.cpp ../../Content/MountainFloor.cpp ../../Content/FragShader.cpp ../../Content/VertShader.cpp ../../Content/SkyboxFShader.cpp ../../Content/SkyboxVShader.cpp ../../Content/ModelFShader.cpp ../../Content/ModelVShader.cpp ../../Content/Tex2DFShader.cpp ../../Content/Tex2DVShader.cpp ../../Content/PlaneTexFShader.cpp ../../Content/PlaneTexVShader.cpp ../../Content/Scene.cpp: wrap_content_files 

