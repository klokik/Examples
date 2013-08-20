LOCAL_PATH := $(realpath $(call my-dir)/../../../../../../../..)
PVRSDKDIR := $(LOCAL_PATH)

ASSETDIR := $(PVRSDKDIR)/Examples/Advanced/EvilSkull/OGLES/Build/Android/assets

include $(CLEAR_VARS)

LOCAL_MODULE    := OGLESEvilSkull

### Add all source file names to be included in lib separated by a whitespace
LOCAL_SRC_FILES := \
				   Examples/Advanced/EvilSkull/OGLES/OGLESEvilSkull.cpp \
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

$(PVRSDKDIR)/Examples/Advanced/EvilSkull/OGLES/OGLESEvilSkull.cpp:  \
								$(ASSETDIR)/EvilSkull.pod \
								$(ASSETDIR)/Iris.pvr \
								$(ASSETDIR)/Metal.pvr \
								$(ASSETDIR)/Fire02.pvr \
								$(ASSETDIR)/Fire03.pvr

$(ASSETDIR):
	-mkdir $(ASSETDIR)

$(ASSETDIR)/Iris.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/EvilSkull/OGLES/Iris.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/EvilSkull/OGLES/Iris.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Metal.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/EvilSkull/OGLES/Metal.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/EvilSkull/OGLES/Metal.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Fire02.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/EvilSkull/OGLES/Fire02.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/EvilSkull/OGLES/Fire02.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Fire03.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/EvilSkull/OGLES/Fire03.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/EvilSkull/OGLES/Fire03.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/EvilSkull.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/EvilSkull/OGLES/EvilSkull.pod
	cp "$(PVRSDKDIR)/Examples/Advanced/EvilSkull/OGLES/EvilSkull.pod"	"$(ASSETDIR)/" 



