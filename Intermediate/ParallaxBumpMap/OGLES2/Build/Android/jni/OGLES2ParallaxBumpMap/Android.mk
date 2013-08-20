LOCAL_PATH := $(realpath $(call my-dir)/../../../../../../../..)
PVRSDKDIR := $(LOCAL_PATH)

ASSETDIR := $(PVRSDKDIR)/Examples/Intermediate/ParallaxBumpMap/OGLES2/Build/Android/assets

include $(CLEAR_VARS)

LOCAL_MODULE    := OGLES2ParallaxBumpMap

### Add all source file names to be included in lib separated by a whitespace
LOCAL_SRC_FILES := \
				   Examples/Intermediate/ParallaxBumpMap/OGLES2/OGLES2ParallaxBumpMap.cpp \
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

$(PVRSDKDIR)/Examples/Intermediate/ParallaxBumpMap/OGLES2/OGLES2ParallaxBumpMap.cpp:  \
								$(ASSETDIR)/Box.POD \
								$(ASSETDIR)/base_COLOR.pvr \
								$(ASSETDIR)/base_NRM.pvr \
								$(ASSETDIR)/base_DISP.pvr \
								$(ASSETDIR)/base_SPEC.pvr \
								$(ASSETDIR)/FragShader.fsh \
								$(ASSETDIR)/VertShader.vsh

$(ASSETDIR):
	-mkdir $(ASSETDIR)

$(ASSETDIR)/base_COLOR.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/ParallaxBumpMap/OGLES2/base_COLOR.pvr
	cp "$(PVRSDKDIR)/Examples/Intermediate/ParallaxBumpMap/OGLES2/base_COLOR.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/base_NRM.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/ParallaxBumpMap/OGLES2/base_NRM.pvr
	cp "$(PVRSDKDIR)/Examples/Intermediate/ParallaxBumpMap/OGLES2/base_NRM.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/base_DISP.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/ParallaxBumpMap/OGLES2/base_DISP.pvr
	cp "$(PVRSDKDIR)/Examples/Intermediate/ParallaxBumpMap/OGLES2/base_DISP.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/base_SPEC.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/ParallaxBumpMap/OGLES2/base_SPEC.pvr
	cp "$(PVRSDKDIR)/Examples/Intermediate/ParallaxBumpMap/OGLES2/base_SPEC.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/FragShader.fsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/ParallaxBumpMap/OGLES2/FragShader.fsh
	cp "$(PVRSDKDIR)/Examples/Intermediate/ParallaxBumpMap/OGLES2/FragShader.fsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Intermediate/ParallaxBumpMap/OGLES2/FragShader.fsc" && \
		cp "$(PVRSDKDIR)/Examples/Intermediate/ParallaxBumpMap/OGLES2/FragShader.fsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/VertShader.vsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/ParallaxBumpMap/OGLES2/VertShader.vsh
	cp "$(PVRSDKDIR)/Examples/Intermediate/ParallaxBumpMap/OGLES2/VertShader.vsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Intermediate/ParallaxBumpMap/OGLES2/VertShader.vsc" && \
		cp "$(PVRSDKDIR)/Examples/Intermediate/ParallaxBumpMap/OGLES2/VertShader.vsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/Box.POD: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/ParallaxBumpMap/OGLES2/Box.POD
	cp "$(PVRSDKDIR)/Examples/Intermediate/ParallaxBumpMap/OGLES2/Box.POD"	"$(ASSETDIR)/" 



