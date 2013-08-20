LOCAL_PATH := $(realpath $(call my-dir)/../../../../../../../..)
PVRSDKDIR := $(LOCAL_PATH)

ASSETDIR := $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/Build/Android/assets

include $(CLEAR_VARS)

LOCAL_MODULE    := OGLES2Navigation3D

### Add all source file names to be included in lib separated by a whitespace
LOCAL_SRC_FILES := \
				   Examples/Advanced/Navigation3D/OGLES2/OGLES2Navigation3D.cpp \
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

$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/OGLES2Navigation3D.cpp:  \
								$(ASSETDIR)/modelindex.nav \
								$(ASSETDIR)/occlusiondata.nav \
								$(ASSETDIR)/cameratrack.pod \
								$(ASSETDIR)/CM_US_IL_CHICAGO_008_015_L.DAE.pod \
								$(ASSETDIR)/CM_US_IL_CHICAGO_008_016_L.DAE.pod \
								$(ASSETDIR)/CM_US_IL_CHICAGO_009_014_L.DAE.pod \
								$(ASSETDIR)/CM_US_IL_CHICAGO_009_015_L.DAE.pod \
								$(ASSETDIR)/CM_US_IL_CHICAGO_009_016_L.DAE.pod \
								$(ASSETDIR)/CM_US_IL_CHICAGO_009_017_L.DAE.pod \
								$(ASSETDIR)/CM_US_IL_CHICAGO_009_018_L.DAE.pod \
								$(ASSETDIR)/CM_US_IL_CHICAGO_010_014_L.DAE.pod \
								$(ASSETDIR)/CM_US_IL_CHICAGO_010_015_L.DAE.pod \
								$(ASSETDIR)/CM_US_IL_CHICAGO_010_015_H.DAE.pod \
								$(ASSETDIR)/CM_US_IL_CHICAGO_010_016_H.DAE.pod \
								$(ASSETDIR)/CM_US_IL_CHICAGO_010_016_L.DAE.pod \
								$(ASSETDIR)/CM_US_IL_CHICAGO_010_017_L.DAE.pod \
								$(ASSETDIR)/CM_US_IL_CHICAGO_010_017_H.DAE.pod \
								$(ASSETDIR)/CM_US_IL_CHICAGO_010_018_L.DAE.pod \
								$(ASSETDIR)/CM_US_IL_CHICAGO_011_013_L.DAE.pod \
								$(ASSETDIR)/CM_US_IL_CHICAGO_011_014_L.DAE.pod \
								$(ASSETDIR)/CM_US_IL_CHICAGO_011_015_L.DAE.pod \
								$(ASSETDIR)/CM_US_IL_CHICAGO_011_015_H.DAE.pod \
								$(ASSETDIR)/CM_US_IL_CHICAGO_011_016_H.DAE.pod \
								$(ASSETDIR)/CM_US_IL_CHICAGO_011_016_L.DAE.pod \
								$(ASSETDIR)/CM_US_IL_CHICAGO_011_017_L.DAE.pod \
								$(ASSETDIR)/CM_US_IL_CHICAGO_011_017_H.DAE.pod \
								$(ASSETDIR)/CM_US_IL_CHICAGO_011_018_L.DAE.pod \
								$(ASSETDIR)/CM_US_IL_CHICAGO_012_014_L.DAE.pod \
								$(ASSETDIR)/CM_US_IL_CHICAGO_012_015_L.DAE.pod \
								$(ASSETDIR)/CM_US_IL_CHICAGO_012_016_L.DAE.pod \
								$(ASSETDIR)/CM_US_IL_CHICAGO_012_017_L.DAE.pod \
								$(ASSETDIR)/CM_US_IL_CHICAGO_013_015_L.DAE.pod \
								$(ASSETDIR)/CM_US_IL_CHICAGO_013_016_L.DAE.pod \
								$(ASSETDIR)/UIElements.pvr \
								$(ASSETDIR)/Skybox.pvr \
								$(ASSETDIR)/006_RUS.PNG.pvr \
								$(ASSETDIR)/007_RUG.PNG.pvr \
								$(ASSETDIR)/008_RUG.PNG.pvr \
								$(ASSETDIR)/009_RUG.PNG.pvr \
								$(ASSETDIR)/011_GIE.PNG.pvr \
								$(ASSETDIR)/012_RSR.PNG.pvr \
								$(ASSETDIR)/016_FOC.PNG.pvr \
								$(ASSETDIR)/016_RTR.PNG.pvr \
								$(ASSETDIR)/017_FOD.PNG.pvr \
								$(ASSETDIR)/018_FOD.PNG.pvr \
								$(ASSETDIR)/019_FOC.PNG.pvr \
								$(ASSETDIR)/019_GOC.PNG.pvr \
								$(ASSETDIR)/019_RZG.PNG.pvr \
								$(ASSETDIR)/020_FOC.PNG.pvr \
								$(ASSETDIR)/021_FOC.PNG.pvr \
								$(ASSETDIR)/022_FOC.PNG.pvr \
								$(ASSETDIR)/022_RUG.PNG.pvr \
								$(ASSETDIR)/023_FOB.PNG.pvr \
								$(ASSETDIR)/023_RUG.PNG.pvr \
								$(ASSETDIR)/024_FOB.PNG.pvr \
								$(ASSETDIR)/025_FOC.PNG.pvr \
								$(ASSETDIR)/025_RUW.PNG.pvr \
								$(ASSETDIR)/026_FOD.PNG.pvr \
								$(ASSETDIR)/026_RUW.PNG.pvr \
								$(ASSETDIR)/027_FOD.PNG.pvr \
								$(ASSETDIR)/027_RUW.PNG.pvr \
								$(ASSETDIR)/028_GOF.PNG.pvr \
								$(ASSETDIR)/029_GCC.PNG.pvr \
								$(ASSETDIR)/030_GOC.PNG.pvr \
								$(ASSETDIR)/031_GOD.PNG.pvr \
								$(ASSETDIR)/032_FOC.PNG.pvr \
								$(ASSETDIR)/032_GOC.PNG.pvr \
								$(ASSETDIR)/033_FOA.PNG.pvr \
								$(ASSETDIR)/033_GOA.PNG.pvr \
								$(ASSETDIR)/034_FOC.PNG.pvr \
								$(ASSETDIR)/034_GOC.PNG.pvr \
								$(ASSETDIR)/035_FOC.PNG.pvr \
								$(ASSETDIR)/035_GOC.PNG.pvr \
								$(ASSETDIR)/036_FOC.PNG.pvr \
								$(ASSETDIR)/036_GOC.PNG.pvr \
								$(ASSETDIR)/037_FOC.PNG.pvr \
								$(ASSETDIR)/037_GOC.PNG.pvr \
								$(ASSETDIR)/041_FRB.PNG.pvr \
								$(ASSETDIR)/041_GRB.PNG.pvr \
								$(ASSETDIR)/044_GRC.PNG.pvr \
								$(ASSETDIR)/046_GRC.PNG.pvr \
								$(ASSETDIR)/054_GRC.PNG.pvr \
								$(ASSETDIR)/055_GRC.PNG.pvr \
								$(ASSETDIR)/056_GRC.PNG.pvr \
								$(ASSETDIR)/059_FRC.PNG.pvr \
								$(ASSETDIR)/060_FRC.PNG.pvr \
								$(ASSETDIR)/061_FRD.PNG.pvr \
								$(ASSETDIR)/063_GRC.PNG.pvr \
								$(ASSETDIR)/064_GRC.PNG.pvr \
								$(ASSETDIR)/066_FCB.PNG.pvr \
								$(ASSETDIR)/066_GCB.PNG.pvr \
								$(ASSETDIR)/067_FCC.PNG.pvr \
								$(ASSETDIR)/067_GCC.PNG.pvr \
								$(ASSETDIR)/068_GCD.PNG.pvr \
								$(ASSETDIR)/069_FCA.PNG.pvr \
								$(ASSETDIR)/069_GCA.PNG.pvr \
								$(ASSETDIR)/070_GOD.PNG.pvr \
								$(ASSETDIR)/071_FRC.PNG.pvr \
								$(ASSETDIR)/072_FRC.PNG.pvr \
								$(ASSETDIR)/073_FRC.PNG.pvr \
								$(ASSETDIR)/074_FRC.PNG.pvr \
								$(ASSETDIR)/075_FRC.PNG.pvr \
								$(ASSETDIR)/076_FRC.PNG.pvr \
								$(ASSETDIR)/077_FRC.PNG.pvr \
								$(ASSETDIR)/080_GCB.PNG.pvr \
								$(ASSETDIR)/082_FCD.PNG.pvr \
								$(ASSETDIR)/083_FRC.PNG.pvr \
								$(ASSETDIR)/085_GRC.PNG.pvr \
								$(ASSETDIR)/086_FOF.PNG.pvr \
								$(ASSETDIR)/086_GOF.PNG.pvr \
								$(ASSETDIR)/087_FCA.PNG.pvr \
								$(ASSETDIR)/087_GCA.PNG.pvr \
								$(ASSETDIR)/087_GCC.PNG.pvr \
								$(ASSETDIR)/088_FRC.PNG.pvr \
								$(ASSETDIR)/089_FRC.PNG.pvr \
								$(ASSETDIR)/092_GCA.PNG.pvr \
								$(ASSETDIR)/094_FOD.PNG.pvr \
								$(ASSETDIR)/095_FOD.PNG.pvr \
								$(ASSETDIR)/US_IL_13443_CHICAGO_35EAST_L.PNG.pvr \
								$(ASSETDIR)/US_IL_13444_CHICAGO_LEOBURNETT_L.PNG.pvr \
								$(ASSETDIR)/US_IL_13447_CHICAGO_REIDMURDOCH_L.PNG.pvr \
								$(ASSETDIR)/US_IL_13448_CHICAGO_CARBIDE_L.PNG.pvr \
								$(ASSETDIR)/US_IL_13449_CHICAGO_CROWNFOUNTAIN_L.PNG.pvr \
								$(ASSETDIR)/US_IL_13451_CHICAGO_CULTURAL_L.PNG.pvr \
								$(ASSETDIR)/US_IL_13453_CHICAGO_PRUDENTIAL_PART1_L.PNG.pvr \
								$(ASSETDIR)/US_IL_13454_CHICAGO_UNITED_L.PNG.pvr \
								$(ASSETDIR)/US_IL_13456_CHICAGO_SEVENTEENTH_L.PNG.pvr \
								$(ASSETDIR)/US_IL_13458_CHICAGO_SMURFIT_L.PNG.pvr \
								$(ASSETDIR)/US_IL_13459_CHICAGO_LASALLE_L.PNG.pvr \
								$(ASSETDIR)/US_IL_13460_CHICAGO_TRUMP_L.PNG.pvr \
								$(ASSETDIR)/US_IL_13461_CHICAGO_UNITRIN_L.PNG.pvr \
								$(ASSETDIR)/US_IL_13462_CHICAGO_WILLOUGHBY_L.PNG.pvr \
								$(ASSETDIR)/US_IL_13490_CHICAGO_PRUDENTIAL_PART2_L.PNG.pvr \
								$(ASSETDIR)/US_IL_CHICAGO_AONCENTER_L.PNG.pvr \
								$(ASSETDIR)/US_IL_CHICAGO_ARTINSTITUTE_L.PNG.pvr \
								$(ASSETDIR)/US_IL_CHICAGO_BOARDOFTHETRADE_L.PNG.pvr \
								$(ASSETDIR)/US_IL_CHICAGO_BOEINGBUILDING_L.PNG.pvr \
								$(ASSETDIR)/US_IL_CHICAGO_CHICAGOTHEATRE_L.PNG.pvr \
								$(ASSETDIR)/US_IL_CHICAGO_CITYHALL_L.PNG.pvr \
								$(ASSETDIR)/US_IL_CHICAGO_DALEY_L.PNG.pvr \
								$(ASSETDIR)/US_IL_CHICAGO_HILTON_L.PNG.pvr \
								$(ASSETDIR)/US_IL_CHICAGO_JAMESTHOMPSON_L.PNG.pvr \
								$(ASSETDIR)/US_IL_CHICAGO_LIBRARY_L.PNG.pvr \
								$(ASSETDIR)/US_IL_CHICAGO_MILLENIUMPARK1_L.PNG.pvr \
								$(ASSETDIR)/US_IL_CHICAGO_MILLENIUMPARK2_L.PNG.pvr \
								$(ASSETDIR)/US_IL_CHICAGO_MMART_L.PNG.pvr \
								$(ASSETDIR)/US_IL_CHICAGO_OGILVIE_L.PNG.pvr \
								$(ASSETDIR)/US_IL_CHICAGO_SEARSTOWER_L.PNG.pvr \
								$(ASSETDIR)/US_IL_CHICAGO_UNIONSTATION_L.PNG.pvr \
								$(ASSETDIR)/US_L_CONCRETE-COLOUR.PNG.pvr \
								$(ASSETDIR)/US_L_CONCRETE-DETAIL.PNG.pvr \
								$(ASSETDIR)/US_L_PARK-COLOUR.PNG.pvr \
								$(ASSETDIR)/US_L_WATER-COLOUR.PNG.pvr \
								$(ASSETDIR)/US_R_CONCRETE.PNG.pvr \
								$(ASSETDIR)/US_R_HIGHWAY-SOLID.PNG.pvr \
								$(ASSETDIR)/US_R_STREET-DASHED.PNG.pvr \
								$(ASSETDIR)/US_R_STREET-INNER-SHOULDER.PNG.pvr \
								$(ASSETDIR)/US_R_STREET-LANE-FILLER.PNG.pvr \
								$(ASSETDIR)/US_R_STREET-SOLID.PNG.pvr \
								$(ASSETDIR)/US_R_STREET-UNMARKED.PNG.pvr \
								$(ASSETDIR)/US_R_WALKWAY-SOLID.PNG.pvr \
								$(ASSETDIR)/US_R_WALKWAY-UNMARKED.PNG.pvr \
								$(ASSETDIR)/US_T_RAILROAD.PNG.pvr \
								$(ASSETDIR)/UIVertShader.vsh \
								$(ASSETDIR)/UIFragShader.fsh \
								$(ASSETDIR)/SkyboxFragShader.fsh \
								$(ASSETDIR)/SkyboxVertShader.vsh \
								$(ASSETDIR)/BuildingFragShader.fsh \
								$(ASSETDIR)/BuildingVertShader.vsh \
								$(ASSETDIR)/FullscreenVertShader.vsh \
								$(ASSETDIR)/FullscreenFragShader.fsh \
								$(ASSETDIR)/ShadowVolVertShader.vsh \
								$(ASSETDIR)/ShadowVolFragShader.fsh

