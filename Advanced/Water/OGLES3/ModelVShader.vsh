#version 300 es

#define VERTEX_ARRAY	0
#define NORMAL_ARRAY	1
#define TEXCOORD_ARRAY	2

layout (location = VERTEX_ARRAY) in highp vec3 inVertex;
layout (location = NORMAL_ARRAY) in highp vec3 inNormal;
layout (location = TEXCOORD_ARRAY) in highp vec2 inTexCoord;

#define ENABLE_TEXTURE

uniform highp mat4		MVPMatrix;
uniform mediump vec3	LightDirection;
#ifdef ENABLE_FOG_DEPTH
uniform highp mat4		ModelMatrix;
uniform mediump float	WaterHeight;		//Assume water always lies on the y-axis
#endif

#ifdef ENABLE_LIGHTING
	out lowp float		LightIntensity;	
#endif
#ifdef ENABLE_TEXTURE
	out mediump vec2 	TexCoord;
#endif
#ifdef ENABLE_FOG_DEPTH
	out mediump float	VertexDepth;
#endif

void main()
{
	// Convert each vertex into projection-space and output the value
	highp vec4 vInVertex = vec4(inVertex, 1.0);
	gl_Position = MVPMatrix * vInVertex;
	
	#ifdef ENABLE_TEXTURE
		TexCoord = inTexCoord;
	#endif
	
	#ifdef ENABLE_FOG_DEPTH
		// Calculate the vertex's distance under water surface. This assumes clipping has removed all objects above the water
		mediump float vVertexHeight = (ModelMatrix * vec4(inVertex,1.0)).y;
		VertexDepth = WaterHeight - vVertexHeight;
	#endif
	
	#ifdef ENABLE_LIGHTING
		// Simple diffuse lighting in model space
		LightIntensity = 0.3 + clamp(dot(inNormal, -LightDirection),0.0,1.0);	// 0.5 is ambient light
	#endif
}
