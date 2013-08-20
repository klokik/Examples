#
# File			Makefile
# Title			Example makefile
#
# Copyright		Copyright (C) Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../../..
OUTNAME = OGLESPVRScopeExample
APIS    = OGLES
DEPENDS = PVRSHELL PVRTOOLS

OBJECTS +=	\
           OGLESPVRScopeExample.o	\
           PVRScopeGraphAPI.o	\
           PVRScopeGraph.o	\
           MaskTex.o	\
           Mask.o

VPATH +=	\
         ../../..

INCLUDES += 	\
         -I../../..	\
         -I$(SDKDIR)/Builds/Include

LINK +=	\
       -L$(SDKDIR)/Builds/Linux/$(PLAT_SUFFIX)/Lib	\
       -lPVRScopeDeveloper	\
       -ldl	\
       -lrt

include $(SDKDIR)/Builds/Linux/make_example.mak

../../Content/MaskTex.cpp ../../Content/Mask.cpp: wrap_content_files 

