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
	$(CONTENTDIR)/NewNormalMap.cpp \
	$(CONTENTDIR)/Mountain.cpp \
	$(CONTENTDIR)/wood.cpp \
	$(CONTENTDIR)/sail.cpp \
	$(CONTENTDIR)/MountainFloor.cpp \
	$(CONTENTDIR)/FragShader.cpp \
	$(CONTENTDIR)/VertShader.cpp \
	$(CONTENTDIR)/SkyboxFShader.cpp \
	$(CONTENTDIR)/SkyboxVShader.cpp \
	$(CONTENTDIR)/ModelFShader.cpp \
	$(CONTENTDIR)/ModelVShader.cpp \
	$(CONTENTDIR)/Tex2DFShader.cpp \
	$(CONTENTDIR)/Tex2DVShader.cpp \
	$(CONTENTDIR)/PlaneTexFShader.cpp \
	$(CONTENTDIR)/PlaneTexVShader.cpp \
	$(CONTENTDIR)/Scene.cpp

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

$(CONTENTDIR)/NewNormalMap.cpp: $(CONTENTDIR)
	$(FILEWRAP)  -o $@ NewNormalMap.pvr

$(CONTENTDIR)/Mountain.cpp: $(CONTENTDIR)
	$(FILEWRAP)  -o $@ Mountain.pvr

$(CONTENTDIR)/wood.cpp: $(CONTENTDIR)
	$(FILEWRAP)  -o $@ wood.pvr

$(CONTENTDIR)/sail.cpp: $(CONTENTDIR)
	$(FILEWRAP)  -o $@ sail.pvr

$(CONTENTDIR)/MountainFloor.cpp: $(CONTENTDIR)
	$(FILEWRAP)  -o $@ MountainFloor.pvr

$(CONTENTDIR)/FragShader.cpp: $(CONTENTDIR)
	$(FILEWRAP)  -s  -o $@ FragShader.fsh

$(CONTENTDIR)/VertShader.cpp: $(CONTENTDIR)
	$(FILEWRAP)  -s  -o $@ VertShader.vsh

$(CONTENTDIR)/SkyboxFShader.cpp: $(CONTENTDIR)
	$(FILEWRAP)  -s  -o $@ SkyboxFShader.fsh

$(CONTENTDIR)/SkyboxVShader.cpp: $(CONTENTDIR)
	$(FILEWRAP)  -s  -o $@ SkyboxVShader.vsh

$(CONTENTDIR)/ModelFShader.cpp: $(CONTENTDIR)
	$(FILEWRAP)  -s  -o $@ ModelFShader.fsh

$(CONTENTDIR)/ModelVShader.cpp: $(CONTENTDIR)
	$(FILEWRAP)  -s  -o $@ ModelVShader.vsh

$(CONTENTDIR)/Tex2DFShader.cpp: $(CONTENTDIR)
	$(FILEWRAP)  -s  -o $@ Tex2DFShader.fsh

$(CONTENTDIR)/Tex2DVShader.cpp: $(CONTENTDIR)
	$(FILEWRAP)  -s  -o $@ Tex2DVShader.vsh

$(CONTENTDIR)/PlaneTexFShader.cpp: $(CONTENTDIR)
	$(FILEWRAP)  -s  -o $@ PlaneTexFShader.fsh

$(CONTENTDIR)/PlaneTexVShader.cpp: $(CONTENTDIR)
	$(FILEWRAP)  -s  -o $@ PlaneTexVShader.vsh

$(CONTENTDIR)/Scene.cpp: $(CONTENTDIR)
	$(FILEWRAP)  -o $@ Scene.pod

############################################################################
# End of file (content.mak)
############################################################################
