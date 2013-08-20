LOCAL_PATH := $(realpath $(call my-dir)/../../../../../../../..)
PVRSDKDIR := $(LOCAL_PATH)

ASSETDIR := $(PVRSDKDIR)/Examples/Beginner/07_IntroducingPOD/OGLES/Build/Android/assets

include $(CLEAR_VARS)

LOCAL_MODULE    := OGLESIntroducingPOD

### Add all source file names to be included in lib separated by a whitespace
LOCAL_SRC_FILES := \
				   Examples/Beginner/07_IntroducingPOD/OGLES/OGLESIntroducingPOD.cpp \
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

$(PVRSDKDIR)/Examples/Beginner/07_IntroducingPOD/OGLES/OGLESIntroducingPOD.cpp:  \
								$(ASSETDIR)/IntroducingPOD.pod \
								$(ASSETDIR)/tex_base.pvr \
								$(ASSETDIR)/tex_arm.pvr

$(ASSETDIR):
	-mkdir $(ASSETDIR)

$(ASSETDIR)/tex_base.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Beginner/07_IntroducingPOD/OGLES/tex_base.pvr
	cp "$(PVRSDKDIR)/Examples/Beginner/07_IntroducingPOD/OGLES/tex_base.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/tex_arm.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Beginner/07_IntroducingPOD/OGLES/tex_arm.pvr
	cp "$(PVRSDKDIR)/Examples/Beginner/07_IntroducingPOD/OGLES/tex_arm.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/IntroducingPOD.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Beginner/07_IntroducingPOD/OGLES/IntroducingPOD.pod
	cp "$(PVRSDKDIR)/Examples/Beginner/07_IntroducingPOD/OGLES/IntroducingPOD.pod"	"$(ASSETDIR)/" 



