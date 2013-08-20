LOCAL_PATH := $(realpath $(call my-dir)/../../../../../../../..)
PVRSDKDIR := $(LOCAL_PATH)

ASSETDIR := $(PVRSDKDIR)/Examples/Advanced/PVRScopeRemote/OGLES/BuildDeveloper/Android/assets

include $(CLEAR_VARS)

LOCAL_MODULE    := OGLESPVRScopeRemote

### Add all source file names to be included in lib separated by a whitespace
LOCAL_SRC_FILES := \
				   Examples/Advanced/PVRScopeRemote/OGLES/OGLESPVRScopeRemote.cpp \
				   Shell/PVRShell.cpp \
				   Shell/API/KEGL/PVRShellAPI.cpp \
				   Shell/OS/Android/PVRShellOS.cpp

LOCAL_C_INCLUDES :=	\
				    $(PVRSDKDIR)/Builds/Include	\
				    $(PVRSDKDIR)/Shell	\
				    $(PVRSDKDIR)/Shell/API/KEGL	\
				    $(PVRSDKDIR)/Shell/OS/Android	\
				    $(PVRSDKDIR)/Builds/Include	\
				    $(PVRSDKDIR)/Tools	\
				    $(PVRSDKDIR)/Tools/OGLES

LOCAL_CFLAGS := -DBUILD_OGLES


LOCAL_LDLIBS :=  \
				-L$(PVRSDKDIR)/Builds/Android/$(TARGET_ARCH_ABI)/Lib \
				-lPVRScopeDeveloper \
				-ldl \
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

$(PVRSDKDIR)/Examples/Advanced/PVRScopeRemote/OGLES/OGLESPVRScopeRemote.cpp:  \
								$(ASSETDIR)/Mask.pod \
								$(ASSETDIR)/MaskTex.pvr

$(ASSETDIR):
	-mkdir $(ASSETDIR)

$(ASSETDIR)/MaskTex.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/PVRScopeRemote/OGLES/MaskTex.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/PVRScopeRemote/OGLES/MaskTex.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Mask.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/PVRScopeRemote/OGLES/Mask.pod
	cp "$(PVRSDKDIR)/Examples/Advanced/PVRScopeRemote/OGLES/Mask.pod"	"$(ASSETDIR)/" 