$(ASSETDIR):
	-mkdir $(ASSETDIR)

$(ASSETDIR)/UIElements.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/UIElements.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/UIElements.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/Skybox.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/Skybox.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/Skybox.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/006_RUS.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/006_RUS.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/006_RUS.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/007_RUG.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/007_RUG.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/007_RUG.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/008_RUG.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/008_RUG.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/008_RUG.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/009_RUG.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/009_RUG.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/009_RUG.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/011_GIE.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/011_GIE.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/011_GIE.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/012_RSR.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/012_RSR.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/012_RSR.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/016_FOC.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/016_FOC.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/016_FOC.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/016_RTR.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/016_RTR.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/016_RTR.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/017_FOD.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/017_FOD.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/017_FOD.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/018_FOD.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/018_FOD.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/018_FOD.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/019_FOC.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/019_FOC.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/019_FOC.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/019_GOC.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/019_GOC.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/019_GOC.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/019_RZG.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/019_RZG.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/019_RZG.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/020_FOC.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/020_FOC.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/020_FOC.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/021_FOC.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/021_FOC.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/021_FOC.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/022_FOC.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/022_FOC.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/022_FOC.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/022_RUG.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/022_RUG.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/022_RUG.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/023_FOB.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/023_FOB.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/023_FOB.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/023_RUG.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/023_RUG.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/023_RUG.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/024_FOB.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/024_FOB.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/024_FOB.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/025_FOC.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/025_FOC.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/025_FOC.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/025_RUW.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/025_RUW.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/025_RUW.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/026_FOD.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/026_FOD.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/026_FOD.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/026_RUW.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/026_RUW.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/026_RUW.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/027_FOD.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/027_FOD.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/027_FOD.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/027_RUW.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/027_RUW.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/027_RUW.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/028_GOF.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/028_GOF.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/028_GOF.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/029_GCC.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/029_GCC.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/029_GCC.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/030_GOC.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/030_GOC.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/030_GOC.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/031_GOD.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/031_GOD.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/031_GOD.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/032_FOC.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/032_FOC.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/032_FOC.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/032_GOC.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/032_GOC.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/032_GOC.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/033_FOA.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/033_FOA.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/033_FOA.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/033_GOA.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/033_GOA.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/033_GOA.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/034_FOC.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/034_FOC.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/034_FOC.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/034_GOC.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/034_GOC.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/034_GOC.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/035_FOC.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/035_FOC.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/035_FOC.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/035_GOC.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/035_GOC.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/035_GOC.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/036_FOC.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/036_FOC.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/036_FOC.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/036_GOC.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/036_GOC.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/036_GOC.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/037_FOC.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/037_FOC.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/037_FOC.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/037_GOC.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/037_GOC.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/037_GOC.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/041_FRB.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/041_FRB.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/041_FRB.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/041_GRB.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/041_GRB.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/041_GRB.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/044_GRC.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/044_GRC.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/044_GRC.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/046_GRC.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/046_GRC.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/046_GRC.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/054_GRC.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/054_GRC.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/054_GRC.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/055_GRC.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/055_GRC.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/055_GRC.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/056_GRC.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/056_GRC.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/056_GRC.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/059_FRC.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/059_FRC.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/059_FRC.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/060_FRC.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/060_FRC.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/060_FRC.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/061_FRD.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/061_FRD.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/061_FRD.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/063_GRC.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/063_GRC.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/063_GRC.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/064_GRC.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/064_GRC.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/064_GRC.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/066_FCB.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/066_FCB.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/066_FCB.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/066_GCB.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/066_GCB.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/066_GCB.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/067_FCC.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/067_FCC.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/067_FCC.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/067_GCC.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/067_GCC.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/067_GCC.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/068_GCD.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/068_GCD.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/068_GCD.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/069_FCA.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/069_FCA.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/069_FCA.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/069_GCA.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/069_GCA.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/069_GCA.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/070_GOD.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/070_GOD.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/070_GOD.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/071_FRC.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/071_FRC.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/071_FRC.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/072_FRC.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/072_FRC.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/072_FRC.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/073_FRC.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/073_FRC.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/073_FRC.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/074_FRC.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/074_FRC.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/074_FRC.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/075_FRC.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/075_FRC.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/075_FRC.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/076_FRC.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/076_FRC.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/076_FRC.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/077_FRC.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/077_FRC.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/077_FRC.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/080_GCB.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/080_GCB.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/080_GCB.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/082_FCD.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/082_FCD.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/082_FCD.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/083_FRC.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/083_FRC.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/083_FRC.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/085_GRC.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/085_GRC.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/085_GRC.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/086_FOF.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/086_FOF.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/086_FOF.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/086_GOF.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/086_GOF.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/086_GOF.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/087_FCA.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/087_FCA.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/087_FCA.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/087_GCA.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/087_GCA.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/087_GCA.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/087_GCC.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/087_GCC.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/087_GCC.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/088_FRC.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/088_FRC.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/088_FRC.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/089_FRC.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/089_FRC.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/089_FRC.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/092_GCA.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/092_GCA.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/092_GCA.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/094_FOD.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/094_FOD.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/094_FOD.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/095_FOD.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/095_FOD.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/095_FOD.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/US_IL_13443_CHICAGO_35EAST_L.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_13443_CHICAGO_35EAST_L.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_13443_CHICAGO_35EAST_L.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/US_IL_13444_CHICAGO_LEOBURNETT_L.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_13444_CHICAGO_LEOBURNETT_L.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_13444_CHICAGO_LEOBURNETT_L.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/US_IL_13447_CHICAGO_REIDMURDOCH_L.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_13447_CHICAGO_REIDMURDOCH_L.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_13447_CHICAGO_REIDMURDOCH_L.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/US_IL_13448_CHICAGO_CARBIDE_L.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_13448_CHICAGO_CARBIDE_L.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_13448_CHICAGO_CARBIDE_L.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/US_IL_13449_CHICAGO_CROWNFOUNTAIN_L.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_13449_CHICAGO_CROWNFOUNTAIN_L.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_13449_CHICAGO_CROWNFOUNTAIN_L.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/US_IL_13451_CHICAGO_CULTURAL_L.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_13451_CHICAGO_CULTURAL_L.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_13451_CHICAGO_CULTURAL_L.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/US_IL_13453_CHICAGO_PRUDENTIAL_PART1_L.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_13453_CHICAGO_PRUDENTIAL_PART1_L.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_13453_CHICAGO_PRUDENTIAL_PART1_L.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/US_IL_13454_CHICAGO_UNITED_L.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_13454_CHICAGO_UNITED_L.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_13454_CHICAGO_UNITED_L.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/US_IL_13456_CHICAGO_SEVENTEENTH_L.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_13456_CHICAGO_SEVENTEENTH_L.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_13456_CHICAGO_SEVENTEENTH_L.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/US_IL_13458_CHICAGO_SMURFIT_L.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_13458_CHICAGO_SMURFIT_L.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_13458_CHICAGO_SMURFIT_L.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/US_IL_13459_CHICAGO_LASALLE_L.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_13459_CHICAGO_LASALLE_L.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_13459_CHICAGO_LASALLE_L.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/US_IL_13460_CHICAGO_TRUMP_L.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_13460_CHICAGO_TRUMP_L.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_13460_CHICAGO_TRUMP_L.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/US_IL_13461_CHICAGO_UNITRIN_L.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_13461_CHICAGO_UNITRIN_L.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_13461_CHICAGO_UNITRIN_L.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/US_IL_13462_CHICAGO_WILLOUGHBY_L.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_13462_CHICAGO_WILLOUGHBY_L.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_13462_CHICAGO_WILLOUGHBY_L.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/US_IL_13490_CHICAGO_PRUDENTIAL_PART2_L.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_13490_CHICAGO_PRUDENTIAL_PART2_L.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_13490_CHICAGO_PRUDENTIAL_PART2_L.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/US_IL_CHICAGO_AONCENTER_L.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_CHICAGO_AONCENTER_L.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_CHICAGO_AONCENTER_L.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/US_IL_CHICAGO_ARTINSTITUTE_L.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_CHICAGO_ARTINSTITUTE_L.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_CHICAGO_ARTINSTITUTE_L.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/US_IL_CHICAGO_BOARDOFTHETRADE_L.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_CHICAGO_BOARDOFTHETRADE_L.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_CHICAGO_BOARDOFTHETRADE_L.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/US_IL_CHICAGO_BOEINGBUILDING_L.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_CHICAGO_BOEINGBUILDING_L.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_CHICAGO_BOEINGBUILDING_L.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/US_IL_CHICAGO_CHICAGOTHEATRE_L.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_CHICAGO_CHICAGOTHEATRE_L.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_CHICAGO_CHICAGOTHEATRE_L.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/US_IL_CHICAGO_CITYHALL_L.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_CHICAGO_CITYHALL_L.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_CHICAGO_CITYHALL_L.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/US_IL_CHICAGO_DALEY_L.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_CHICAGO_DALEY_L.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_CHICAGO_DALEY_L.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/US_IL_CHICAGO_HILTON_L.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_CHICAGO_HILTON_L.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_CHICAGO_HILTON_L.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/US_IL_CHICAGO_JAMESTHOMPSON_L.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_CHICAGO_JAMESTHOMPSON_L.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_CHICAGO_JAMESTHOMPSON_L.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/US_IL_CHICAGO_LIBRARY_L.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_CHICAGO_LIBRARY_L.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_CHICAGO_LIBRARY_L.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/US_IL_CHICAGO_MILLENIUMPARK1_L.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_CHICAGO_MILLENIUMPARK1_L.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_CHICAGO_MILLENIUMPARK1_L.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/US_IL_CHICAGO_MILLENIUMPARK2_L.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_CHICAGO_MILLENIUMPARK2_L.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_CHICAGO_MILLENIUMPARK2_L.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/US_IL_CHICAGO_MMART_L.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_CHICAGO_MMART_L.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_CHICAGO_MMART_L.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/US_IL_CHICAGO_OGILVIE_L.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_CHICAGO_OGILVIE_L.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_CHICAGO_OGILVIE_L.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/US_IL_CHICAGO_SEARSTOWER_L.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_CHICAGO_SEARSTOWER_L.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_CHICAGO_SEARSTOWER_L.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/US_IL_CHICAGO_UNIONSTATION_L.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_CHICAGO_UNIONSTATION_L.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_IL_CHICAGO_UNIONSTATION_L.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/US_L_CONCRETE-COLOUR.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_L_CONCRETE-COLOUR.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_L_CONCRETE-COLOUR.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/US_L_CONCRETE-DETAIL.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_L_CONCRETE-DETAIL.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_L_CONCRETE-DETAIL.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/US_L_PARK-COLOUR.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_L_PARK-COLOUR.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_L_PARK-COLOUR.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/US_L_WATER-COLOUR.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_L_WATER-COLOUR.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_L_WATER-COLOUR.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/US_R_CONCRETE.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_R_CONCRETE.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_R_CONCRETE.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/US_R_HIGHWAY-SOLID.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_R_HIGHWAY-SOLID.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_R_HIGHWAY-SOLID.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/US_R_STREET-DASHED.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_R_STREET-DASHED.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_R_STREET-DASHED.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/US_R_STREET-INNER-SHOULDER.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_R_STREET-INNER-SHOULDER.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_R_STREET-INNER-SHOULDER.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/US_R_STREET-LANE-FILLER.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_R_STREET-LANE-FILLER.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_R_STREET-LANE-FILLER.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/US_R_STREET-SOLID.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_R_STREET-SOLID.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_R_STREET-SOLID.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/US_R_STREET-UNMARKED.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_R_STREET-UNMARKED.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_R_STREET-UNMARKED.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/US_R_WALKWAY-SOLID.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_R_WALKWAY-SOLID.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_R_WALKWAY-SOLID.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/US_R_WALKWAY-UNMARKED.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_R_WALKWAY-UNMARKED.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_R_WALKWAY-UNMARKED.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/US_T_RAILROAD.PNG.pvr: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_T_RAILROAD.PNG.pvr
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/US_T_RAILROAD.PNG.pvr"	"$(ASSETDIR)/" 

