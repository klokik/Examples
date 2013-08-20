LOCAL_PATH := $(realpath $(call my-dir)/../../../../../../../..)
PVRSDKDIR := $(LOCAL_PATH)

ASSETDIR := $(PVRSDKDIR)/Examples/Advanced/Vase/OGLES/Build/Android/assets

include $(CLEAR_VARS)

LOCAL_MODULE    := OGLESVase

### Add all source file names to be included in lib separated by a whitespace
LOCAL_SRC_FILES := \
				   Examples/Advanced/Vase/OGLES/OGLESVase.cpp \
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

$(PVRSDKDIR)/Examples/Advanced/Vase/OGLES/OGLESVase.cpp:  \
								$(ASSETDIR)/Vase.pod \
								$(ASSETDIR)/Flora.pvr \
								$(ASSETDIR)/Backgrnd.pvr \
								$(ASSETDIR)/Reflection.pvr

$(ASSETDIR):
	-mkdir $(ASSETDIR)

$(ASSETDIR)/Flora.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Vase/OGLES/Flora.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Vase/OGLES/Flora.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Backgrnd.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Vase/OGLES/Backgrnd.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Vase/OGLES/Backgrnd.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Reflection.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Vase/OGLES/Reflection.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Vase/OGLES/Reflection.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Vase.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Vase/OGLES/Vase.pod
	cp "$(PVRSDKDIR)/Examples/Advanced/Vase/OGLES/Vase.pod"	"$(ASSETDIR)/" 



