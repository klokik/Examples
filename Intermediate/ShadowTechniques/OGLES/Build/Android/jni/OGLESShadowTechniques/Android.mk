LOCAL_PATH := $(realpath $(call my-dir)/../../../../../../../..)
PVRSDKDIR := $(LOCAL_PATH)

ASSETDIR := $(PVRSDKDIR)/Examples/Intermediate/ShadowTechniques/OGLES/Build/Android/assets

include $(CLEAR_VARS)

LOCAL_MODULE    := OGLESShadowTechniques

### Add all source file names to be included in lib separated by a whitespace
LOCAL_SRC_FILES := \
				   Examples/Intermediate/ShadowTechniques/OGLES/OGLESShadowTechniques.cpp \
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

$(PVRSDKDIR)/Examples/Intermediate/ShadowTechniques/OGLES/OGLESShadowTechniques.cpp:  \
								$(ASSETDIR)/Scene.pod \
								$(ASSETDIR)/Blob.pvr \
								$(ASSETDIR)/TableCover.pvr \
								$(ASSETDIR)/Kettle.pvr

$(ASSETDIR):
	-mkdir $(ASSETDIR)

$(ASSETDIR)/Blob.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/ShadowTechniques/OGLES/Blob.pvr
	cp "$(PVRSDKDIR)/Examples/Intermediate/ShadowTechniques/OGLES/Blob.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/TableCover.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/ShadowTechniques/OGLES/TableCover.pvr
	cp "$(PVRSDKDIR)/Examples/Intermediate/ShadowTechniques/OGLES/TableCover.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Kettle.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/ShadowTechniques/OGLES/Kettle.pvr
	cp "$(PVRSDKDIR)/Examples/Intermediate/ShadowTechniques/OGLES/Kettle.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Scene.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/ShadowTechniques/OGLES/Scene.pod
	cp "$(PVRSDKDIR)/Examples/Intermediate/ShadowTechniques/OGLES/Scene.pod"	"$(ASSETDIR)/" 



