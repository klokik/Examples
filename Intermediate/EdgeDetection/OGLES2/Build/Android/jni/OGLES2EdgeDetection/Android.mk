LOCAL_PATH := $(realpath $(call my-dir)/../../../../../../../..)
PVRSDKDIR := $(LOCAL_PATH)

ASSETDIR := $(PVRSDKDIR)/Examples/Intermediate/EdgeDetection/OGLES2/Build/Android/assets

include $(CLEAR_VARS)

LOCAL_MODULE    := OGLES2EdgeDetection

### Add all source file names to be included in lib separated by a whitespace
LOCAL_SRC_FILES := \
				   Examples/Intermediate/EdgeDetection/OGLES2/OGLES2EdgeDetection.cpp \
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
.PHONY : build_shaders

$(PVRSDKDIR)/Examples/Intermediate/EdgeDetection/OGLES2/OGLES2EdgeDetection.cpp:  \
								$(ASSETDIR)/SketchObject.pod \
								$(ASSETDIR)/PreFragShader.fsh \
								$(ASSETDIR)/PreVertShader.vsh \
								$(ASSETDIR)/PostFragShader.fsh \
								$(ASSETDIR)/PostVertShader.vsh

$(ASSETDIR):
	-mkdir $(ASSETDIR)

$(ASSETDIR)/PreFragShader.fsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/EdgeDetection/OGLES2/PreFragShader.fsh
	cp "$(PVRSDKDIR)/Examples/Intermediate/EdgeDetection/OGLES2/PreFragShader.fsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Intermediate/EdgeDetection/OGLES2/PreFragShader.fsc" && \
		cp "$(PVRSDKDIR)/Examples/Intermediate/EdgeDetection/OGLES2/PreFragShader.fsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/PreVertShader.vsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/EdgeDetection/OGLES2/PreVertShader.vsh
	cp "$(PVRSDKDIR)/Examples/Intermediate/EdgeDetection/OGLES2/PreVertShader.vsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Intermediate/EdgeDetection/OGLES2/PreVertShader.vsc" && \
		cp "$(PVRSDKDIR)/Examples/Intermediate/EdgeDetection/OGLES2/PreVertShader.vsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/PostFragShader.fsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/EdgeDetection/OGLES2/PostFragShader.fsh
	cp "$(PVRSDKDIR)/Examples/Intermediate/EdgeDetection/OGLES2/PostFragShader.fsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Intermediate/EdgeDetection/OGLES2/PostFragShader.fsc" && \
		cp "$(PVRSDKDIR)/Examples/Intermediate/EdgeDetection/OGLES2/PostFragShader.fsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/PostVertShader.vsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/EdgeDetection/OGLES2/PostVertShader.vsh
	cp "$(PVRSDKDIR)/Examples/Intermediate/EdgeDetection/OGLES2/PostVertShader.vsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Intermediate/EdgeDetection/OGLES2/PostVertShader.vsc" && \
		cp "$(PVRSDKDIR)/Examples/Intermediate/EdgeDetection/OGLES2/PostVertShader.vsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/SketchObject.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/EdgeDetection/OGLES2/SketchObject.pod
	cp "$(PVRSDKDIR)/Examples/Intermediate/EdgeDetection/OGLES2/SketchObject.pod"	"$(ASSETDIR)/" 



