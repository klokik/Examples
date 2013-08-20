LOCAL_PATH := $(realpath $(call my-dir)/../../../../../../../..)
PVRSDKDIR := $(LOCAL_PATH)

ASSETDIR := $(PVRSDKDIR)/Examples/Intermediate/Skinning/OGLES2/Build/Android/assets

include $(CLEAR_VARS)

LOCAL_MODULE    := OGLES2Skinning

### Add all source file names to be included in lib separated by a whitespace
LOCAL_SRC_FILES := \
				   Examples/Intermediate/Skinning/OGLES2/OGLES2Skinning.cpp \
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

$(PVRSDKDIR)/Examples/Intermediate/Skinning/OGLES2/OGLES2Skinning.cpp:  \
								$(ASSETDIR)/man.pod \
								$(ASSETDIR)/Body.pvr \
								$(ASSETDIR)/Legs.pvr \
								$(ASSETDIR)/Belt.pvr \
								$(ASSETDIR)/FragShader.fsh \
								$(ASSETDIR)/VertShader.vsh

$(ASSETDIR):
	-mkdir $(ASSETDIR)

$(ASSETDIR)/Body.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/Skinning/OGLES2/Body.pvr
	cp "$(PVRSDKDIR)/Examples/Intermediate/Skinning/OGLES2/Body.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Legs.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/Skinning/OGLES2/Legs.pvr
	cp "$(PVRSDKDIR)/Examples/Intermediate/Skinning/OGLES2/Legs.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Belt.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/Skinning/OGLES2/Belt.pvr
	cp "$(PVRSDKDIR)/Examples/Intermediate/Skinning/OGLES2/Belt.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/FragShader.fsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/Skinning/OGLES2/FragShader.fsh
	cp "$(PVRSDKDIR)/Examples/Intermediate/Skinning/OGLES2/FragShader.fsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Intermediate/Skinning/OGLES2/FragShader.fsc" && \
		cp "$(PVRSDKDIR)/Examples/Intermediate/Skinning/OGLES2/FragShader.fsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/VertShader.vsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/Skinning/OGLES2/VertShader.vsh
	cp "$(PVRSDKDIR)/Examples/Intermediate/Skinning/OGLES2/VertShader.vsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Intermediate/Skinning/OGLES2/VertShader.vsc" && \
		cp "$(PVRSDKDIR)/Examples/Intermediate/Skinning/OGLES2/VertShader.vsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/man.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/Skinning/OGLES2/man.pod
	cp "$(PVRSDKDIR)/Examples/Intermediate/Skinning/OGLES2/man.pod"	"$(ASSETDIR)/" 



