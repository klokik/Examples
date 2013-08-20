LOCAL_PATH := $(realpath $(call my-dir)/../../../../../../../..)
PVRSDKDIR := $(LOCAL_PATH)

ASSETDIR := $(PVRSDKDIR)/Examples/Intermediate/ShadowVolume/OGLES2/Build/Android/assets

include $(CLEAR_VARS)

LOCAL_MODULE    := OGLES2ShadowVolume

### Add all source file names to be included in lib separated by a whitespace
LOCAL_SRC_FILES := \
				   Examples/Intermediate/ShadowVolume/OGLES2/OGLES2ShadowVolume.cpp \
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
.PHONY : build_shaders build_textures

$(PVRSDKDIR)/Examples/Intermediate/ShadowVolume/OGLES2/OGLES2ShadowVolume.cpp:  \
								$(ASSETDIR)/scene.pod \
								$(ASSETDIR)/Background.pvr \
								$(ASSETDIR)/Rust.pvr \
								$(ASSETDIR)/BaseFragShader.fsh \
								$(ASSETDIR)/BaseVertShader.vsh \
								$(ASSETDIR)/ConstFragShader.fsh \
								$(ASSETDIR)/ShadowVolVertShader.vsh \
								$(ASSETDIR)/FullscreenVertShader.vsh

$(ASSETDIR):
	-mkdir $(ASSETDIR)

$(ASSETDIR)/Background.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/ShadowVolume/OGLES2/Background.pvr
	cp "$(PVRSDKDIR)/Examples/Intermediate/ShadowVolume/OGLES2/Background.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Rust.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/ShadowVolume/OGLES2/Rust.pvr
	cp "$(PVRSDKDIR)/Examples/Intermediate/ShadowVolume/OGLES2/Rust.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/BaseFragShader.fsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/ShadowVolume/OGLES2/BaseFragShader.fsh
	cp "$(PVRSDKDIR)/Examples/Intermediate/ShadowVolume/OGLES2/BaseFragShader.fsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Intermediate/ShadowVolume/OGLES2/BaseFragShader.fsc" && \
		cp "$(PVRSDKDIR)/Examples/Intermediate/ShadowVolume/OGLES2/BaseFragShader.fsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/BaseVertShader.vsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/ShadowVolume/OGLES2/BaseVertShader.vsh
	cp "$(PVRSDKDIR)/Examples/Intermediate/ShadowVolume/OGLES2/BaseVertShader.vsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Intermediate/ShadowVolume/OGLES2/BaseVertShader.vsc" && \
		cp "$(PVRSDKDIR)/Examples/Intermediate/ShadowVolume/OGLES2/BaseVertShader.vsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/ConstFragShader.fsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/ShadowVolume/OGLES2/ConstFragShader.fsh
	cp "$(PVRSDKDIR)/Examples/Intermediate/ShadowVolume/OGLES2/ConstFragShader.fsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Intermediate/ShadowVolume/OGLES2/ConstFragShader.fsc" && \
		cp "$(PVRSDKDIR)/Examples/Intermediate/ShadowVolume/OGLES2/ConstFragShader.fsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/ShadowVolVertShader.vsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/ShadowVolume/OGLES2/ShadowVolVertShader.vsh
	cp "$(PVRSDKDIR)/Examples/Intermediate/ShadowVolume/OGLES2/ShadowVolVertShader.vsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Intermediate/ShadowVolume/OGLES2/ShadowVolVertShader.vsc" && \
		cp "$(PVRSDKDIR)/Examples/Intermediate/ShadowVolume/OGLES2/ShadowVolVertShader.vsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/FullscreenVertShader.vsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/ShadowVolume/OGLES2/FullscreenVertShader.vsh
	cp "$(PVRSDKDIR)/Examples/Intermediate/ShadowVolume/OGLES2/FullscreenVertShader.vsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Intermediate/ShadowVolume/OGLES2/FullscreenVertShader.vsc" && \
		cp "$(PVRSDKDIR)/Examples/Intermediate/ShadowVolume/OGLES2/FullscreenVertShader.vsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/scene.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/ShadowVolume/OGLES2/scene.pod
	cp "$(PVRSDKDIR)/Examples/Intermediate/ShadowVolume/OGLES2/scene.pod"	"$(ASSETDIR)/" 



