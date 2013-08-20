LOCAL_PATH := $(realpath $(call my-dir)/../../../../../../../..)
PVRSDKDIR := $(LOCAL_PATH)

ASSETDIR := $(PVRSDKDIR)/Examples/Advanced/Fur/OGLES/Build/Android/assets

include $(CLEAR_VARS)

LOCAL_MODULE    := OGLESFur

### Add all source file names to be included in lib separated by a whitespace
LOCAL_SRC_FILES := \
				   Examples/Advanced/Fur/OGLES/OGLESFur.cpp \
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

$(PVRSDKDIR)/Examples/Advanced/Fur/OGLES/OGLESFur.cpp:  \
								$(ASSETDIR)/Scene.pod \
								$(ASSETDIR)/tBridge.pvr \
								$(ASSETDIR)/tGrass.pvr \
								$(ASSETDIR)/tSkin.pvr \
								$(ASSETDIR)/tWater.pvr \
								$(ASSETDIR)/tCloud.pvr \
								$(ASSETDIR)/tFur.pvr

$(ASSETDIR):
	-mkdir $(ASSETDIR)

$(ASSETDIR)/tBridge.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Fur/OGLES/tBridge.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Fur/OGLES/tBridge.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/tGrass.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Fur/OGLES/tGrass.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Fur/OGLES/tGrass.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/tSkin.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Fur/OGLES/tSkin.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Fur/OGLES/tSkin.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/tWater.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Fur/OGLES/tWater.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Fur/OGLES/tWater.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/tCloud.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Fur/OGLES/tCloud.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Fur/OGLES/tCloud.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/tFur.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Fur/OGLES/tFur.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Fur/OGLES/tFur.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Scene.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Fur/OGLES/Scene.pod
	cp "$(PVRSDKDIR)/Examples/Advanced/Fur/OGLES/Scene.pod"	"$(ASSETDIR)/" 