$(ASSETDIR)/UIVertShader.vsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/UIVertShader.vsh
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/UIVertShader.vsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/UIVertShader.vsc" && \
		cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/UIVertShader.vsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/UIFragShader.fsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/UIFragShader.fsh
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/UIFragShader.fsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/UIFragShader.fsc" && \
		cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/UIFragShader.fsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/SkyboxFragShader.fsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/SkyboxFragShader.fsh
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/SkyboxFragShader.fsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/SkyboxFragShader.fsc" && \
		cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/SkyboxFragShader.fsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/SkyboxVertShader.vsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/SkyboxVertShader.vsh
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/SkyboxVertShader.vsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/SkyboxVertShader.vsc" && \
		cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/SkyboxVertShader.vsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/BuildingFragShader.fsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/BuildingFragShader.fsh
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/BuildingFragShader.fsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/BuildingFragShader.fsc" && \
		cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/BuildingFragShader.fsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/BuildingVertShader.vsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/BuildingVertShader.vsh
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/BuildingVertShader.vsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/BuildingVertShader.vsc" && \
		cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/BuildingVertShader.vsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/FullscreenVertShader.vsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/FullscreenVertShader.vsh
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/FullscreenVertShader.vsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/FullscreenVertShader.vsc" && \
		cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/FullscreenVertShader.vsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/FullscreenFragShader.fsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/FullscreenFragShader.fsh
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/FullscreenFragShader.fsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/FullscreenFragShader.fsc" && \
		cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/FullscreenFragShader.fsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/ShadowVolVertShader.vsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/ShadowVolVertShader.vsh
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/ShadowVolVertShader.vsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/ShadowVolVertShader.vsc" && \
		cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/ShadowVolVertShader.vsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/ShadowVolFragShader.fsh: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/ShadowVolFragShader.fsh
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/ShadowVolFragShader.fsh"	"$(ASSETDIR)/"
	test -e "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/ShadowVolFragShader.fsc" && \
		cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/ShadowVolFragShader.fsc"	"$(ASSETDIR)/" || true

