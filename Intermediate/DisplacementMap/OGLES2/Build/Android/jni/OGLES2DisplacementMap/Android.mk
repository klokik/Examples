LOCAL_PATH := $(realpath $(call my-dir)/../../../../../../../..)
PVRSDKDIR := $(LOCAL_PATH)

ASSETDIR := $(PVRSDKDIR)/Examples/Intermediate/DisplacementMap/OGLES2/Build/Android/assets

include $(CLEAR_VARS)

LOCAL_MODULE    := OGLES2DisplacementMap

### Add all source file names to be included in lib separated by a whitespace
LOCAL_SRC_FILES := \
				   Examples/Intermediate/DisplacementMap/OGLES2/OGLES2DisplacementMap.cpp \
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

$(PVRSDKDIR)/Examples/Intermediate/DisplacementMap/OGLES2/OGLES2DisplacementMap.cpp:  \
								$(ASSETDIR)/DisMapScene.pod \
								$(ASSETDIR)/Cow.pvr \
								$(ASSETDIR)/DisMap.pvr \
								$(ASSETDIR)/FragShader.fsh \
								$(ASSETDIR)/VertShader.vsh

$(ASSETDIR):
	-mkdir $(ASSETDIR)

$(ASSETDIR)/Cow.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/DisplacementMap/OGLES2/Cow.pvr
	cp "$(PVRSDKDIR)/Examples/Intermediate/DisplacementMap/OGLES2/Cow.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/DisMap.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/DisplacementMap/OGLES2/DisMap.pvr
	cp "$(PVRSDKDIR)/Examples/Intermediate/DisplacementMap/OGLES2/DisMap.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/FragShader.fsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/DisplacementMap/OGLES2/FragShader.fsh
	cp "$(PVRSDKDIR)/Examples/Intermediate/DisplacementMap/OGLES2/FragShader.fsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Intermediate/DisplacementMap/OGLES2/FragShader.fsc" && \
		cp "$(PVRSDKDIR)/Examples/Intermediate/DisplacementMap/OGLES2/FragShader.fsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/VertShader.vsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/DisplacementMap/OGLES2/VertShader.vsh
	cp "$(PVRSDKDIR)/Examples/Intermediate/DisplacementMap/OGLES2/VertShader.vsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Intermediate/DisplacementMap/OGLES2/VertShader.vsc" && \
		cp "$(PVRSDKDIR)/Examples/Intermediate/DisplacementMap/OGLES2/VertShader.vsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/DisMapScene.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/DisplacementMap/OGLES2/DisMapScene.pod
	cp "$(PVRSDKDIR)/Examples/Intermediate/DisplacementMap/OGLES2/DisMapScene.pod"	"$(ASSETDIR)/" 



