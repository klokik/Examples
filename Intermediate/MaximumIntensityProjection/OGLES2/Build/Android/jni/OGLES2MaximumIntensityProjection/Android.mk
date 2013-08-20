LOCAL_PATH := $(realpath $(call my-dir)/../../../../../../../..)
PVRSDKDIR := $(LOCAL_PATH)

ASSETDIR := $(PVRSDKDIR)/Examples/Intermediate/MaximumIntensityProjection/OGLES2/Build/Android/assets

include $(CLEAR_VARS)

LOCAL_MODULE    := OGLES2MaximumIntensityProjection

### Add all source file names to be included in lib separated by a whitespace
LOCAL_SRC_FILES := \
				   Examples/Intermediate/MaximumIntensityProjection/OGLES2/OGLES2MaximumIntensityProjection.cpp \
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
.PHONY : build_textures

$(PVRSDKDIR)/Examples/Intermediate/MaximumIntensityProjection/OGLES2/OGLES2MaximumIntensityProjection.cpp:  \
								$(ASSETDIR)/blend_minmax_scene.POD \
								$(ASSETDIR)/effect.pfx \
								$(ASSETDIR)/skinTex.pvr

$(ASSETDIR):
	-mkdir $(ASSETDIR)

$(ASSETDIR)/skinTex.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/MaximumIntensityProjection/OGLES2/skinTex.pvr
	cp "$(PVRSDKDIR)/Examples/Intermediate/MaximumIntensityProjection/OGLES2/skinTex.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/blend_minmax_scene.POD: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/MaximumIntensityProjection/OGLES2/blend_minmax_scene.POD
	cp "$(PVRSDKDIR)/Examples/Intermediate/MaximumIntensityProjection/OGLES2/blend_minmax_scene.POD"	"$(ASSETDIR)/" 

$(ASSETDIR)/effect.pfx: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/MaximumIntensityProjection/OGLES2/effect.pfx
	cp "$(PVRSDKDIR)/Examples/Intermediate/MaximumIntensityProjection/OGLES2/effect.pfx"	"$(ASSETDIR)/" 