$(ASSETDIR)/modelindex.nav: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/modelindex.nav
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/modelindex.nav"	"$(ASSETDIR)/" 

$(ASSETDIR)/occlusiondata.nav: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/occlusiondata.nav
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/occlusiondata.nav"	"$(ASSETDIR)/" 

$(ASSETDIR)/cameratrack.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/cameratrack.pod
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/cameratrack.pod"	"$(ASSETDIR)/" 

$(ASSETDIR)/CM_US_IL_CHICAGO_008_015_L.DAE.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_008_015_L.DAE.pod
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_008_015_L.DAE.pod"	"$(ASSETDIR)/" 

$(ASSETDIR)/CM_US_IL_CHICAGO_008_016_L.DAE.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_008_016_L.DAE.pod
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_008_016_L.DAE.pod"	"$(ASSETDIR)/" 

$(ASSETDIR)/CM_US_IL_CHICAGO_009_014_L.DAE.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_009_014_L.DAE.pod
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_009_014_L.DAE.pod"	"$(ASSETDIR)/" 

$(ASSETDIR)/CM_US_IL_CHICAGO_009_015_L.DAE.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_009_015_L.DAE.pod
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_009_015_L.DAE.pod"	"$(ASSETDIR)/" 

$(ASSETDIR)/CM_US_IL_CHICAGO_009_016_L.DAE.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_009_016_L.DAE.pod
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_009_016_L.DAE.pod"	"$(ASSETDIR)/" 

