LOCAL_PATH := $(realpath $(call my-dir)/../../../../../../../..)
PVRSDKDIR := $(LOCAL_PATH)

ASSETDIR := $(PVRSDKDIR)/Examples/Advanced/PhantomMask/OGLES2/Build/Android/assets

include $(CLEAR_VARS)

LOCAL_MODULE    := OGLES2PhantomMask

### Add all source file names to be included in lib separated by a whitespace
LOCAL_SRC_FILES := \
				   Examples/Advanced/PhantomMask/OGLES2/OGLES2PhantomMask.cpp \
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

$(PVRSDKDIR)/Examples/Advanced/PhantomMask/OGLES2/OGLES2PhantomMask.cpp:  \
								$(ASSETDIR)/PhantomMask.pod \
								$(ASSETDIR)/MaskMain.pvr \
								$(ASSETDIR)/RoomStill.pvr \
								$(ASSETDIR)/FragShader.fsh \
								$(ASSETDIR)/SHVertShader.vsh \
								$(ASSETDIR)/DiffuseVertShader.vsh

$(ASSETDIR):
	-mkdir $(ASSETDIR)

$(ASSETDIR)/MaskMain.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/PhantomMask/OGLES2/MaskMain.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/PhantomMask/OGLES2/MaskMain.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/RoomStill.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/PhantomMask/OGLES2/RoomStill.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/PhantomMask/OGLES2/RoomStill.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/FragShader.fsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/PhantomMask/OGLES2/FragShader.fsh
	cp "$(PVRSDKDIR)/Examples/Advanced/PhantomMask/OGLES2/FragShader.fsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Advanced/PhantomMask/OGLES2/FragShader.fsc" && \
		cp "$(PVRSDKDIR)/Examples/Advanced/PhantomMask/OGLES2/FragShader.fsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/SHVertShader.vsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/PhantomMask/OGLES2/SHVertShader.vsh
	cp "$(PVRSDKDIR)/Examples/Advanced/PhantomMask/OGLES2/SHVertShader.vsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Advanced/PhantomMask/OGLES2/SHVertShader.vsc" && \
		cp "$(PVRSDKDIR)/Examples/Advanced/PhantomMask/OGLES2/SHVertShader.vsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/DiffuseVertShader.vsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/PhantomMask/OGLES2/DiffuseVertShader.vsh
	cp "$(PVRSDKDIR)/Examples/Advanced/PhantomMask/OGLES2/DiffuseVertShader.vsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Advanced/PhantomMask/OGLES2/DiffuseVertShader.vsc" && \
		cp "$(PVRSDKDIR)/Examples/Advanced/PhantomMask/OGLES2/DiffuseVertShader.vsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/PhantomMask.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/PhantomMask/OGLES2/PhantomMask.pod
	cp "$(PVRSDKDIR)/Examples/Advanced/PhantomMask/OGLES2/PhantomMask.pod"	"$(ASSETDIR)/" 



