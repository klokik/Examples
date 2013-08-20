LOCAL_PATH := $(realpath $(call my-dir)/../../../../../../../..)
PVRSDKDIR := $(LOCAL_PATH)

ASSETDIR := $(PVRSDKDIR)/Examples/Advanced/PVRScopeRemote/OGLES2/BuildDeveloper/Android/assets

include $(CLEAR_VARS)

LOCAL_MODULE    := OGLES2PVRScopeRemote

### Add all source file names to be included in lib separated by a whitespace
LOCAL_SRC_FILES := \
				   Examples/Advanced/PVRScopeRemote/OGLES2/OGLES2PVRScopeRemote.cpp \
				   Shell/PVRShell.cpp \
				   Shell/API/KEGL/PVRShellAPI.cpp \
				   Shell/OS/Android/PVRShellOS.cpp

LOCAL_C_INCLUDES :=	\
				    $(PVRSDKDIR)/Builds/Include	\
				    $(PVRSDKDIR)/Shell	\
				    $(PVRSDKDIR)/Shell/API/KEGL	\
				    $(PVRSDKDIR)/Shell/OS/Android	\
				    $(PVRSDKDIR)/Builds/Include	\
				    $(PVRSDKDIR)/Tools	\
				    $(PVRSDKDIR)/Tools/OGLES2

LOCAL_CFLAGS := -DBUILD_OGLES2


LOCAL_LDLIBS :=  \
				-L$(PVRSDKDIR)/Builds/Android/$(TARGET_ARCH_ABI)/Lib \
				-lPVRScopeDeveloper \
				-ldl \
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

$(PVRSDKDIR)/Examples/Advanced/PVRScopeRemote/OGLES2/OGLES2PVRScopeRemote.cpp:  \
								$(ASSETDIR)/Mask.pod \
								$(ASSETDIR)/Reflection.pvr \
								$(ASSETDIR)/Thickness.pvr \
								$(ASSETDIR)/FragShader.fsh \
								$(ASSETDIR)/VertShader.vsh

$(ASSETDIR):
	-mkdir $(ASSETDIR)

$(ASSETDIR)/Reflection.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/PVRScopeRemote/OGLES2/Reflection.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/PVRScopeRemote/OGLES2/Reflection.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Thickness.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/PVRScopeRemote/OGLES2/Thickness.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/PVRScopeRemote/OGLES2/Thickness.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/FragShader.fsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/PVRScopeRemote/OGLES2/FragShader.fsh
	cp "$(PVRSDKDIR)/Examples/Advanced/PVRScopeRemote/OGLES2/FragShader.fsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Advanced/PVRScopeRemote/OGLES2/FragShader.fsc" && \
		cp "$(PVRSDKDIR)/Examples/Advanced/PVRScopeRemote/OGLES2/FragShader.fsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/VertShader.vsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/PVRScopeRemote/OGLES2/VertShader.vsh
	cp "$(PVRSDKDIR)/Examples/Advanced/PVRScopeRemote/OGLES2/VertShader.vsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Advanced/PVRScopeRemote/OGLES2/VertShader.vsc" && \
		cp "$(PVRSDKDIR)/Examples/Advanced/PVRScopeRemote/OGLES2/VertShader.vsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/Mask.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/PVRScopeRemote/OGLES2/Mask.pod
	cp "$(PVRSDKDIR)/Examples/Advanced/PVRScopeRemote/OGLES2/Mask.pod"	"$(ASSETDIR)/" 