$(ASSETDIR)/CM_US_IL_CHICAGO_009_017_L.DAE.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_009_017_L.DAE.pod
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_009_017_L.DAE.pod"	"$(ASSETDIR)/" 

$(ASSETDIR)/CM_US_IL_CHICAGO_009_018_L.DAE.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_009_018_L.DAE.pod
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_009_018_L.DAE.pod"	"$(ASSETDIR)/" 

$(ASSETDIR)/CM_US_IL_CHICAGO_010_014_L.DAE.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_010_014_L.DAE.pod
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_010_014_L.DAE.pod"	"$(ASSETDIR)/" 

$(ASSETDIR)/CM_US_IL_CHICAGO_010_015_L.DAE.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_010_015_L.DAE.pod
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_010_015_L.DAE.pod"	"$(ASSETDIR)/" 

$(ASSETDIR)/CM_US_IL_CHICAGO_010_015_H.DAE.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_010_015_H.DAE.pod
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_010_015_H.DAE.pod"	"$(ASSETDIR)/" 

$(ASSETDIR)/CM_US_IL_CHICAGO_010_016_H.DAE.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_010_016_H.DAE.pod
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_010_016_H.DAE.pod"	"$(ASSETDIR)/" 

$(ASSETDIR)/CM_US_IL_CHICAGO_010_016_L.DAE.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_010_016_L.DAE.pod
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_010_016_L.DAE.pod"	"$(ASSETDIR)/" 

