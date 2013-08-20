LOCAL_PATH := $(realpath $(call my-dir)/../../../../../../../..)
PVRSDKDIR := $(LOCAL_PATH)

ASSETDIR := $(PVRSDKDIR)/Examples/Advanced/FilmTV/OGLES/Build/Android/assets

include $(CLEAR_VARS)

LOCAL_MODULE    := OGLESFilmTV

### Add all source file names to be included in lib separated by a whitespace
LOCAL_SRC_FILES := \
				   Examples/Advanced/FilmTV/OGLES/OGLESFilmTV.cpp \
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

$(PVRSDKDIR)/Examples/Advanced/FilmTV/OGLES/OGLESFilmTV.cpp:  \
								$(ASSETDIR)/FilmTVScene.pod \
								$(ASSETDIR)/Table.pvr \
								$(ASSETDIR)/Floor.pvr \
								$(ASSETDIR)/Wall.pvr \
								$(ASSETDIR)/TV.pvr \
								$(ASSETDIR)/TVCase.pvr \
								$(ASSETDIR)/TVSpeaker.pvr \
								$(ASSETDIR)/Alum.pvr \
								$(ASSETDIR)/Skirting.pvr \
								$(ASSETDIR)/Camera.pvr

$(ASSETDIR):
	-mkdir $(ASSETDIR)

$(ASSETDIR)/Table.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/FilmTV/OGLES/Table.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/FilmTV/OGLES/Table.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Floor.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/FilmTV/OGLES/Floor.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/FilmTV/OGLES/Floor.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Wall.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/FilmTV/OGLES/Wall.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/FilmTV/OGLES/Wall.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/TV.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/FilmTV/OGLES/TV.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/FilmTV/OGLES/TV.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/TVCase.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/FilmTV/OGLES/TVCase.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/FilmTV/OGLES/TVCase.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/TVSpeaker.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/FilmTV/OGLES/TVSpeaker.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/FilmTV/OGLES/TVSpeaker.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Alum.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/FilmTV/OGLES/Alum.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/FilmTV/OGLES/Alum.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Skirting.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/FilmTV/OGLES/Skirting.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/FilmTV/OGLES/Skirting.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Camera.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/FilmTV/OGLES/Camera.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/FilmTV/OGLES/Camera.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/FilmTVScene.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/FilmTV/OGLES/FilmTVScene.pod
	cp "$(PVRSDKDIR)/Examples/Advanced/FilmTV/OGLES/FilmTVScene.pod"	"$(ASSETDIR)/" 



