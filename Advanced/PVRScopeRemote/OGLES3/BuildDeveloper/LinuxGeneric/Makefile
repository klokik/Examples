#
# File			Makefile
# Title			Example makefile
#
# Copyright		Copyright (C) Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../../..
OUTNAME = OGLES3PVRScopeRemote
APIS    = OGLES3
DEPENDS = PVRSHELL PVRTOOLS

OBJECTS +=	\
           OGLES3PVRScopeRemote.o	\
           Reflection.o	\
           Thickness.o	\
           FragShader.o	\
           VertShader.o	\
           Mask.o

INCLUDES += 	\
         -I$(SDKDIR)/Builds/Include

LINK +=	\
       -L$(SDKDIR)/Builds/Linux/$(PLAT_SUFFIX)/Lib	\
       -lPVRScopeDeveloper	\
       -ldl	\
       -lrt

include $(SDKDIR)/Builds/Linux/make_example.mak

../../Content/Reflection.cpp ../../Content/Thickness.cpp ../../Content/FragShader.cpp ../../Content/VertShader.cpp ../../Content/Mask.cpp: wrap_content_files 

