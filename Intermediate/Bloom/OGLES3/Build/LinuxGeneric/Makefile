#
# File			Makefile
# Title			Example makefile
#
# Copyright		Copyright (C) Imagination Technologies Limited.
#

.PHONY: clean

SDKDIR  = ../../../../../..
OUTNAME = OGLES3Bloom
APIS    = OGLES3
DEPENDS = PVRSHELL PVRTOOLS

OBJECTS +=	\
           OGLES3Bloom.o	\
           PostBloomFragShader.o	\
           PostBloomVertShader.o	\
           PreBloomFragShader.o	\
           PreBloomVertShader.o	\
           BlurFragShader.o	\
           BlurVertShader.o	\
           FragShader.o	\
           VertShader.o	\
           Mask.o	\
           BaseTex.o	\
           bloom_mapping.o

include $(SDKDIR)/Builds/Linux/make_example.mak

../../Content/PostBloomFragShader.cpp ../../Content/PostBloomVertShader.cpp ../../Content/PreBloomFragShader.cpp ../../Content/PreBloomVertShader.cpp ../../Content/BlurFragShader.cpp ../../Content/BlurVertShader.cpp ../../Content/FragShader.cpp ../../Content/VertShader.cpp ../../Content/Mask.cpp ../../Content/BaseTex.cpp ../../Content/bloom_mapping.cpp: wrap_content_files 

