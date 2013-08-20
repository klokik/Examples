LOCAL_PATH := $(realpath $(call my-dir)/../../../../../../../..)
PVRSDKDIR := $(LOCAL_PATH)

ASSETDIR := $(PVRSDKDIR)/Examples/Intermediate/StencilBuffer/OGLES/Build/Android/assets

include $(CLEAR_VARS)

LOCAL_MODULE    := OGLESStencilBuffer

### Add all source file names to be included in lib separated by a whitespace
LOCAL_SRC_FILES := \
				   Examples/Intermediate/StencilBuffer/OGLES/OGLESStencilBuffer.cpp \
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

$(PVRSDKDIR)/Examples/Intermediate/StencilBuffer/OGLES/OGLESStencilBuffer.cpp:  \
								$(ASSETDIR)/Cylinder.pod \
								$(ASSETDIR)/Sphere.pod \
								$(ASSETDIR)/Lattice.pvr \
								$(ASSETDIR)/Stone.pvr \
								$(ASSETDIR)/Tile.pvr

$(ASSETDIR):
	-mkdir $(ASSETDIR)

$(ASSETDIR)/Lattice.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/StencilBuffer/OGLES/Lattice.pvr
	cp "$(PVRSDKDIR)/Examples/Intermediate/StencilBuffer/OGLES/Lattice.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Stone.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/StencilBuffer/OGLES/Stone.pvr
	cp "$(PVRSDKDIR)/Examples/Intermediate/StencilBuffer/OGLES/Stone.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Tile.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/StencilBuffer/OGLES/Tile.pvr
	cp "$(PVRSDKDIR)/Examples/Intermediate/StencilBuffer/OGLES/Tile.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Cylinder.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/StencilBuffer/OGLES/Cylinder.pod
	cp "$(PVRSDKDIR)/Examples/Intermediate/StencilBuffer/OGLES/Cylinder.pod"	"$(ASSETDIR)/" 

$(ASSETDIR)/Sphere.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/StencilBuffer/OGLES/Sphere.pod
	cp "$(PVRSDKDIR)/Examples/Intermediate/StencilBuffer/OGLES/Sphere.pod"	"$(ASSETDIR)/" 



