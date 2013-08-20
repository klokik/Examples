LOCAL_PATH := $(realpath $(call my-dir)/../../../../../../../..)
PVRSDKDIR := $(LOCAL_PATH)

ASSETDIR := $(PVRSDKDIR)/Examples/Advanced/Shaders/OGLES2/Build/Android/assets

include $(CLEAR_VARS)

LOCAL_MODULE    := OGLES2Shaders

### Add all source file names to be included in lib separated by a whitespace
LOCAL_SRC_FILES := \
				   Examples/Advanced/Shaders/OGLES2/OGLES2Shaders.cpp \
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
.PHONY : build_textures

$(PVRSDKDIR)/Examples/Advanced/Shaders/OGLES2/OGLES2Shaders.cpp:  \
								$(ASSETDIR)/anisotropic_lighting.pfx \
								$(ASSETDIR)/directional_lighting.pfx \
								$(ASSETDIR)/envmap.pfx \
								$(ASSETDIR)/fasttnl.pfx \
								$(ASSETDIR)/lattice.pfx \
								$(ASSETDIR)/phong_lighting.pfx \
								$(ASSETDIR)/point_lighting.pfx \
								$(ASSETDIR)/reflections.pfx \
								$(ASSETDIR)/simple.pfx \
								$(ASSETDIR)/spot_lighting.pfx \
								$(ASSETDIR)/toon.pfx \
								$(ASSETDIR)/vertex_sine.pfx \
								$(ASSETDIR)/wood.pfx \
								$(ASSETDIR)/Basetex.pvr \
								$(ASSETDIR)/Reflection.pvr \
								$(ASSETDIR)/Cubemap.pvr \
								$(ASSETDIR)/AnisoMap.pvr

$(ASSETDIR):
	-mkdir $(ASSETDIR)

$(ASSETDIR)/Basetex.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Shaders/OGLES2/Basetex.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Shaders/OGLES2/Basetex.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Reflection.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Shaders/OGLES2/Reflection.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Shaders/OGLES2/Reflection.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Cubemap.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Shaders/OGLES2/Cubemap.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Shaders/OGLES2/Cubemap.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/AnisoMap.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Shaders/OGLES2/AnisoMap.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Shaders/OGLES2/AnisoMap.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/anisotropic_lighting.pfx: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Shaders/OGLES2/anisotropic_lighting.pfx
	cp "$(PVRSDKDIR)/Examples/Advanced/Shaders/OGLES2/anisotropic_lighting.pfx"	"$(ASSETDIR)/" 

$(ASSETDIR)/directional_lighting.pfx: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Shaders/OGLES2/directional_lighting.pfx
	cp "$(PVRSDKDIR)/Examples/Advanced/Shaders/OGLES2/directional_lighting.pfx"	"$(ASSETDIR)/" 

$(ASSETDIR)/envmap.pfx: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Shaders/OGLES2/envmap.pfx
	cp "$(PVRSDKDIR)/Examples/Advanced/Shaders/OGLES2/envmap.pfx"	"$(ASSETDIR)/" 

$(ASSETDIR)/fasttnl.pfx: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Shaders/OGLES2/fasttnl.pfx
	cp "$(PVRSDKDIR)/Examples/Advanced/Shaders/OGLES2/fasttnl.pfx"	"$(ASSETDIR)/" 

$(ASSETDIR)/lattice.pfx: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Shaders/OGLES2/lattice.pfx
	cp "$(PVRSDKDIR)/Examples/Advanced/Shaders/OGLES2/lattice.pfx"	"$(ASSETDIR)/" 

$(ASSETDIR)/phong_lighting.pfx: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Shaders/OGLES2/phong_lighting.pfx
	cp "$(PVRSDKDIR)/Examples/Advanced/Shaders/OGLES2/phong_lighting.pfx"	"$(ASSETDIR)/" 

$(ASSETDIR)/point_lighting.pfx: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Shaders/OGLES2/point_lighting.pfx
	cp "$(PVRSDKDIR)/Examples/Advanced/Shaders/OGLES2/point_lighting.pfx"	"$(ASSETDIR)/" 

$(ASSETDIR)/reflections.pfx: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Shaders/OGLES2/reflections.pfx
	cp "$(PVRSDKDIR)/Examples/Advanced/Shaders/OGLES2/reflections.pfx"	"$(ASSETDIR)/" 

$(ASSETDIR)/simple.pfx: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Shaders/OGLES2/simple.pfx
	cp "$(PVRSDKDIR)/Examples/Advanced/Shaders/OGLES2/simple.pfx"	"$(ASSETDIR)/" 

$(ASSETDIR)/spot_lighting.pfx: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Shaders/OGLES2/spot_lighting.pfx
	cp "$(PVRSDKDIR)/Examples/Advanced/Shaders/OGLES2/spot_lighting.pfx"	"$(ASSETDIR)/" 

$(ASSETDIR)/toon.pfx: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Shaders/OGLES2/toon.pfx
	cp "$(PVRSDKDIR)/Examples/Advanced/Shaders/OGLES2/toon.pfx"	"$(ASSETDIR)/" 

$(ASSETDIR)/vertex_sine.pfx: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Shaders/OGLES2/vertex_sine.pfx
	cp "$(PVRSDKDIR)/Examples/Advanced/Shaders/OGLES2/vertex_sine.pfx"	"$(ASSETDIR)/" 

$(ASSETDIR)/wood.pfx: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Shaders/OGLES2/wood.pfx
	cp "$(PVRSDKDIR)/Examples/Advanced/Shaders/OGLES2/wood.pfx"	"$(ASSETDIR)/" 



