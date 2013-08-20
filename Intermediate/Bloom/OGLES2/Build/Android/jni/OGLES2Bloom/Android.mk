LOCAL_PATH := $(realpath $(call my-dir)/../../../../../../../..)
PVRSDKDIR := $(LOCAL_PATH)

ASSETDIR := $(PVRSDKDIR)/Examples/Intermediate/Bloom/OGLES2/Build/Android/assets

include $(CLEAR_VARS)

LOCAL_MODULE    := OGLES2Bloom

### Add all source file names to be included in lib separated by a whitespace
LOCAL_SRC_FILES := \
				   Examples/Intermediate/Bloom/OGLES2/OGLES2Bloom.cpp \
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

$(PVRSDKDIR)/Examples/Intermediate/Bloom/OGLES2/OGLES2Bloom.cpp:  \
								$(ASSETDIR)/Mask.pod \
								$(ASSETDIR)/BaseTex.pvr \
								$(ASSETDIR)/bloom_mapping.pvr \
								$(ASSETDIR)/PostBloomFragShader.fsh \
								$(ASSETDIR)/PostBloomVertShader.vsh \
								$(ASSETDIR)/PreBloomFragShader.fsh \
								$(ASSETDIR)/PreBloomVertShader.vsh \
								$(ASSETDIR)/BlurFragShader.fsh \
								$(ASSETDIR)/BlurVertShader.vsh \
								$(ASSETDIR)/FragShader.fsh \
								$(ASSETDIR)/VertShader.vsh

$(ASSETDIR):
	-mkdir $(ASSETDIR)

$(ASSETDIR)/BaseTex.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/Bloom/OGLES2/BaseTex.pvr
	cp "$(PVRSDKDIR)/Examples/Intermediate/Bloom/OGLES2/BaseTex.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/bloom_mapping.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/Bloom/OGLES2/bloom_mapping.pvr
	cp "$(PVRSDKDIR)/Examples/Intermediate/Bloom/OGLES2/bloom_mapping.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/PostBloomFragShader.fsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/Bloom/OGLES2/PostBloomFragShader.fsh
	cp "$(PVRSDKDIR)/Examples/Intermediate/Bloom/OGLES2/PostBloomFragShader.fsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Intermediate/Bloom/OGLES2/PostBloomFragShader.fsc" && \
		cp "$(PVRSDKDIR)/Examples/Intermediate/Bloom/OGLES2/PostBloomFragShader.fsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/PostBloomVertShader.vsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/Bloom/OGLES2/PostBloomVertShader.vsh
	cp "$(PVRSDKDIR)/Examples/Intermediate/Bloom/OGLES2/PostBloomVertShader.vsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Intermediate/Bloom/OGLES2/PostBloomVertShader.vsc" && \
		cp "$(PVRSDKDIR)/Examples/Intermediate/Bloom/OGLES2/PostBloomVertShader.vsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/PreBloomFragShader.fsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/Bloom/OGLES2/PreBloomFragShader.fsh
	cp "$(PVRSDKDIR)/Examples/Intermediate/Bloom/OGLES2/PreBloomFragShader.fsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Intermediate/Bloom/OGLES2/PreBloomFragShader.fsc" && \
		cp "$(PVRSDKDIR)/Examples/Intermediate/Bloom/OGLES2/PreBloomFragShader.fsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/PreBloomVertShader.vsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/Bloom/OGLES2/PreBloomVertShader.vsh
	cp "$(PVRSDKDIR)/Examples/Intermediate/Bloom/OGLES2/PreBloomVertShader.vsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Intermediate/Bloom/OGLES2/PreBloomVertShader.vsc" && \
		cp "$(PVRSDKDIR)/Examples/Intermediate/Bloom/OGLES2/PreBloomVertShader.vsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/BlurFragShader.fsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/Bloom/OGLES2/BlurFragShader.fsh
	cp "$(PVRSDKDIR)/Examples/Intermediate/Bloom/OGLES2/BlurFragShader.fsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Intermediate/Bloom/OGLES2/BlurFragShader.fsc" && \
		cp "$(PVRSDKDIR)/Examples/Intermediate/Bloom/OGLES2/BlurFragShader.fsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/BlurVertShader.vsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/Bloom/OGLES2/BlurVertShader.vsh
	cp "$(PVRSDKDIR)/Examples/Intermediate/Bloom/OGLES2/BlurVertShader.vsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Intermediate/Bloom/OGLES2/BlurVertShader.vsc" && \
		cp "$(PVRSDKDIR)/Examples/Intermediate/Bloom/OGLES2/BlurVertShader.vsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/FragShader.fsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/Bloom/OGLES2/FragShader.fsh
	cp "$(PVRSDKDIR)/Examples/Intermediate/Bloom/OGLES2/FragShader.fsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Intermediate/Bloom/OGLES2/FragShader.fsc" && \
		cp "$(PVRSDKDIR)/Examples/Intermediate/Bloom/OGLES2/FragShader.fsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/VertShader.vsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/Bloom/OGLES2/VertShader.vsh
	cp "$(PVRSDKDIR)/Examples/Intermediate/Bloom/OGLES2/VertShader.vsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Intermediate/Bloom/OGLES2/VertShader.vsc" && \
		cp "$(PVRSDKDIR)/Examples/Intermediate/Bloom/OGLES2/VertShader.vsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/Mask.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/Bloom/OGLES2/Mask.pod
	cp "$(PVRSDKDIR)/Examples/Intermediate/Bloom/OGLES2/Mask.pod"	"$(ASSETDIR)/" 



