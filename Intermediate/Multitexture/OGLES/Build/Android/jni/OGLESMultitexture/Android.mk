LOCAL_PATH := $(realpath $(call my-dir)/../../../../../../../..)
PVRSDKDIR := $(LOCAL_PATH)

ASSETDIR := $(PVRSDKDIR)/Examples/Intermediate/Multitexture/OGLES/Build/Android/assets

include $(CLEAR_VARS)

LOCAL_MODULE    := OGLESMultitexture

### Add all source file names to be included in lib separated by a whitespace
LOCAL_SRC_FILES := \
				   Examples/Intermediate/Multitexture/OGLES/OGLESMultitexture.cpp \
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

$(PVRSDKDIR)/Examples/Intermediate/Multitexture/OGLES/OGLESMultitexture.cpp:  \
								$(ASSETDIR)/Crate.pvr \
								$(ASSETDIR)/stamp.pvr \
								$(ASSETDIR)/stampnm.pvr

$(ASSETDIR):
	-mkdir $(ASSETDIR)

$(ASSETDIR)/Crate.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/Multitexture/OGLES/Crate.pvr
	cp "$(PVRSDKDIR)/Examples/Intermediate/Multitexture/OGLES/Crate.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/stamp.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/Multitexture/OGLES/stamp.pvr
	cp "$(PVRSDKDIR)/Examples/Intermediate/Multitexture/OGLES/stamp.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/stampnm.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/Multitexture/OGLES/stampnm.pvr
	cp "$(PVRSDKDIR)/Examples/Intermediate/Multitexture/OGLES/stampnm.pvr"	"$(ASSETDIR)/" 



