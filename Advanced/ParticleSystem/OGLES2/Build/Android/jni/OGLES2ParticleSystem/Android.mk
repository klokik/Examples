LOCAL_PATH := $(realpath $(call my-dir)/../../../../../../../..)
PVRSDKDIR := $(LOCAL_PATH)

ASSETDIR := $(PVRSDKDIR)/Examples/Advanced/ParticleSystem/OGLES2/Build/Android/assets

include $(CLEAR_VARS)

LOCAL_MODULE    := OGLES2ParticleSystem

### Add all source file names to be included in lib separated by a whitespace
LOCAL_SRC_FILES := \
				   Examples/Advanced/ParticleSystem/OGLES2/OGLES2ParticleSystem.cpp \
				   Examples/Advanced/ParticleSystem/OGLES2/ParticleSystemCPU.cpp \
				   Shell/PVRShell.cpp \
				   Shell/API/KEGL/PVRShellAPI.cpp \
				   Shell/OS/Android/PVRShellOS.cpp

LOCAL_C_INCLUDES :=	\
				    $(PVRSDKDIR)/Examples/Advanced/ParticleSystem/OGLES2	\
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

$(PVRSDKDIR)/Examples/Advanced/ParticleSystem/OGLES2/OGLES2ParticleSystem.cpp:  \
								$(ASSETDIR)/sphere.pod \
								$(ASSETDIR)/ParticleGradient.pvr \
								$(ASSETDIR)/FragShader.fsh \
								$(ASSETDIR)/VertShader.vsh \
								$(ASSETDIR)/ParticleFragShader.fsh \
								$(ASSETDIR)/ParticleVertShader.vsh

$(ASSETDIR):
	-mkdir $(ASSETDIR)

$(ASSETDIR)/ParticleGradient.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ParticleSystem/OGLES2/ParticleGradient.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/ParticleSystem/OGLES2/ParticleGradient.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/FragShader.fsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ParticleSystem/OGLES2/FragShader.fsh
	cp "$(PVRSDKDIR)/Examples/Advanced/ParticleSystem/OGLES2/FragShader.fsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Advanced/ParticleSystem/OGLES2/FragShader.fsc" && \
		cp "$(PVRSDKDIR)/Examples/Advanced/ParticleSystem/OGLES2/FragShader.fsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/VertShader.vsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ParticleSystem/OGLES2/VertShader.vsh
	cp "$(PVRSDKDIR)/Examples/Advanced/ParticleSystem/OGLES2/VertShader.vsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Advanced/ParticleSystem/OGLES2/VertShader.vsc" && \
		cp "$(PVRSDKDIR)/Examples/Advanced/ParticleSystem/OGLES2/VertShader.vsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/ParticleFragShader.fsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ParticleSystem/OGLES2/ParticleFragShader.fsh
	cp "$(PVRSDKDIR)/Examples/Advanced/ParticleSystem/OGLES2/ParticleFragShader.fsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Advanced/ParticleSystem/OGLES2/ParticleFragShader.fsc" && \
		cp "$(PVRSDKDIR)/Examples/Advanced/ParticleSystem/OGLES2/ParticleFragShader.fsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/ParticleVertShader.vsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ParticleSystem/OGLES2/ParticleVertShader.vsh
	cp "$(PVRSDKDIR)/Examples/Advanced/ParticleSystem/OGLES2/ParticleVertShader.vsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Advanced/ParticleSystem/OGLES2/ParticleVertShader.vsc" && \
		cp "$(PVRSDKDIR)/Examples/Advanced/ParticleSystem/OGLES2/ParticleVertShader.vsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/sphere.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ParticleSystem/OGLES2/sphere.pod
	cp "$(PVRSDKDIR)/Examples/Advanced/ParticleSystem/OGLES2/sphere.pod"	"$(ASSETDIR)/" 



