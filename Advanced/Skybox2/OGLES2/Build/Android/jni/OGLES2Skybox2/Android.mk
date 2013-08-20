LOCAL_PATH := $(realpath $(call my-dir)/../../../../../../../..)
PVRSDKDIR := $(LOCAL_PATH)

ASSETDIR := $(PVRSDKDIR)/Examples/Advanced/Skybox2/OGLES2/Build/Android/assets

include $(CLEAR_VARS)

LOCAL_MODULE    := OGLES2Skybox2

### Add all source file names to be included in lib separated by a whitespace
LOCAL_SRC_FILES := \
				   Examples/Advanced/Skybox2/OGLES2/OGLES2Skybox2.cpp \
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

$(PVRSDKDIR)/Examples/Advanced/Skybox2/OGLES2/OGLES2Skybox2.cpp:  \
								$(ASSETDIR)/Scene.pod \
								$(ASSETDIR)/effects.pfx \
								$(ASSETDIR)/Balloon.pvr \
								$(ASSETDIR)/Balloon_pvr.pvr \
								$(ASSETDIR)/Noise.pvr \
								$(ASSETDIR)/Skybox.pvr \
								$(ASSETDIR)/SkyboxMidnight.pvr

$(ASSETDIR):
	-mkdir $(ASSETDIR)

$(ASSETDIR)/Balloon.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Skybox2/OGLES2/Balloon.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Skybox2/OGLES2/Balloon.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Balloon_pvr.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Skybox2/OGLES2/Balloon_pvr.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Skybox2/OGLES2/Balloon_pvr.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Noise.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Skybox2/OGLES2/Noise.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Skybox2/OGLES2/Noise.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Skybox.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Skybox2/OGLES2/Skybox.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Skybox2/OGLES2/Skybox.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/SkyboxMidnight.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Skybox2/OGLES2/SkyboxMidnight.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Skybox2/OGLES2/SkyboxMidnight.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Scene.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Skybox2/OGLES2/Scene.pod
	cp "$(PVRSDKDIR)/Examples/Advanced/Skybox2/OGLES2/Scene.pod"	"$(ASSETDIR)/" 

$(ASSETDIR)/effects.pfx: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Skybox2/OGLES2/effects.pfx
	cp "$(PVRSDKDIR)/Examples/Advanced/Skybox2/OGLES2/effects.pfx"	"$(ASSETDIR)/" 



