LOCAL_PATH := $(realpath $(call my-dir)/../../../../../../../..)
PVRSDKDIR := $(LOCAL_PATH)

ASSETDIR := $(PVRSDKDIR)/Examples/Advanced/MagicLantern/OGLES2/Build/Android/assets

include $(CLEAR_VARS)

LOCAL_MODULE    := OGLES2MagicLantern

### Add all source file names to be included in lib separated by a whitespace
LOCAL_SRC_FILES := \
				   Examples/Advanced/MagicLantern/OGLES2/OGLES2MagicLantern.cpp \
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

$(PVRSDKDIR)/Examples/Advanced/MagicLantern/OGLES2/OGLES2MagicLantern.cpp:  \
								$(ASSETDIR)/MagicLantern.pod \
								$(ASSETDIR)/MagicLanternShaders.pfx \
								$(ASSETDIR)/Marble.pvr \
								$(ASSETDIR)/Floor.pvr \
								$(ASSETDIR)/LanternCubemap.pvr

$(ASSETDIR):
	-mkdir $(ASSETDIR)

$(ASSETDIR)/Marble.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/MagicLantern/OGLES2/Marble.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/MagicLantern/OGLES2/Marble.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Floor.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/MagicLantern/OGLES2/Floor.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/MagicLantern/OGLES2/Floor.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/LanternCubemap.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/MagicLantern/OGLES2/LanternCubemap.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/MagicLantern/OGLES2/LanternCubemap.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/MagicLantern.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/MagicLantern/OGLES2/MagicLantern.pod
	cp "$(PVRSDKDIR)/Examples/Advanced/MagicLantern/OGLES2/MagicLantern.pod"	"$(ASSETDIR)/" 

$(ASSETDIR)/MagicLanternShaders.pfx: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/MagicLantern/OGLES2/MagicLanternShaders.pfx
	cp "$(PVRSDKDIR)/Examples/Advanced/MagicLantern/OGLES2/MagicLanternShaders.pfx"	"$(ASSETDIR)/" 



