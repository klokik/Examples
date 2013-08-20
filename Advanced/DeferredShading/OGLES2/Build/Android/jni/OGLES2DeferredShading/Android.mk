LOCAL_PATH := $(realpath $(call my-dir)/../../../../../../../..)
PVRSDKDIR := $(LOCAL_PATH)

ASSETDIR := $(PVRSDKDIR)/Examples/Advanced/DeferredShading/OGLES2/Build/Android/assets

include $(CLEAR_VARS)

LOCAL_MODULE    := OGLES2DeferredShading

### Add all source file names to be included in lib separated by a whitespace
LOCAL_SRC_FILES := \
				   Examples/Advanced/DeferredShading/OGLES2/OGLES2DeferredShading.cpp \
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

$(PVRSDKDIR)/Examples/Advanced/DeferredShading/OGLES2/OGLES2DeferredShading.cpp:  \
								$(ASSETDIR)/scene.pod \
								$(ASSETDIR)/pointlight.pod \
								$(ASSETDIR)/effect.pfx \
								$(ASSETDIR)/light_cubemap.pvr \
								$(ASSETDIR)/mask_texture.pvr \
								$(ASSETDIR)/mask_bump.pvr

$(ASSETDIR):
	-mkdir $(ASSETDIR)

$(ASSETDIR)/light_cubemap.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/DeferredShading/OGLES2/light_cubemap.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/DeferredShading/OGLES2/light_cubemap.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/mask_texture.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/DeferredShading/OGLES2/mask_texture.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/DeferredShading/OGLES2/mask_texture.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/mask_bump.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/DeferredShading/OGLES2/mask_bump.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/DeferredShading/OGLES2/mask_bump.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/scene.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/DeferredShading/OGLES2/scene.pod
	cp "$(PVRSDKDIR)/Examples/Advanced/DeferredShading/OGLES2/scene.pod"	"$(ASSETDIR)/" 

$(ASSETDIR)/pointlight.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/DeferredShading/OGLES2/pointlight.pod
	cp "$(PVRSDKDIR)/Examples/Advanced/DeferredShading/OGLES2/pointlight.pod"	"$(ASSETDIR)/" 

$(ASSETDIR)/effect.pfx: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/DeferredShading/OGLES2/effect.pfx
	cp "$(PVRSDKDIR)/Examples/Advanced/DeferredShading/OGLES2/effect.pfx"	"$(ASSETDIR)/" 



