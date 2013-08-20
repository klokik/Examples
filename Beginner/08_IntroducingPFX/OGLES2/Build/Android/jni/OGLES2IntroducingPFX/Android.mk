LOCAL_PATH := $(realpath $(call my-dir)/../../../../../../../..)
PVRSDKDIR := $(LOCAL_PATH)

ASSETDIR := $(PVRSDKDIR)/Examples/Beginner/08_IntroducingPFX/OGLES2/Build/Android/assets

include $(CLEAR_VARS)

LOCAL_MODULE    := OGLES2IntroducingPFX

### Add all source file names to be included in lib separated by a whitespace
LOCAL_SRC_FILES := \
				   Examples/Beginner/08_IntroducingPFX/OGLES2/OGLES2IntroducingPFX.cpp \
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

$(PVRSDKDIR)/Examples/Beginner/08_IntroducingPFX/OGLES2/OGLES2IntroducingPFX.cpp:  \
								$(ASSETDIR)/Scene.pod \
								$(ASSETDIR)/effect.pfx \
								$(ASSETDIR)/Basetex.pvr \
								$(ASSETDIR)/Reflection.pvr

$(ASSETDIR):
	-mkdir $(ASSETDIR)

$(ASSETDIR)/Basetex.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Beginner/08_IntroducingPFX/OGLES2/Basetex.pvr
	cp "$(PVRSDKDIR)/Examples/Beginner/08_IntroducingPFX/OGLES2/Basetex.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Reflection.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Beginner/08_IntroducingPFX/OGLES2/Reflection.pvr
	cp "$(PVRSDKDIR)/Examples/Beginner/08_IntroducingPFX/OGLES2/Reflection.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Scene.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Beginner/08_IntroducingPFX/OGLES2/Scene.pod
	cp "$(PVRSDKDIR)/Examples/Beginner/08_IntroducingPFX/OGLES2/Scene.pod"	"$(ASSETDIR)/" 

$(ASSETDIR)/effect.pfx: $(ASSETDIR) $(PVRSDKDIR)/Examples/Beginner/08_IntroducingPFX/OGLES2/effect.pfx
	cp "$(PVRSDKDIR)/Examples/Beginner/08_IntroducingPFX/OGLES2/effect.pfx"	"$(ASSETDIR)/" 



