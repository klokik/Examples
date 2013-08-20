LOCAL_PATH := $(realpath $(call my-dir)/../../../../../../../..)
PVRSDKDIR := $(LOCAL_PATH)

ASSETDIR := $(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES/Build/Android/assets

include $(CLEAR_VARS)

LOCAL_MODULE    := OGLESCoverflow

### Add all source file names to be included in lib separated by a whitespace
LOCAL_SRC_FILES := \
				   Examples/Advanced/Coverflow/OGLES/OGLESCoverflow.cpp \
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

$(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES/OGLESCoverflow.cpp:  \
								$(ASSETDIR)/Album1.pvr \
								$(ASSETDIR)/Album2.pvr \
								$(ASSETDIR)/Album3.pvr \
								$(ASSETDIR)/Album4.pvr \
								$(ASSETDIR)/Album5.pvr \
								$(ASSETDIR)/Album6.pvr \
								$(ASSETDIR)/Album7.pvr \
								$(ASSETDIR)/Album8.pvr \
								$(ASSETDIR)/Album9.pvr \
								$(ASSETDIR)/Album10.pvr \
								$(ASSETDIR)/Album11.pvr \
								$(ASSETDIR)/Album12.pvr \
								$(ASSETDIR)/Album13.pvr \
								$(ASSETDIR)/Album14.pvr \
								$(ASSETDIR)/Album15.pvr \
								$(ASSETDIR)/Album16.pvr

$(ASSETDIR):
	-mkdir $(ASSETDIR)

$(ASSETDIR)/Album1.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES/Album1.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES/Album1.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Album2.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES/Album2.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES/Album2.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Album3.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES/Album3.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES/Album3.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Album4.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES/Album4.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES/Album4.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Album5.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES/Album5.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES/Album5.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Album6.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES/Album6.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES/Album6.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Album7.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES/Album7.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES/Album7.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Album8.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES/Album8.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES/Album8.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Album9.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES/Album9.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES/Album9.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Album10.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES/Album10.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES/Album10.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Album11.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES/Album11.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES/Album11.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Album12.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES/Album12.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES/Album12.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Album13.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES/Album13.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES/Album13.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Album14.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES/Album14.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES/Album14.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Album15.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES/Album15.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES/Album15.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Album16.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES/Album16.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES/Album16.pvr"	"$(ASSETDIR)/" 