$(ASSETDIR)/CM_US_IL_CHICAGO_010_017_L.DAE.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_010_017_L.DAE.pod
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_010_017_L.DAE.pod"	"$(ASSETDIR)/" 

$(ASSETDIR)/CM_US_IL_CHICAGO_010_017_H.DAE.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_010_017_H.DAE.pod
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_010_017_H.DAE.pod"	"$(ASSETDIR)/" 

$(ASSETDIR)/CM_US_IL_CHICAGO_010_018_L.DAE.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_010_018_L.DAE.pod
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_010_018_L.DAE.pod"	"$(ASSETDIR)/" 

$(ASSETDIR)/CM_US_IL_CHICAGO_011_013_L.DAE.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_011_013_L.DAE.pod
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_011_013_L.DAE.pod"	"$(ASSETDIR)/" 

$(ASSETDIR)/CM_US_IL_CHICAGO_011_014_L.DAE.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_011_014_L.DAE.pod
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_011_014_L.DAE.pod"	"$(ASSETDIR)/" 

$(ASSETDIR)/CM_US_IL_CHICAGO_011_015_L.DAE.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_011_015_L.DAE.pod
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_011_015_L.DAE.pod"	"$(ASSETDIR)/" 

$(ASSETDIR)/CM_US_IL_CHICAGO_011_015_H.DAE.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_011_015_H.DAE.pod
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_011_015_H.DAE.pod"	"$(ASSETDIR)/" 

