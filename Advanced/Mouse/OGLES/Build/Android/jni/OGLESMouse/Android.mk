LOCAL_PATH := $(realpath $(call my-dir)/../../../../../../../..)
PVRSDKDIR := $(LOCAL_PATH)

ASSETDIR := $(PVRSDKDIR)/Examples/Advanced/Mouse/OGLES/Build/Android/assets

include $(CLEAR_VARS)

LOCAL_MODULE    := OGLESMouse

### Add all source file names to be included in lib separated by a whitespace
LOCAL_SRC_FILES := \
				   Examples/Advanced/Mouse/OGLES/OGLESMouse.cpp \
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

$(PVRSDKDIR)/Examples/Advanced/Mouse/OGLES/OGLESMouse.cpp:  \
								$(ASSETDIR)/Mouse.pod \
								$(ASSETDIR)/FloorToon.pvr \
								$(ASSETDIR)/MouseToon.pvr \
								$(ASSETDIR)/Toon.pvr \
								$(ASSETDIR)/WallToon.pvr

$(ASSETDIR):
	-mkdir $(ASSETDIR)

$(ASSETDIR)/FloorToon.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Mouse/OGLES/FloorToon.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Mouse/OGLES/FloorToon.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/MouseToon.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Mouse/OGLES/MouseToon.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Mouse/OGLES/MouseToon.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Toon.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Mouse/OGLES/Toon.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Mouse/OGLES/Toon.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/WallToon.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Mouse/OGLES/WallToon.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Mouse/OGLES/WallToon.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Mouse.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Mouse/OGLES/Mouse.pod
	cp "$(PVRSDKDIR)/Examples/Advanced/Mouse/OGLES/Mouse.pod"	"$(ASSETDIR)/" 



