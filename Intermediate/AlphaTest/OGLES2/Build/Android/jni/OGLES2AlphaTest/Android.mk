LOCAL_PATH := $(realpath $(call my-dir)/../../../../../../../..)
PVRSDKDIR := $(LOCAL_PATH)

ASSETDIR := $(PVRSDKDIR)/Examples/Intermediate/AlphaTest/OGLES2/Build/Android/assets

include $(CLEAR_VARS)

LOCAL_MODULE    := OGLES2AlphaTest

### Add all source file names to be included in lib separated by a whitespace
LOCAL_SRC_FILES := \
				   Examples/Intermediate/AlphaTest/OGLES2/OGLES2AlphaTest.cpp \
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

$(PVRSDKDIR)/Examples/Intermediate/AlphaTest/OGLES2/OGLES2AlphaTest.cpp:  \
								$(ASSETDIR)/Wallwire.pvr \
								$(ASSETDIR)/TexFragShader.fsh \
								$(ASSETDIR)/DiscardFragShader.fsh \
								$(ASSETDIR)/VertShader.vsh

$(ASSETDIR):
	-mkdir $(ASSETDIR)

$(ASSETDIR)/Wallwire.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/AlphaTest/OGLES2/Wallwire.pvr
	cp "$(PVRSDKDIR)/Examples/Intermediate/AlphaTest/OGLES2/Wallwire.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/TexFragShader.fsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/AlphaTest/OGLES2/TexFragShader.fsh
	cp "$(PVRSDKDIR)/Examples/Intermediate/AlphaTest/OGLES2/TexFragShader.fsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Intermediate/AlphaTest/OGLES2/TexFragShader.fsc" && \
		cp "$(PVRSDKDIR)/Examples/Intermediate/AlphaTest/OGLES2/TexFragShader.fsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/DiscardFragShader.fsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/AlphaTest/OGLES2/DiscardFragShader.fsh
	cp "$(PVRSDKDIR)/Examples/Intermediate/AlphaTest/OGLES2/DiscardFragShader.fsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Intermediate/AlphaTest/OGLES2/DiscardFragShader.fsc" && \
		cp "$(PVRSDKDIR)/Examples/Intermediate/AlphaTest/OGLES2/DiscardFragShader.fsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/VertShader.vsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/AlphaTest/OGLES2/VertShader.vsh
	cp "$(PVRSDKDIR)/Examples/Intermediate/AlphaTest/OGLES2/VertShader.vsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Intermediate/AlphaTest/OGLES2/VertShader.vsc" && \
		cp "$(PVRSDKDIR)/Examples/Intermediate/AlphaTest/OGLES2/VertShader.vsc"	"$(ASSETDIR)/" || true



