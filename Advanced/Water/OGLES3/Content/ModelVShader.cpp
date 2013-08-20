// This file was created by Filewrap 1.1
// Little endian mode
// DO NOT EDIT

#include "../PVRTMemoryFileSystem.h"

// using 32 bit to guarantee alignment.
#ifndef A32BIT
 #define A32BIT static const unsigned int
#endif

// ******** Start: ModelVShader.vsh ********

// File data
static const char _ModelVShader_vsh[] = 
	"#version 300 es\r\n"
	"\r\n"
	"#define VERTEX_ARRAY\t0\r\n"
	"#define NORMAL_ARRAY\t1\r\n"
	"#define TEXCOORD_ARRAY\t2\r\n"
	"\r\n"
	"layout (location = VERTEX_ARRAY) in highp vec3 inVertex;\r\n"
	"layout (location = NORMAL_ARRAY) in highp vec3 inNormal;\r\n"
	"layout (location = TEXCOORD_ARRAY) in highp vec2 inTexCoord;\r\n"
	"\r\n"
	"#define ENABLE_TEXTURE\r\n"
	"\r\n"
	"uniform highp mat4\t\tMVPMatrix;\r\n"
	"uniform mediump vec3\tLightDirection;\r\n"
	"#ifdef ENABLE_FOG_DEPTH\r\n"
	"uniform highp mat4\t\tModelMatrix;\r\n"
	"uniform mediump float\tWaterHeight;\t\t//Assume water always lies on the y-axis\r\n"
	"#endif\r\n"
	"\r\n"
	"#ifdef ENABLE_LIGHTING\r\n"
	"\tout lowp float\t\tLightIntensity;\t\r\n"
	"#endif\r\n"
	"#ifdef ENABLE_TEXTURE\r\n"
	"\tout mediump vec2 \tTexCoord;\r\n"
	"#endif\r\n"
	"#ifdef ENABLE_FOG_DEPTH\r\n"
	"\tout mediump float\tVertexDepth;\r\n"
	"#endif\r\n"
	"\r\n"
	"void main()\r\n"
	"{\r\n"
	"\t// Convert each vertex into projection-space and output the value\r\n"
	"\thighp vec4 vInVertex = vec4(inVertex, 1.0);\r\n"
	"\tgl_Position = MVPMatrix * vInVertex;\r\n"
	"\t\r\n"
	"\t#ifdef ENABLE_TEXTURE\r\n"
	"\t\tTexCoord = inTexCoord;\r\n"
	"\t#endif\r\n"
	"\t\r\n"
	"\t#ifdef ENABLE_FOG_DEPTH\r\n"
	"\t\t// Calculate the vertex's distance under water surface. This assumes clipping has removed all objects above the water\r\n"
	"\t\tmediump float vVertexHeight = (ModelMatrix * vec4(inVertex,1.0)).y;\r\n"
	"\t\tVertexDepth = WaterHeight - vVertexHeight;\r\n"
	"\t#endif\r\n"
	"\t\r\n"
	"\t#ifdef ENABLE_LIGHTING\r\n"
	"\t\t// Simple diffuse lighting in model space\r\n"
	"\t\tLightIntensity = 0.3 + clamp(dot(inNormal, -LightDirection),0.0,1.0);\t// 0.5 is ambient light\r\n"
	"\t#endif\r\n"
	"}\r\n";

// Register ModelVShader.vsh in memory file system at application startup time
static CPVRTMemoryFileSystem RegisterFile_ModelVShader_vsh("ModelVShader.vsh", _ModelVShader_vsh, 1403);

// ******** End: ModelVShader.vsh ********