$(ASSETDIR)/CM_US_IL_CHICAGO_011_016_H.DAE.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_011_016_H.DAE.pod
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_011_016_H.DAE.pod"	"$(ASSETDIR)/" 

$(ASSETDIR)/CM_US_IL_CHICAGO_011_016_L.DAE.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_011_016_L.DAE.pod
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_011_016_L.DAE.pod"	"$(ASSETDIR)/" 

$(ASSETDIR)/CM_US_IL_CHICAGO_011_017_L.DAE.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_011_017_L.DAE.pod
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_011_017_L.DAE.pod"	"$(ASSETDIR)/" 

$(ASSETDIR)/CM_US_IL_CHICAGO_011_017_H.DAE.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_011_017_H.DAE.pod
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_011_017_H.DAE.pod"	"$(ASSETDIR)/" 

$(ASSETDIR)/CM_US_IL_CHICAGO_011_018_L.DAE.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_011_018_L.DAE.pod
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_011_018_L.DAE.pod"	"$(ASSETDIR)/" 

$(ASSETDIR)/CM_US_IL_CHICAGO_012_014_L.DAE.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_012_014_L.DAE.pod
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_012_014_L.DAE.pod"	"$(ASSETDIR)/" 

$(ASSETDIR)/CM_US_IL_CHICAGO_012_015_L.DAE.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_012_015_L.DAE.pod
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_012_015_L.DAE.pod"	"$(ASSETDIR)/" 

$(ASSETDIR)/CM_US_IL_CHICAGO_012_016_L.DAE.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_012_016_L.DAE.pod
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_012_016_L.DAE.pod"	"$(ASSETDIR)/" 

$(ASSETDIR)/CM_US_IL_CHICAGO_012_017_L.DAE.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_012_017_L.DAE.pod
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_012_017_L.DAE.pod"	"$(ASSETDIR)/" 

$(ASSETDIR)/CM_US_IL_CHICAGO_013_015_L.DAE.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_013_015_L.DAE.pod
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_013_015_L.DAE.pod"	"$(ASSETDIR)/" 

$(ASSETDIR)/CM_US_IL_CHICAGO_013_016_L.DAE.pod: $(ASSETDIR) $(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_013_016_L.DAE.pod
	cp "$(PVRSDKDIR)/Examples/Advanced/Navigation3D/OGLES2/CM_US_IL_CHICAGO_013_016_L.DAE.pod"	"$(ASSETDIR)/" 



