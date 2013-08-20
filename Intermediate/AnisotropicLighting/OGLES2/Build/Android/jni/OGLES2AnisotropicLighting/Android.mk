LOCAL_PATH := $(realpath $(call my-dir)/../../../../../../../..)
PVRSDKDIR := $(LOCAL_PATH)

ASSETDIR := $(PVRSDKDIR)/Examples/Intermediate/AnisotropicLighting/OGLES2/Build/Android/assets

include $(CLEAR_VARS)

LOCAL_MODULE    := OGLES2AnisotropicLighting

### Add all source file names to be included in lib separated by a whitespace
LOCAL_SRC_FILES := \
				   Examples/Intermediate/AnisotropicLighting/OGLES2/OGLES2AnisotropicLighting.cpp \
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

$(PVRSDKDIR)/Examples/Intermediate/AnisotropicLighting/OGLES2/OGLES2AnisotropicLighting.cpp:  \
								$(ASSETDIR)/Mask.pod \
								$(ASSETDIR)/Basetex.pvr \
								$(ASSETDIR)/FastFragShader.fsh \
								$(ASSETDIR)/FastVertShader.vsh \
								$(ASSETDIR)/SlowFragShader.fsh \
								$(ASSETDIR)/SlowVertShader.vsh

$(ASSETDIR):
	-mkdir $(ASSETDIR)

$(ASSETDIR)/Basetex.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/AnisotropicLighting/OGLES2/Basetex.pvr
	cp "$(PVRSDKDIR)/Examples/Intermediate/AnisotropicLighting/OGLES2/Basetex.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/FastFragShader.fsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/AnisotropicLighting/OGLES2/FastFragShader.fsh
	cp "$(PVRSDKDIR)/Examples/Intermediate/AnisotropicLighting/OGLES2/FastFragShader.fsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Intermediate/AnisotropicLighting/OGLES2/FastFragShader.fsc" && \
		cp "$(PVRSDKDIR)/Examples/Intermediate/AnisotropicLighting/OGLES2/FastFragShader.fsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/FastVertShader.vsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/AnisotropicLighting/OGLES2/FastVertShader.vsh
	cp "$(PVRSDKDIR)/Examples/Intermediate/AnisotropicLighting/OGLES2/FastVertShader.vsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Intermediate/AnisotropicLighting/OGLES2/FastVertShader.vsc" && \
		cp "$(PVRSDKDIR)/Examples/Intermediate/AnisotropicLighting/OGLES2/FastVertShader.vsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/SlowFragShader.fsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/AnisotropicLighting/OGLES2/SlowFragShader.fsh
	cp "$(PVRSDKDIR)/Examples/Intermediate/AnisotropicLighting/OGLES2/SlowFragShader.fsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Intermediate/AnisotropicLighting/OGLES2/SlowFragShader.fsc" && \
		cp "$(PVRSDKDIR)/Examples/Intermediate/AnisotropicLighting/OGLES2/SlowFragShader.fsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/SlowVertShader.vsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/AnisotropicLighting/OGLES2/SlowVertShader.vsh
	cp "$(PVRSDKDIR)/Examples/Intermediate/AnisotropicLighting/OGLES2/SlowVertShader.vsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Intermediate/AnisotropicLighting/OGLES2/SlowVertShader.vsc" && \
		cp "$(PVRSDKDIR)/Examples/Intermediate/AnisotropicLighting/OGLES2/SlowVertShader.vsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/Mask.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/AnisotropicLighting/OGLES2/Mask.pod
	cp "$(PVRSDKDIR)/Examples/Intermediate/AnisotropicLighting/OGLES2/Mask.pod"	"$(ASSETDIR)/" 



