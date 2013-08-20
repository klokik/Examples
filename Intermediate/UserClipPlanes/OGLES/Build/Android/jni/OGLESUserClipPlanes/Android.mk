LOCAL_PATH := $(realpath $(call my-dir)/../../../../../../../..)
PVRSDKDIR := $(LOCAL_PATH)

ASSETDIR := $(PVRSDKDIR)/Examples/Intermediate/UserClipPlanes/OGLES/Build/Android/assets

include $(CLEAR_VARS)

LOCAL_MODULE    := OGLESUserClipPlanes

### Add all source file names to be included in lib separated by a whitespace
LOCAL_SRC_FILES := \
				   Examples/Intermediate/UserClipPlanes/OGLES/OGLESUserClipPlanes.cpp \
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

$(PVRSDKDIR)/Examples/Intermediate/UserClipPlanes/OGLES/OGLESUserClipPlanes.cpp:  \
								$(ASSETDIR)/Mesh.pod \
								$(ASSETDIR)/Granite.pvr

$(ASSETDIR):
	-mkdir $(ASSETDIR)

$(ASSETDIR)/Granite.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/UserClipPlanes/OGLES/Granite.pvr
	cp "$(PVRSDKDIR)/Examples/Intermediate/UserClipPlanes/OGLES/Granite.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Mesh.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/UserClipPlanes/OGLES/Mesh.pod
	cp "$(PVRSDKDIR)/Examples/Intermediate/UserClipPlanes/OGLES/Mesh.pod"	"$(ASSETDIR)/" 



