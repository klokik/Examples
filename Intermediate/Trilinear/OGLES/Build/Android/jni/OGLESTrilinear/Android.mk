LOCAL_PATH := $(realpath $(call my-dir)/../../../../../../../..)
PVRSDKDIR := $(LOCAL_PATH)

ASSETDIR := $(PVRSDKDIR)/Examples/Intermediate/Trilinear/OGLES/Build/Android/assets

include $(CLEAR_VARS)

LOCAL_MODULE    := OGLESTrilinear

### Add all source file names to be included in lib separated by a whitespace
LOCAL_SRC_FILES := \
				   Examples/Intermediate/Trilinear/OGLES/OGLESTrilinear.cpp \
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

$(PVRSDKDIR)/Examples/Intermediate/Trilinear/OGLES/OGLESTrilinear.cpp:  \
								$(ASSETDIR)/o_model.pod \
								$(ASSETDIR)/Back.pvr \
								$(ASSETDIR)/Tape.pvr \
								$(ASSETDIR)/Ball.pvr \
								$(ASSETDIR)/Info.pvr

$(ASSETDIR):
	-mkdir $(ASSETDIR)

$(ASSETDIR)/Back.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/Trilinear/OGLES/Back.pvr
	cp "$(PVRSDKDIR)/Examples/Intermediate/Trilinear/OGLES/Back.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Tape.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/Trilinear/OGLES/Tape.pvr
	cp "$(PVRSDKDIR)/Examples/Intermediate/Trilinear/OGLES/Tape.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Ball.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/Trilinear/OGLES/Ball.pvr
	cp "$(PVRSDKDIR)/Examples/Intermediate/Trilinear/OGLES/Ball.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Info.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/Trilinear/OGLES/Info.pvr
	cp "$(PVRSDKDIR)/Examples/Intermediate/Trilinear/OGLES/Info.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/o_model.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/Trilinear/OGLES/o_model.pod
	cp "$(PVRSDKDIR)/Examples/Intermediate/Trilinear/OGLES/o_model.pod"	"$(ASSETDIR)/" 



