LOCAL_PATH := $(realpath $(call my-dir)/../../../../../../../..)
PVRSDKDIR := $(LOCAL_PATH)

ASSETDIR := $(PVRSDKDIR)/Examples/Intermediate/AlphaBlend/OGLES/Build/Android/assets

include $(CLEAR_VARS)

LOCAL_MODULE    := OGLESAlphaBlend

### Add all source file names to be included in lib separated by a whitespace
LOCAL_SRC_FILES := \
				   Examples/Intermediate/AlphaBlend/OGLES/OGLESAlphaBlend.cpp \
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

$(PVRSDKDIR)/Examples/Intermediate/AlphaBlend/OGLES/OGLESAlphaBlend.cpp:  \
								$(ASSETDIR)/Background.pvr \
								$(ASSETDIR)/Foreground.pvr

$(ASSETDIR):
	-mkdir $(ASSETDIR)

$(ASSETDIR)/Background.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/AlphaBlend/OGLES/Background.pvr
	cp "$(PVRSDKDIR)/Examples/Intermediate/AlphaBlend/OGLES/Background.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Foreground.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/AlphaBlend/OGLES/Foreground.pvr
	cp "$(PVRSDKDIR)/Examples/Intermediate/AlphaBlend/OGLES/Foreground.pvr"	"$(ASSETDIR)/" 



