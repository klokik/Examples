LOCAL_PATH := $(realpath $(call my-dir)/../../../../../../../..)
PVRSDKDIR := $(LOCAL_PATH)

ASSETDIR := $(PVRSDKDIR)/Examples/Advanced/Skybox/OGLES/Build/Android/assets

include $(CLEAR_VARS)

LOCAL_MODULE    := OGLESSkybox

### Add all source file names to be included in lib separated by a whitespace
LOCAL_SRC_FILES := \
				   Examples/Advanced/Skybox/OGLES/OGLESSkybox.cpp \
				   Shell/PVRShell.cpp \
				   Shell/API/KEGL/PVRShellAPI.cpp \
				   Shell/OS/Android/PVRShellOS.cpp

LOCAL_C_INCLUDES :=	\
				    $(PVRSDKDIR)/Shell	\
				    $(PVRSDKDIR)/Shell/API/KEGL	\
				    $(PVRSDKDIR)/Shell/OS/Android	\
				    $(PVRSDKDIR)/Builds/Include	\
				    $(PVRSDKDIR)/Tools	\
				    $(PVRSDKDIR)/Tools/OGLES

LOCAL_CFLAGS := -DBUILD_OGLES


LOCAL_LDLIBS :=  \
				-llog \
				-landroid \
				-lEGL \
				-lGLESv1_CM

LOCAL_STATIC_LIBRARIES := \
				          android_native_app_glue \
				          oglestools 

include $(BUILD_SHARED_LIBRARY)

$(call import-module,android/native_app_glue)

### Copy our external files to the assets folder
.PHONY : build_textures

$(PVRSDKDIR)/Examples/Advanced/Skybox/OGLES/OGLESSkybox.cpp:  \
								$(ASSETDIR)/HotAirBalloon.pod \
								$(ASSETDIR)/balloon.pvr \
								$(ASSETDIR)/skybox1.pvr \
								$(ASSETDIR)/skybox2.pvr \
								$(ASSETDIR)/skybox3.pvr \
								$(ASSETDIR)/skybox4.pvr \
								$(ASSETDIR)/skybox5.pvr \
								$(ASSETDIR)/skybox6.pvr

$(ASSETDIR):
	-mkdir $(ASSETDIR)

$(ASSETDIR)/balloon.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Skybox/OGLES/balloon.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Skybox/OGLES/balloon.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/skybox1.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Skybox/OGLES/skybox1.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Skybox/OGLES/skybox1.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/skybox2.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Skybox/OGLES/skybox2.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Skybox/OGLES/skybox2.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/skybox3.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Skybox/OGLES/skybox3.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Skybox/OGLES/skybox3.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/skybox4.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Skybox/OGLES/skybox4.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Skybox/OGLES/skybox4.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/skybox5.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Skybox/OGLES/skybox5.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Skybox/OGLES/skybox5.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/skybox6.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Skybox/OGLES/skybox6.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Skybox/OGLES/skybox6.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/HotAirBalloon.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Skybox/OGLES/HotAirBalloon.pod
	cp "$(PVRSDKDIR)/Examples/Advanced/Skybox/OGLES/HotAirBalloon.pod"	"$(ASSETDIR)/" 



