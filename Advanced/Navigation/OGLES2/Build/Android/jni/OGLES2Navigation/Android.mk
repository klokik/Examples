LOCAL_PATH := $(realpath $(call my-dir)/../../../../../../../..)
PVRSDKDIR := $(LOCAL_PATH)

ASSETDIR := $(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/Build/Android/assets

include $(CLEAR_VARS)

LOCAL_MODULE    := OGLES2Navigation

### Add all source file names to be included in lib separated by a whitespace
LOCAL_SRC_FILES := \
				   Examples/Advanced/Navigation/OGLES2/OGLES2Navigation.cpp \
				   Shell/PVRShell.cpp \
				   Shell/API/KEGL/PVRShellAPI.cpp \
				   Shell/OS/Android/PVRShellOS.cpp

LOCAL_C_INCLUDES :=	\
				    $(PVRSDKDIR)/Shell	\
				    $(PVRSDKDIR)/Shell/API/KEGL	\
				    $(PVRSDKDIR)/Shell/OS/Android	\
				    $(PVRSDKDIR)/Builds/Include	\
				    $(PVRSDKDIR)/Tools	\
				    $(PVRSDKDIR)/Tools/OGLES2

LOCAL_CFLAGS := -DBUILD_OGLES2


LOCAL_LDLIBS :=  \
				-llog \
				-landroid \
				-lEGL \
				-lGLESv2

LOCAL_STATIC_LIBRARIES := \
				          android_native_app_glue \
				          ogles2tools 

include $(BUILD_SHARED_LIBRARY)

$(call import-module,android/native_app_glue)

### Copy our external files to the assets folder
.PHONY : build_shaders build_textures

$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/OGLES2Navigation.cpp:  \
								$(ASSETDIR)/cameratrack.pod \
								$(ASSETDIR)/Landmark_meshes.nav \
								$(ASSETDIR)/LandUseA_meshes.nav \
								$(ASSETDIR)/LandUseB_meshes.nav \
								$(ASSETDIR)/MajHwys_meshes.nav \
								$(ASSETDIR)/MajHwyShield_text.nav \
								$(ASSETDIR)/RailRds_meshes.nav \
								$(ASSETDIR)/SecHwys_meshes.nav \
								$(ASSETDIR)/SecHwyShield_text.nav \
								$(ASSETDIR)/Signs_billboards.nav \
								$(ASSETDIR)/Streets_meshes.nav \
								$(ASSETDIR)/Streets_text.nav \
								$(ASSETDIR)/WaterPoly_meshes.nav \
								$(ASSETDIR)/WaterSeg_meshes.nav \
								$(ASSETDIR)/Alphabet.pvr \
								$(ASSETDIR)/Road.pvr \
								$(ASSETDIR)/StreetSigns.pvr \
								$(ASSETDIR)/AlphaMaskFragShader.fsh \
								$(ASSETDIR)/AntiAliasedLinesFragShader.fsh \
								$(ASSETDIR)/AntiAliasedLinesVertShader.vsh \
								$(ASSETDIR)/FragShader.fsh \
								$(ASSETDIR)/VertShader.vsh \
								$(ASSETDIR)/PivotQuadFragShader.fsh \
								$(ASSETDIR)/PivotQuadMaskedFragShader.fsh \
								$(ASSETDIR)/PivotQuadVertShader.vsh

$(ASSETDIR):
	-mkdir $(ASSETDIR)

$(ASSETDIR)/Alphabet.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/Alphabet.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/Alphabet.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Road.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/Road.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/Road.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/StreetSigns.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/StreetSigns.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/StreetSigns.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/AlphaMaskFragShader.fsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/AlphaMaskFragShader.fsh
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/AlphaMaskFragShader.fsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/AlphaMaskFragShader.fsc" && \
		cp "$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/AlphaMaskFragShader.fsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/AntiAliasedLinesFragShader.fsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/AntiAliasedLinesFragShader.fsh
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/AntiAliasedLinesFragShader.fsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/AntiAliasedLinesFragShader.fsc" && \
		cp "$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/AntiAliasedLinesFragShader.fsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/AntiAliasedLinesVertShader.vsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/AntiAliasedLinesVertShader.vsh
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/AntiAliasedLinesVertShader.vsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/AntiAliasedLinesVertShader.vsc" && \
		cp "$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/AntiAliasedLinesVertShader.vsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/FragShader.fsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/FragShader.fsh
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/FragShader.fsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/FragShader.fsc" && \
		cp "$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/FragShader.fsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/VertShader.vsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/VertShader.vsh
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/VertShader.vsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/VertShader.vsc" && \
		cp "$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/VertShader.vsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/PivotQuadFragShader.fsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/PivotQuadFragShader.fsh
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/PivotQuadFragShader.fsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/PivotQuadFragShader.fsc" && \
		cp "$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/PivotQuadFragShader.fsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/PivotQuadMaskedFragShader.fsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/PivotQuadMaskedFragShader.fsh
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/PivotQuadMaskedFragShader.fsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/PivotQuadMaskedFragShader.fsc" && \
		cp "$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/PivotQuadMaskedFragShader.fsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/PivotQuadVertShader.vsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/PivotQuadVertShader.vsh
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/PivotQuadVertShader.vsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/PivotQuadVertShader.vsc" && \
		cp "$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/PivotQuadVertShader.vsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/cameratrack.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/cameratrack.pod
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/cameratrack.pod"	"$(ASSETDIR)/" 

$(ASSETDIR)/Landmark_meshes.nav: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/Landmark_meshes.nav
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/Landmark_meshes.nav"	"$(ASSETDIR)/" 

$(ASSETDIR)/LandUseA_meshes.nav: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/LandUseA_meshes.nav
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/LandUseA_meshes.nav"	"$(ASSETDIR)/" 

$(ASSETDIR)/LandUseB_meshes.nav: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/LandUseB_meshes.nav
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/LandUseB_meshes.nav"	"$(ASSETDIR)/" 

$(ASSETDIR)/MajHwys_meshes.nav: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/MajHwys_meshes.nav
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/MajHwys_meshes.nav"	"$(ASSETDIR)/" 

$(ASSETDIR)/MajHwyShield_text.nav: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/MajHwyShield_text.nav
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/MajHwyShield_text.nav"	"$(ASSETDIR)/" 

$(ASSETDIR)/RailRds_meshes.nav: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/RailRds_meshes.nav
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/RailRds_meshes.nav"	"$(ASSETDIR)/" 

$(ASSETDIR)/SecHwys_meshes.nav: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/SecHwys_meshes.nav
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/SecHwys_meshes.nav"	"$(ASSETDIR)/" 

$(ASSETDIR)/SecHwyShield_text.nav: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/SecHwyShield_text.nav
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/SecHwyShield_text.nav"	"$(ASSETDIR)/" 

$(ASSETDIR)/Signs_billboards.nav: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/Signs_billboards.nav
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/Signs_billboards.nav"	"$(ASSETDIR)/" 

$(ASSETDIR)/Streets_meshes.nav: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/Streets_meshes.nav
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/Streets_meshes.nav"	"$(ASSETDIR)/" 

$(ASSETDIR)/Streets_text.nav: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/Streets_text.nav
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/Streets_text.nav"	"$(ASSETDIR)/" 

$(ASSETDIR)/WaterPoly_meshes.nav: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/WaterPoly_meshes.nav
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/WaterPoly_meshes.nav"	"$(ASSETDIR)/" 

$(ASSETDIR)/WaterSeg_meshes.nav: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/WaterSeg_meshes.nav
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES2/WaterSeg_meshes.nav"	"$(ASSETDIR)/" 



