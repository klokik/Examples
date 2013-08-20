LOCAL_PATH := $(realpath $(call my-dir)/../../../../../../../..)
PVRSDKDIR := $(LOCAL_PATH)

ASSETDIR := $(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES2/Build/Android/assets

include $(CLEAR_VARS)

LOCAL_MODULE    := OGLES2Coverflow

### Add all source file names to be included in lib separated by a whitespace
LOCAL_SRC_FILES := \
				   Examples/Advanced/Coverflow/OGLES2/OGLES2Coverflow.cpp \
				   Shell/PVRShell.cpp \
				   Shell/API/KEGL/PVRShellAPI.cpp \
				   Shell/OS/Android/PVRShellOS.cpp

LOCAL_C_INCLUDES :=	\
				    $(PVRSDKDIR)/Shell	\
				    $(PVRSDKDIR)/Shell/API/KEGL	\
				    $(PVRSDKDIR)/Shell/OS/Android	\
				    $(PVRSDKDIR)/Builds/Include	\
				    $(PVRSDKDIR)/Tools	\
				    $(PVRSDKDIR)/Tools/OGLES2

LOCAL_CFLAGS := -DBUILD_OGLES2


LOCAL_LDLIBS :=  \
				-llog \
				-landroid \
				-lEGL \
				-lGLESv2

LOCAL_STATIC_LIBRARIES := \
				          android_native_app_glue \
				          ogles2tools 

include $(BUILD_SHARED_LIBRARY)

$(call import-module,android/native_app_glue)

### Copy our external files to the assets folder
.PHONY : build_shaders build_textures

$(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES2/OGLES2Coverflow.cpp:  \
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
								$(ASSETDIR)/Album16.pvr \
								$(ASSETDIR)/FragShader.fsh \
								$(ASSETDIR)/VertShader.vsh

$(ASSETDIR):
	-mkdir $(ASSETDIR)

$(ASSETDIR)/Album1.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES2/Album1.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES2/Album1.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Album2.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES2/Album2.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES2/Album2.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Album3.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES2/Album3.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES2/Album3.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Album4.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES2/Album4.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES2/Album4.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Album5.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES2/Album5.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES2/Album5.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Album6.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES2/Album6.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES2/Album6.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Album7.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES2/Album7.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES2/Album7.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Album8.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES2/Album8.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES2/Album8.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Album9.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES2/Album9.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES2/Album9.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Album10.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES2/Album10.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES2/Album10.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Album11.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES2/Album11.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES2/Album11.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Album12.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES2/Album12.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES2/Album12.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Album13.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES2/Album13.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES2/Album13.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Album14.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES2/Album14.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES2/Album14.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Album15.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES2/Album15.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES2/Album15.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Album16.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES2/Album16.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES2/Album16.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/FragShader.fsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES2/FragShader.fsh
	cp "$(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES2/FragShader.fsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES2/FragShader.fsc" && \
		cp "$(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES2/FragShader.fsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/VertShader.vsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES2/VertShader.vsh
	cp "$(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES2/VertShader.vsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES2/VertShader.vsc" && \
		cp "$(PVRSDKDIR)/Examples/Advanced/Coverflow/OGLES2/VertShader.vsc"	"$(ASSETDIR)/" || true



