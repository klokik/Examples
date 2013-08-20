LOCAL_PATH := $(realpath $(call my-dir)/../../../../../../../..)
PVRSDKDIR := $(LOCAL_PATH)

ASSETDIR := $(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES/Build/Android/assets

include $(CLEAR_VARS)

LOCAL_MODULE    := OGLESNavigation

### Add all source file names to be included in lib separated by a whitespace
LOCAL_SRC_FILES := \
				   Examples/Advanced/Navigation/OGLES/OGLESNavigation.cpp \
				   Shell/PVRShell.cpp \
				   Shell/API/KEGL/PVRShellAPI.cpp \
				   Shell/OS/Android/PVRShellOS.cpp

LOCAL_C_INCLUDES :=	\
				    $(PVRSDKDIR)/Shell	\
				    $(PVRSDKDIR)/Shell/API/KEGL	\
				    $(PVRSDKDIR)/Shell/OS/Android	\
				    $(PVRSDKDIR)/Builds/Include	\
				    $(PVRSDKDIR)/Tools	\
				    $(PVRSDKDIR)/Tools/OGLES

LOCAL_CFLAGS := -DBUILD_OGLES


LOCAL_LDLIBS :=  \
				-llog \
				-landroid \
				-lEGL \
				-lGLESv1_CM

LOCAL_STATIC_LIBRARIES := \
				          android_native_app_glue \
				          oglestools 

include $(BUILD_SHARED_LIBRARY)

$(call import-module,android/native_app_glue)

### Copy our external files to the assets folder
.PHONY : build_textures

$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES/OGLESNavigation.cpp:  \
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
								$(ASSETDIR)/Road.pvr

$(ASSETDIR):
	-mkdir $(ASSETDIR)

$(ASSETDIR)/Alphabet.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES/Alphabet.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES/Alphabet.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Road.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES/Road.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES/Road.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/cameratrack.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES/cameratrack.pod
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES/cameratrack.pod"	"$(ASSETDIR)/" 

$(ASSETDIR)/Landmark_meshes.nav: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES/Landmark_meshes.nav
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES/Landmark_meshes.nav"	"$(ASSETDIR)/" 

$(ASSETDIR)/LandUseA_meshes.nav: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES/LandUseA_meshes.nav
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES/LandUseA_meshes.nav"	"$(ASSETDIR)/" 

$(ASSETDIR)/LandUseB_meshes.nav: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES/LandUseB_meshes.nav
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES/LandUseB_meshes.nav"	"$(ASSETDIR)/" 

$(ASSETDIR)/MajHwys_meshes.nav: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES/MajHwys_meshes.nav
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES/MajHwys_meshes.nav"	"$(ASSETDIR)/" 

$(ASSETDIR)/MajHwyShield_text.nav: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES/MajHwyShield_text.nav
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES/MajHwyShield_text.nav"	"$(ASSETDIR)/" 

$(ASSETDIR)/RailRds_meshes.nav: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES/RailRds_meshes.nav
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES/RailRds_meshes.nav"	"$(ASSETDIR)/" 

$(ASSETDIR)/SecHwys_meshes.nav: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES/SecHwys_meshes.nav
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES/SecHwys_meshes.nav"	"$(ASSETDIR)/" 

$(ASSETDIR)/SecHwyShield_text.nav: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES/SecHwyShield_text.nav
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES/SecHwyShield_text.nav"	"$(ASSETDIR)/" 

$(ASSETDIR)/Signs_billboards.nav: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES/Signs_billboards.nav
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES/Signs_billboards.nav"	"$(ASSETDIR)/" 

$(ASSETDIR)/Streets_meshes.nav: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES/Streets_meshes.nav
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES/Streets_meshes.nav"	"$(ASSETDIR)/" 

$(ASSETDIR)/Streets_text.nav: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES/Streets_text.nav
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES/Streets_text.nav"	"$(ASSETDIR)/" 

$(ASSETDIR)/WaterPoly_meshes.nav: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES/WaterPoly_meshes.nav
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES/WaterPoly_meshes.nav"	"$(ASSETDIR)/" 

$(ASSETDIR)/WaterSeg_meshes.nav: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES/WaterSeg_meshes.nav
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation/OGLES/WaterSeg_meshes.nav"	"$(ASSETDIR)/" 



