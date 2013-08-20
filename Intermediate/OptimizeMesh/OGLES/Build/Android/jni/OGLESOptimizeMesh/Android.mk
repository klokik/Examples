LOCAL_PATH := $(realpath $(call my-dir)/../../../../../../../..)
PVRSDKDIR := $(LOCAL_PATH)

ASSETDIR := $(PVRSDKDIR)/Examples/Intermediate/OptimizeMesh/OGLES/Build/Android/assets

include $(CLEAR_VARS)

LOCAL_MODULE    := OGLESOptimizeMesh

### Add all source file names to be included in lib separated by a whitespace
LOCAL_SRC_FILES := \
				   Examples/Intermediate/OptimizeMesh/OGLES/OGLESOptimizeMesh.cpp \
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
.PHONY :

$(PVRSDKDIR)/Examples/Intermediate/OptimizeMesh/OGLES/OGLESOptimizeMesh.cpp:  \
								$(ASSETDIR)/Satyr.pod \
								$(ASSETDIR)/SatyrOpt.pod

$(ASSETDIR):
	-mkdir $(ASSETDIR)

$(ASSETDIR)/Satyr.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/OptimizeMesh/OGLES/Satyr.pod
	cp "$(PVRSDKDIR)/Examples/Intermediate/OptimizeMesh/OGLES/Satyr.pod"	"$(ASSETDIR)/" 

$(ASSETDIR)/SatyrOpt.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Intermediate/OptimizeMesh/OGLES/SatyrOpt.pod
	cp "$(PVRSDKDIR)/Examples/Intermediate/OptimizeMesh/OGLES/SatyrOpt.pod"	"$(ASSETDIR)/" 



