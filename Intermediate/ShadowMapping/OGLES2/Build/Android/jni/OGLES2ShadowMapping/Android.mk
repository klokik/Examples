LOCAL_PATH := $(realpath $(call my-dir)/../../../../../../../..)
PVRSDKDIR := $(LOCAL_PATH)

ASSETDIR := $(PVRSDKDIR)/Examples/Intermediate/ShadowMapping/OGLES2/Build/Android/assets

include $(CLEAR_VARS)

LOCAL_MODULE    := OGLES2ShadowMapping

### Add all source file names to be included in lib separated by a whitespace
LOCAL_SRC_FILES := \
				   Examples/Intermediate/ShadowMapping/OGLES2/OGLES2ShadowMapping.cpp \
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

$(PVRSDKDIR)/Examples/Intermediate/ShadowMapping/OGLES2/OGLES2ShadowMapping.cpp:  \
								$(ASSETDIR)/Scene.pod \
								$(ASSETDIR)/Mask.pvr \
								$(ASSETDIR)/TableCover.pvr \
								$(ASSETDIR)/Torus.pvr \
								$(ASSETDIR)/FragShader.fsh \
								$(ASSETDIR)/VertShader.vsh \
								$(ASSETDIR)/ShadowFragShader.fsh \
								$(ASSETDIR)/ShadowVertShader.vsh

$(ASSETDIR):
	-mkdir $(ASSETDIR)

$(ASSETDIR)/Mask.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/ShadowMapping/OGLES2/Mask.pvr
	cp "$(PVRSDKDIR)/Examples/Intermediate/ShadowMapping/OGLES2/Mask.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/TableCover.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/ShadowMapping/OGLES2/TableCover.pvr
	cp "$(PVRSDKDIR)/Examples/Intermediate/ShadowMapping/OGLES2/TableCover.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Torus.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/ShadowMapping/OGLES2/Torus.pvr
	cp "$(PVRSDKDIR)/Examples/Intermediate/ShadowMapping/OGLES2/Torus.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/FragShader.fsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/ShadowMapping/OGLES2/FragShader.fsh
	cp "$(PVRSDKDIR)/Examples/Intermediate/ShadowMapping/OGLES2/FragShader.fsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Intermediate/ShadowMapping/OGLES2/FragShader.fsc" && \
		cp "$(PVRSDKDIR)/Examples/Intermediate/ShadowMapping/OGLES2/FragShader.fsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/VertShader.vsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/ShadowMapping/OGLES2/VertShader.vsh
	cp "$(PVRSDKDIR)/Examples/Intermediate/ShadowMapping/OGLES2/VertShader.vsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Intermediate/ShadowMapping/OGLES2/VertShader.vsc" && \
		cp "$(PVRSDKDIR)/Examples/Intermediate/ShadowMapping/OGLES2/VertShader.vsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/ShadowFragShader.fsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/ShadowMapping/OGLES2/ShadowFragShader.fsh
	cp "$(PVRSDKDIR)/Examples/Intermediate/ShadowMapping/OGLES2/ShadowFragShader.fsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Intermediate/ShadowMapping/OGLES2/ShadowFragShader.fsc" && \
		cp "$(PVRSDKDIR)/Examples/Intermediate/ShadowMapping/OGLES2/ShadowFragShader.fsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/ShadowVertShader.vsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/ShadowMapping/OGLES2/ShadowVertShader.vsh
	cp "$(PVRSDKDIR)/Examples/Intermediate/ShadowMapping/OGLES2/ShadowVertShader.vsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Intermediate/ShadowMapping/OGLES2/ShadowVertShader.vsc" && \
		cp "$(PVRSDKDIR)/Examples/Intermediate/ShadowMapping/OGLES2/ShadowVertShader.vsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/Scene.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/ShadowMapping/OGLES2/Scene.pod
	cp "$(PVRSDKDIR)/Examples/Intermediate/ShadowMapping/OGLES2/Scene.pod"	"$(ASSETDIR)/" 



