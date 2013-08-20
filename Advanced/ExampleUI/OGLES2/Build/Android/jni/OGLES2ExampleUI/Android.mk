LOCAL_PATH := $(realpath $(call my-dir)/../../../../../../../..)
PVRSDKDIR := $(LOCAL_PATH)

ASSETDIR := $(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/Build/Android/assets

include $(CLEAR_VARS)

LOCAL_MODULE    := OGLES2ExampleUI

### Add all source file names to be included in lib separated by a whitespace
LOCAL_SRC_FILES := \
				   Examples/Advanced/ExampleUI/OGLES2/OGLES2ExampleUI.cpp \
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

$(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/OGLES2ExampleUI.cpp:  \
								$(ASSETDIR)/container-corner.pvr \
								$(ASSETDIR)/container-vertical.pvr \
								$(ASSETDIR)/container-horizontal.pvr \
								$(ASSETDIR)/topbar.pvr \
								$(ASSETDIR)/background.pvr \
								$(ASSETDIR)/clock-face.pvr \
								$(ASSETDIR)/clock-face-small.pvr \
								$(ASSETDIR)/hand.pvr \
								$(ASSETDIR)/hand-small.pvr \
								$(ASSETDIR)/battery.pvr \
								$(ASSETDIR)/internet-web-browser.pvr \
								$(ASSETDIR)/mail-message-new.pvr \
								$(ASSETDIR)/network-wireless.pvr \
								$(ASSETDIR)/office-calendar.pvr \
								$(ASSETDIR)/weather-sun-cloud.pvr \
								$(ASSETDIR)/weather-storm.pvr \
								$(ASSETDIR)/weather-rain.pvr \
								$(ASSETDIR)/text1.pvr \
								$(ASSETDIR)/text2.pvr \
								$(ASSETDIR)/text-weather.pvr \
								$(ASSETDIR)/text-fri.pvr \
								$(ASSETDIR)/text-sat.pvr \
								$(ASSETDIR)/text-sun.pvr \
								$(ASSETDIR)/text-mon.pvr \
								$(ASSETDIR)/weather-sun-cloud-big.pvr \
								$(ASSETDIR)/window-bottom.pvr \
								$(ASSETDIR)/window-bottomcorner.pvr \
								$(ASSETDIR)/window-side.pvr \
								$(ASSETDIR)/window-top.pvr \
								$(ASSETDIR)/window-topleft.pvr \
								$(ASSETDIR)/window-topright.pvr \
								$(ASSETDIR)/loremipsum.pvr \
								$(ASSETDIR)/SpriteShaderF.fsh \
								$(ASSETDIR)/SpriteShaderV.vsh \
								$(ASSETDIR)/TexColShaderF.fsh \
								$(ASSETDIR)/TexColShaderV.vsh \
								$(ASSETDIR)/ColShaderF.fsh \
								$(ASSETDIR)/ColShaderV.vsh

$(ASSETDIR):
	-mkdir $(ASSETDIR)

$(ASSETDIR)/container-corner.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/container-corner.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/container-corner.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/container-vertical.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/container-vertical.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/container-vertical.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/container-horizontal.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/container-horizontal.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/container-horizontal.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/topbar.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/topbar.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/topbar.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/background.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/background.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/background.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/clock-face.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/clock-face.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/clock-face.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/clock-face-small.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/clock-face-small.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/clock-face-small.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/hand.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/hand.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/hand.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/hand-small.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/hand-small.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/hand-small.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/battery.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/battery.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/battery.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/internet-web-browser.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/internet-web-browser.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/internet-web-browser.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/mail-message-new.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/mail-message-new.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/mail-message-new.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/network-wireless.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/network-wireless.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/network-wireless.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/office-calendar.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/office-calendar.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/office-calendar.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/weather-sun-cloud.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/weather-sun-cloud.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/weather-sun-cloud.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/weather-storm.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/weather-storm.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/weather-storm.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/weather-rain.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/weather-rain.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/weather-rain.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/text1.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/text1.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/text1.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/text2.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/text2.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/text2.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/text-weather.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/text-weather.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/text-weather.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/text-fri.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/text-fri.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/text-fri.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/text-sat.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/text-sat.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/text-sat.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/text-sun.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/text-sun.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/text-sun.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/text-mon.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/text-mon.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/text-mon.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/weather-sun-cloud-big.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/weather-sun-cloud-big.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/weather-sun-cloud-big.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/window-bottom.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/window-bottom.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/window-bottom.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/window-bottomcorner.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/window-bottomcorner.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/window-bottomcorner.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/window-side.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/window-side.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/window-side.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/window-top.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/window-top.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/window-top.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/window-topleft.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/window-topleft.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/window-topleft.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/window-topright.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/window-topright.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/window-topright.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/loremipsum.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/loremipsum.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/loremipsum.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/SpriteShaderF.fsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/SpriteShaderF.fsh
	cp "$(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/SpriteShaderF.fsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/SpriteShaderF.fsc" && \
		cp "$(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/SpriteShaderF.fsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/SpriteShaderV.vsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/SpriteShaderV.vsh
	cp "$(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/SpriteShaderV.vsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/SpriteShaderV.vsc" && \
		cp "$(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/SpriteShaderV.vsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/TexColShaderF.fsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/TexColShaderF.fsh
	cp "$(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/TexColShaderF.fsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/TexColShaderF.fsc" && \
		cp "$(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/TexColShaderF.fsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/TexColShaderV.vsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/TexColShaderV.vsh
	cp "$(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/TexColShaderV.vsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/TexColShaderV.vsc" && \
		cp "$(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/TexColShaderV.vsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/ColShaderF.fsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/ColShaderF.fsh
	cp "$(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/ColShaderF.fsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/ColShaderF.fsc" && \
		cp "$(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/ColShaderF.fsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/ColShaderV.vsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/ColShaderV.vsh
	cp "$(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/ColShaderV.vsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/ColShaderV.vsc" && \
		cp "$(PVRSDKDIR)/Examples/Advanced/ExampleUI/OGLES2/ColShaderV.vsc"	"$(ASSETDIR)/" || true



