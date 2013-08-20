#--------------------------------------------------------------------------
# Name         : content.mak
# Title        : Makefile to build content files
#
# Copyright    : Copyright (C) by Imagination Technologies Limited.
#
# Description  : Makefile to wrap content files for examples in the PowerVR SDK
#
# Platform     :
#
#--------------------------------------------------------------------------

#############################################################################
## Variables
#############################################################################
FILEWRAP 	= ..\..\..\..\Utilities\Filewrap\Windows_x86_32\Filewrap.exe
CONTENTDIR = Content

#############################################################################
## Instructions
#############################################################################

RESOURCES = \
	$(CONTENTDIR)/Alphabet.cpp \
	$(CONTENTDIR)/Road.cpp \
	$(CONTENTDIR)/StreetSigns.cpp \
	$(CONTENTDIR)/AlphaMaskFragShader.cpp \
	$(CONTENTDIR)/AntiAliasedLinesFragShader.cpp \
	$(CONTENTDIR)/AntiAliasedLinesVertShader.cpp \
	$(CONTENTDIR)/FragShader.cpp \
	$(CONTENTDIR)/VertShader.cpp \
	$(CONTENTDIR)/PivotQuadFragShader.cpp \
	$(CONTENTDIR)/PivotQuadMaskedFragShader.cpp \
	$(CONTENTDIR)/PivotQuadVertShader.cpp \
	$(CONTENTDIR)/cameratrack.cpp \
	$(CONTENTDIR)/Landmark_meshes.cpp \
	$(CONTENTDIR)/LandUseA_meshes.cpp \
	$(CONTENTDIR)/LandUseB_meshes.cpp \
	$(CONTENTDIR)/MajHwys_meshes.cpp \
	$(CONTENTDIR)/MajHwyShield_text.cpp \
	$(CONTENTDIR)/RailRds_meshes.cpp \
	$(CONTENTDIR)/SecHwys_meshes.cpp \
	$(CONTENTDIR)/SecHwyShield_text.cpp \
	$(CONTENTDIR)/Signs_billboards.cpp \
	$(CONTENTDIR)/Streets_meshes.cpp \
	$(CONTENTDIR)/Streets_text.cpp \
	$(CONTENTDIR)/WaterPoly_meshes.cpp \
	$(CONTENTDIR)/WaterSeg_meshes.cpp

all: resources
	
help:
	@echo Valid targets are:
	@echo resources, clean
	@echo FILEWRAP can be used to override the default path to the Filewrap utility.

clean:
	@for i in $(RESOURCES); do test -f $$i && rm -vf $$i || true; done

resources: $(RESOURCES)

$(CONTENTDIR):
	-mkdir $@

$(CONTENTDIR)/Alphabet.cpp: $(CONTENTDIR)
	$(FILEWRAP)  -o $@ Alphabet.pvr

$(CONTENTDIR)/Road.cpp: $(CONTENTDIR)
	$(FILEWRAP)  -o $@ Road.pvr

$(CONTENTDIR)/StreetSigns.cpp: $(CONTENTDIR)
	$(FILEWRAP)  -o $@ StreetSigns.pvr

$(CONTENTDIR)/AlphaMaskFragShader.cpp: $(CONTENTDIR)
	$(FILEWRAP)  -s  -o $@ AlphaMaskFragShader.fsh
	-$(FILEWRAP)  -oa $@ AlphaMaskFragShader.fsc

$(CONTENTDIR)/AntiAliasedLinesFragShader.cpp: $(CONTENTDIR)
	$(FILEWRAP)  -s  -o $@ AntiAliasedLinesFragShader.fsh
	-$(FILEWRAP)  -oa $@ AntiAliasedLinesFragShader.fsc

$(CONTENTDIR)/AntiAliasedLinesVertShader.cpp: $(CONTENTDIR)
	$(FILEWRAP)  -s  -o $@ AntiAliasedLinesVertShader.vsh
	-$(FILEWRAP)  -oa $@ AntiAliasedLinesVertShader.vsc

$(CONTENTDIR)/FragShader.cpp: $(CONTENTDIR)
	$(FILEWRAP)  -s  -o $@ FragShader.fsh
	-$(FILEWRAP)  -oa $@ FragShader.fsc

$(CONTENTDIR)/VertShader.cpp: $(CONTENTDIR)
	$(FILEWRAP)  -s  -o $@ VertShader.vsh
	-$(FILEWRAP)  -oa $@ VertShader.vsc

$(CONTENTDIR)/PivotQuadFragShader.cpp: $(CONTENTDIR)
	$(FILEWRAP)  -s  -o $@ PivotQuadFragShader.fsh
	-$(FILEWRAP)  -oa $@ PivotQuadFragShader.fsc

$(CONTENTDIR)/PivotQuadMaskedFragShader.cpp: $(CONTENTDIR)
	$(FILEWRAP)  -s  -o $@ PivotQuadMaskedFragShader.fsh
	-$(FILEWRAP)  -oa $@ PivotQuadMaskedFragShader.fsc

$(CONTENTDIR)/PivotQuadVertShader.cpp: $(CONTENTDIR)
	$(FILEWRAP)  -s  -o $@ PivotQuadVertShader.vsh
	-$(FILEWRAP)  -oa $@ PivotQuadVertShader.vsc

$(CONTENTDIR)/cameratrack.cpp: $(CONTENTDIR)
	$(FILEWRAP)  -o $@ cameratrack.pod

$(CONTENTDIR)/Landmark_meshes.cpp: $(CONTENTDIR)
	$(FILEWRAP)  -o $@ Landmark_meshes.nav

$(CONTENTDIR)/LandUseA_meshes.cpp: $(CONTENTDIR)
	$(FILEWRAP)  -o $@ LandUseA_meshes.nav

$(CONTENTDIR)/LandUseB_meshes.cpp: $(CONTENTDIR)
	$(FILEWRAP)  -o $@ LandUseB_meshes.nav

$(CONTENTDIR)/MajHwys_meshes.cpp: $(CONTENTDIR)
	$(FILEWRAP)  -o $@ MajHwys_meshes.nav

$(CONTENTDIR)/MajHwyShield_text.cpp: $(CONTENTDIR)
	$(FILEWRAP)  -o $@ MajHwyShield_text.nav

$(CONTENTDIR)/RailRds_meshes.cpp: $(CONTENTDIR)
	$(FILEWRAP)  -o $@ RailRds_meshes.nav

$(CONTENTDIR)/SecHwys_meshes.cpp: $(CONTENTDIR)
	$(FILEWRAP)  -o $@ SecHwys_meshes.nav

$(CONTENTDIR)/SecHwyShield_text.cpp: $(CONTENTDIR)
	$(FILEWRAP)  -o $@ SecHwyShield_text.nav

$(CONTENTDIR)/Signs_billboards.cpp: $(CONTENTDIR)
	$(FILEWRAP)  -o $@ Signs_billboards.nav

$(CONTENTDIR)/Streets_meshes.cpp: $(CONTENTDIR)
	$(FILEWRAP)  -o $@ Streets_meshes.nav

$(CONTENTDIR)/Streets_text.cpp: $(CONTENTDIR)
	$(FILEWRAP)  -o $@ Streets_text.nav

$(CONTENTDIR)/WaterPoly_meshes.cpp: $(CONTENTDIR)
	$(FILEWRAP)  -o $@ WaterPoly_meshes.nav

$(CONTENTDIR)/WaterSeg_meshes.cpp: $(CONTENTDIR)
	$(FILEWRAP)  -o $@ WaterSeg_meshes.nav

############################################################################
# End of file (content.mak)
############################################################################
