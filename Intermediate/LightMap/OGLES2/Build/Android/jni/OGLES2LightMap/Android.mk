LOCAL_PATH := $(realpath $(call my-dir)/../../../../../../../..)
PVRSDKDIR := $(LOCAL_PATH)

ASSETDIR := $(PVRSDKDIR)/Examples/Intermediate/LightMap/OGLES2/Build/Android/assets

include $(CLEAR_VARS)

LOCAL_MODULE    := OGLES2LightMap

### Add all source file names to be included in lib separated by a whitespace
LOCAL_SRC_FILES := \
				   Examples/Intermediate/LightMap/OGLES2/OGLES2LightMap.cpp \
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

$(PVRSDKDIR)/Examples/Intermediate/LightMap/OGLES2/OGLES2LightMap.cpp:  \
								$(ASSETDIR)/Mask.pod \
								$(ASSETDIR)/Plane.pod \
								$(ASSETDIR)/Basetex.pvr \
								$(ASSETDIR)/Reflection.pvr \
								$(ASSETDIR)/Shadow.pvr \
								$(ASSETDIR)/FragShader.fsh \
								$(ASSETDIR)/VertShader.vsh

$(ASSETDIR):
	-mkdir $(ASSETDIR)

$(ASSETDIR)/Basetex.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/LightMap/OGLES2/Basetex.pvr
	cp "$(PVRSDKDIR)/Examples/Intermediate/LightMap/OGLES2/Basetex.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Reflection.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/LightMap/OGLES2/Reflection.pvr
	cp "$(PVRSDKDIR)/Examples/Intermediate/LightMap/OGLES2/Reflection.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Shadow.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/LightMap/OGLES2/Shadow.pvr
	cp "$(PVRSDKDIR)/Examples/Intermediate/LightMap/OGLES2/Shadow.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/FragShader.fsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/LightMap/OGLES2/FragShader.fsh
	cp "$(PVRSDKDIR)/Examples/Intermediate/LightMap/OGLES2/FragShader.fsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Intermediate/LightMap/OGLES2/FragShader.fsc" && \
		cp "$(PVRSDKDIR)/Examples/Intermediate/LightMap/OGLES2/FragShader.fsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/VertShader.vsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/LightMap/OGLES2/VertShader.vsh
	cp "$(PVRSDKDIR)/Examples/Intermediate/LightMap/OGLES2/VertShader.vsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Intermediate/LightMap/OGLES2/VertShader.vsc" && \
		cp "$(PVRSDKDIR)/Examples/Intermediate/LightMap/OGLES2/VertShader.vsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/Mask.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/LightMap/OGLES2/Mask.pod
	cp "$(PVRSDKDIR)/Examples/Intermediate/LightMap/OGLES2/Mask.pod"	"$(ASSETDIR)/" 

$(ASSETDIR)/Plane.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/LightMap/OGLES2/Plane.pod
	cp "$(PVRSDKDIR)/Examples/Intermediate/LightMap/OGLES2/Plane.pod"	"$(ASSETDIR)/" 



