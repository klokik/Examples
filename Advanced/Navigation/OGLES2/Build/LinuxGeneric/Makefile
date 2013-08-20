#
# File			Makefile
# Title			Example makefile
#
# Copyright		Copyright (C) Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../../..
OUTNAME = OGLES2Navigation
APIS    = OGLES2
DEPENDS = PVRSHELL PVRTOOLS

OBJECTS +=	\
           OGLES2Navigation.o	\
           Alphabet.o	\
           Road.o	\
           StreetSigns.o	\
           AlphaMaskFragShader.o	\
           AntiAliasedLinesFragShader.o	\
           AntiAliasedLinesVertShader.o	\
           FragShader.o	\
           VertShader.o	\
           PivotQuadFragShader.o	\
           PivotQuadMaskedFragShader.o	\
           PivotQuadVertShader.o	\
           cameratrack.o	\
           Landmark_meshes.o	\
           LandUseA_meshes.o	\
           LandUseB_meshes.o	\
           MajHwys_meshes.o	\
           MajHwyShield_text.o	\
           RailRds_meshes.o	\
           SecHwys_meshes.o	\
           SecHwyShield_text.o	\
           Signs_billboards.o	\
           Streets_meshes.o	\
           Streets_text.o	\
           WaterPoly_meshes.o	\
           WaterSeg_meshes.o

include $(SDKDIR)/Builds/Linux/make_example.mak

../../Content/Alphabet.cpp ../../Content/Road.cpp ../../Content/StreetSigns.cpp ../../Content/AlphaMaskFragShader.cpp ../../Content/AntiAliasedLinesFragShader.cpp ../../Content/AntiAliasedLinesVertShader.cpp ../../Content/FragShader.cpp ../../Content/VertShader.cpp ../../Content/PivotQuadFragShader.cpp ../../Content/PivotQuadMaskedFragShader.cpp ../../Content/PivotQuadVertShader.cpp ../../Content/cameratrack.cpp ../../Content/Landmark_meshes.cpp ../../Content/LandUseA_meshes.cpp ../../Content/LandUseB_meshes.cpp ../../Content/MajHwys_meshes.cpp ../../Content/MajHwyShield_text.cpp ../../Content/RailRds_meshes.cpp ../../Content/SecHwys_meshes.cpp ../../Content/SecHwyShield_text.cpp ../../Content/Signs_billboards.cpp ../../Content/Streets_meshes.cpp ../../Content/Streets_text.cpp ../../Content/WaterPoly_meshes.cpp ../../Content/WaterSeg_meshes.cpp: wrap_content_files 

