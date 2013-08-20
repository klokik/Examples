LOCAL_PATH := $(realpath $(call my-dir)/../../../../../../../..)
PVRSDKDIR := $(LOCAL_PATH)

ASSETDIR := $(PVRSDKDIR)/Examples/Advanced/FilmTV/OGLES2/Build/Android/assets

include $(CLEAR_VARS)

LOCAL_MODULE    := OGLES2FilmTV

### Add all source file names to be included in lib separated by a whitespace
LOCAL_SRC_FILES := \
				   Examples/Advanced/FilmTV/OGLES2/OGLES2FilmTV.cpp \
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

$(PVRSDKDIR)/Examples/Advanced/FilmTV/OGLES2/OGLES2FilmTV.cpp:  \
								$(ASSETDIR)/FilmTVScene.pod \
								$(ASSETDIR)/Table.pvr \
								$(ASSETDIR)/Floor.pvr \
								$(ASSETDIR)/Wall.pvr \
								$(ASSETDIR)/TV.pvr \
								$(ASSETDIR)/TVCase.pvr \
								$(ASSETDIR)/TVSpeaker.pvr \
								$(ASSETDIR)/Alum.pvr \
								$(ASSETDIR)/Skirting.pvr \
								$(ASSETDIR)/Camera.pvr \
								$(ASSETDIR)/FragShader.fsh \
								$(ASSETDIR)/BWFragShader.fsh \
								$(ASSETDIR)/VertShader.vsh

$(ASSETDIR):
	-mkdir $(ASSETDIR)

$(ASSETDIR)/Table.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/FilmTV/OGLES2/Table.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/FilmTV/OGLES2/Table.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Floor.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/FilmTV/OGLES2/Floor.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/FilmTV/OGLES2/Floor.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Wall.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/FilmTV/OGLES2/Wall.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/FilmTV/OGLES2/Wall.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/TV.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/FilmTV/OGLES2/TV.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/FilmTV/OGLES2/TV.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/TVCase.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/FilmTV/OGLES2/TVCase.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/FilmTV/OGLES2/TVCase.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/TVSpeaker.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/FilmTV/OGLES2/TVSpeaker.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/FilmTV/OGLES2/TVSpeaker.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Alum.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/FilmTV/OGLES2/Alum.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/FilmTV/OGLES2/Alum.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Skirting.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/FilmTV/OGLES2/Skirting.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/FilmTV/OGLES2/Skirting.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Camera.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/FilmTV/OGLES2/Camera.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/FilmTV/OGLES2/Camera.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/FragShader.fsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/FilmTV/OGLES2/FragShader.fsh
	cp "$(PVRSDKDIR)/Examples/Advanced/FilmTV/OGLES2/FragShader.fsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Advanced/FilmTV/OGLES2/FragShader.fsc" && \
		cp "$(PVRSDKDIR)/Examples/Advanced/FilmTV/OGLES2/FragShader.fsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/BWFragShader.fsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/FilmTV/OGLES2/BWFragShader.fsh
	cp "$(PVRSDKDIR)/Examples/Advanced/FilmTV/OGLES2/BWFragShader.fsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Advanced/FilmTV/OGLES2/BWFragShader.fsc" && \
		cp "$(PVRSDKDIR)/Examples/Advanced/FilmTV/OGLES2/BWFragShader.fsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/VertShader.vsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/FilmTV/OGLES2/VertShader.vsh
	cp "$(PVRSDKDIR)/Examples/Advanced/FilmTV/OGLES2/VertShader.vsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Advanced/FilmTV/OGLES2/VertShader.vsc" && \
		cp "$(PVRSDKDIR)/Examples/Advanced/FilmTV/OGLES2/VertShader.vsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/FilmTVScene.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/FilmTV/OGLES2/FilmTVScene.pod
	cp "$(PVRSDKDIR)/Examples/Advanced/FilmTV/OGLES2/FilmTVScene.pod"	"$(ASSETDIR)/" 



