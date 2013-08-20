LOCAL_PATH := $(realpath $(call my-dir)/../../../../../../../..)
PVRSDKDIR := $(LOCAL_PATH)

ASSETDIR := $(PVRSDKDIR)/Examples/Advanced/Water/OGLES2/Build/Android/assets

include $(CLEAR_VARS)

LOCAL_MODULE    := OGLES2Water

### Add all source file names to be included in lib separated by a whitespace
LOCAL_SRC_FILES := \
				   Examples/Advanced/Water/OGLES2/OGLES2Water.cpp \
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

$(PVRSDKDIR)/Examples/Advanced/Water/OGLES2/OGLES2Water.cpp:  \
								$(ASSETDIR)/Scene.pod \
								$(ASSETDIR)/NewNormalMap.pvr \
								$(ASSETDIR)/Mountain.pvr \
								$(ASSETDIR)/wood.pvr \
								$(ASSETDIR)/sail.pvr \
								$(ASSETDIR)/MountainFloor.pvr \
								$(ASSETDIR)/FragShader.fsh \
								$(ASSETDIR)/VertShader.vsh \
								$(ASSETDIR)/SkyboxFShader.fsh \
								$(ASSETDIR)/SkyboxVShader.vsh \
								$(ASSETDIR)/ModelFShader.fsh \
								$(ASSETDIR)/ModelVShader.vsh \
								$(ASSETDIR)/Tex2DFShader.fsh \
								$(ASSETDIR)/Tex2DVShader.vsh \
								$(ASSETDIR)/PlaneTexFShader.fsh \
								$(ASSETDIR)/PlaneTexVShader.vsh

$(ASSETDIR):
	-mkdir $(ASSETDIR)

$(ASSETDIR)/NewNormalMap.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Water/OGLES2/NewNormalMap.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Water/OGLES2/NewNormalMap.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Mountain.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Water/OGLES2/Mountain.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Water/OGLES2/Mountain.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/wood.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Water/OGLES2/wood.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Water/OGLES2/wood.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/sail.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Water/OGLES2/sail.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Water/OGLES2/sail.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/MountainFloor.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Water/OGLES2/MountainFloor.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Water/OGLES2/MountainFloor.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/FragShader.fsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Water/OGLES2/FragShader.fsh
	cp "$(PVRSDKDIR)/Examples/Advanced/Water/OGLES2/FragShader.fsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Advanced/Water/OGLES2/FragShader.fsc" && \
		cp "$(PVRSDKDIR)/Examples/Advanced/Water/OGLES2/FragShader.fsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/VertShader.vsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Water/OGLES2/VertShader.vsh
	cp "$(PVRSDKDIR)/Examples/Advanced/Water/OGLES2/VertShader.vsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Advanced/Water/OGLES2/VertShader.vsc" && \
		cp "$(PVRSDKDIR)/Examples/Advanced/Water/OGLES2/VertShader.vsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/SkyboxFShader.fsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Water/OGLES2/SkyboxFShader.fsh
	cp "$(PVRSDKDIR)/Examples/Advanced/Water/OGLES2/SkyboxFShader.fsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Advanced/Water/OGLES2/SkyboxFShader.fsc" && \
		cp "$(PVRSDKDIR)/Examples/Advanced/Water/OGLES2/SkyboxFShader.fsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/SkyboxVShader.vsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Water/OGLES2/SkyboxVShader.vsh
	cp "$(PVRSDKDIR)/Examples/Advanced/Water/OGLES2/SkyboxVShader.vsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Advanced/Water/OGLES2/SkyboxVShader.vsc" && \
		cp "$(PVRSDKDIR)/Examples/Advanced/Water/OGLES2/SkyboxVShader.vsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/ModelFShader.fsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Water/OGLES2/ModelFShader.fsh
	cp "$(PVRSDKDIR)/Examples/Advanced/Water/OGLES2/ModelFShader.fsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Advanced/Water/OGLES2/ModelFShader.fsc" && \
		cp "$(PVRSDKDIR)/Examples/Advanced/Water/OGLES2/ModelFShader.fsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/ModelVShader.vsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Water/OGLES2/ModelVShader.vsh
	cp "$(PVRSDKDIR)/Examples/Advanced/Water/OGLES2/ModelVShader.vsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Advanced/Water/OGLES2/ModelVShader.vsc" && \
		cp "$(PVRSDKDIR)/Examples/Advanced/Water/OGLES2/ModelVShader.vsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/Tex2DFShader.fsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Water/OGLES2/Tex2DFShader.fsh
	cp "$(PVRSDKDIR)/Examples/Advanced/Water/OGLES2/Tex2DFShader.fsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Advanced/Water/OGLES2/Tex2DFShader.fsc" && \
		cp "$(PVRSDKDIR)/Examples/Advanced/Water/OGLES2/Tex2DFShader.fsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/Tex2DVShader.vsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Water/OGLES2/Tex2DVShader.vsh
	cp "$(PVRSDKDIR)/Examples/Advanced/Water/OGLES2/Tex2DVShader.vsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Advanced/Water/OGLES2/Tex2DVShader.vsc" && \
		cp "$(PVRSDKDIR)/Examples/Advanced/Water/OGLES2/Tex2DVShader.vsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/PlaneTexFShader.fsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Water/OGLES2/PlaneTexFShader.fsh
	cp "$(PVRSDKDIR)/Examples/Advanced/Water/OGLES2/PlaneTexFShader.fsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Advanced/Water/OGLES2/PlaneTexFShader.fsc" && \
		cp "$(PVRSDKDIR)/Examples/Advanced/Water/OGLES2/PlaneTexFShader.fsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/PlaneTexVShader.vsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Water/OGLES2/PlaneTexVShader.vsh
	cp "$(PVRSDKDIR)/Examples/Advanced/Water/OGLES2/PlaneTexVShader.vsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Advanced/Water/OGLES2/PlaneTexVShader.vsc" && \
		cp "$(PVRSDKDIR)/Examples/Advanced/Water/OGLES2/PlaneTexVShader.vsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/Scene.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Water/OGLES2/Scene.pod
	cp "$(PVRSDKDIR)/Examples/Advanced/Water/OGLES2/Scene.pod"	"$(ASSETDIR)/" 



