LOCAL_PATH := $(realpath $(call my-dir)/../../../../../../../..)
PVRSDKDIR := $(LOCAL_PATH)

ASSETDIR := $(PVRSDKDIR)/Examples/Advanced/ChameleonMan/OGLES2/Build/Android/assets

include $(CLEAR_VARS)

LOCAL_MODULE    := OGLES2ChameleonMan

### Add all source file names to be included in lib separated by a whitespace
LOCAL_SRC_FILES := \
				   Examples/Advanced/ChameleonMan/OGLES2/OGLES2ChameleonMan.cpp \
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

$(PVRSDKDIR)/Examples/Advanced/ChameleonMan/OGLES2/OGLES2ChameleonMan.cpp:  \
								$(ASSETDIR)/ChameleonScene.pod \
								$(ASSETDIR)/skyline.pvr \
								$(ASSETDIR)/Wall_diffuse_baked.pvr \
								$(ASSETDIR)/Tang_space_BodyMap.pvr \
								$(ASSETDIR)/Tang_space_LegsMap.pvr \
								$(ASSETDIR)/Tang_space_BeltMap.pvr \
								$(ASSETDIR)/FinalChameleonManLegs.pvr \
								$(ASSETDIR)/FinalChameleonManHeadBody.pvr \
								$(ASSETDIR)/lamp.pvr \
								$(ASSETDIR)/ChameleonBelt.pvr \
								$(ASSETDIR)/SkinnedVertShader.vsh \
								$(ASSETDIR)/SkinnedFragShader.fsh \
								$(ASSETDIR)/DefaultVertShader.vsh \
								$(ASSETDIR)/DefaultFragShader.fsh

$(ASSETDIR):
	-mkdir $(ASSETDIR)

$(ASSETDIR)/skyline.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ChameleonMan/OGLES2/skyline.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/ChameleonMan/OGLES2/skyline.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Wall_diffuse_baked.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ChameleonMan/OGLES2/Wall_diffuse_baked.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/ChameleonMan/OGLES2/Wall_diffuse_baked.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Tang_space_BodyMap.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ChameleonMan/OGLES2/Tang_space_BodyMap.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/ChameleonMan/OGLES2/Tang_space_BodyMap.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Tang_space_LegsMap.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ChameleonMan/OGLES2/Tang_space_LegsMap.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/ChameleonMan/OGLES2/Tang_space_LegsMap.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Tang_space_BeltMap.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ChameleonMan/OGLES2/Tang_space_BeltMap.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/ChameleonMan/OGLES2/Tang_space_BeltMap.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/FinalChameleonManLegs.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ChameleonMan/OGLES2/FinalChameleonManLegs.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/ChameleonMan/OGLES2/FinalChameleonManLegs.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/FinalChameleonManHeadBody.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ChameleonMan/OGLES2/FinalChameleonManHeadBody.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/ChameleonMan/OGLES2/FinalChameleonManHeadBody.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/lamp.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ChameleonMan/OGLES2/lamp.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/ChameleonMan/OGLES2/lamp.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/ChameleonBelt.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ChameleonMan/OGLES2/ChameleonBelt.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/ChameleonMan/OGLES2/ChameleonBelt.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/SkinnedVertShader.vsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ChameleonMan/OGLES2/SkinnedVertShader.vsh
	cp "$(PVRSDKDIR)/Examples/Advanced/ChameleonMan/OGLES2/SkinnedVertShader.vsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Advanced/ChameleonMan/OGLES2/SkinnedVertShader.vsc" && \
		cp "$(PVRSDKDIR)/Examples/Advanced/ChameleonMan/OGLES2/SkinnedVertShader.vsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/SkinnedFragShader.fsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ChameleonMan/OGLES2/SkinnedFragShader.fsh
	cp "$(PVRSDKDIR)/Examples/Advanced/ChameleonMan/OGLES2/SkinnedFragShader.fsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Advanced/ChameleonMan/OGLES2/SkinnedFragShader.fsc" && \
		cp "$(PVRSDKDIR)/Examples/Advanced/ChameleonMan/OGLES2/SkinnedFragShader.fsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/DefaultVertShader.vsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ChameleonMan/OGLES2/DefaultVertShader.vsh
	cp "$(PVRSDKDIR)/Examples/Advanced/ChameleonMan/OGLES2/DefaultVertShader.vsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Advanced/ChameleonMan/OGLES2/DefaultVertShader.vsc" && \
		cp "$(PVRSDKDIR)/Examples/Advanced/ChameleonMan/OGLES2/DefaultVertShader.vsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/DefaultFragShader.fsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ChameleonMan/OGLES2/DefaultFragShader.fsh
	cp "$(PVRSDKDIR)/Examples/Advanced/ChameleonMan/OGLES2/DefaultFragShader.fsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Advanced/ChameleonMan/OGLES2/DefaultFragShader.fsc" && \
		cp "$(PVRSDKDIR)/Examples/Advanced/ChameleonMan/OGLES2/DefaultFragShader.fsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/ChameleonScene.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/ChameleonMan/OGLES2/ChameleonScene.pod
	cp "$(PVRSDKDIR)/Examples/Advanced/ChameleonMan/OGLES2/ChameleonScene.pod"	"$(ASSETDIR)/" 



