LOCAL_PATH := $(realpath $(call my-dir)/../../../../../../../..)
PVRSDKDIR := $(LOCAL_PATH)

ASSETDIR := $(PVRSDKDIR)/Examples/Advanced/Particles/OGLES/Build/Android/assets

include $(CLEAR_VARS)

LOCAL_MODULE    := OGLESParticles

### Add all source file names to be included in lib separated by a whitespace
LOCAL_SRC_FILES := \
				   Examples/Advanced/Particles/OGLES/OGLESParticles.cpp \
				   Shell/PVRShell.cpp \
				   Shell/API/KEGL/PVRShellAPI.cpp \
				   Shell/OS/Android/PVRShellOS.cpp

LOCAL_C_INCLUDES :=	\
				    $(PVRSDKDIR)/Examples/Advanced/Particles/OGLES	\
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

$(PVRSDKDIR)/Examples/Advanced/Particles/OGLES/OGLESParticles.cpp:  \
								$(ASSETDIR)/LightTex.pvr \
								$(ASSETDIR)/FloorTex8.pvr

$(ASSETDIR):
	-mkdir $(ASSETDIR)

$(ASSETDIR)/LightTex.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Particles/OGLES/LightTex.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Particles/OGLES/LightTex.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/FloorTex8.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Particles/OGLES/FloorTex8.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Particles/OGLES/FloorTex8.pvr"	"$(ASSETDIR)/" 



