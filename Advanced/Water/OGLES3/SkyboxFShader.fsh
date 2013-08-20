#version 300 es
uniform samplerCube CubeMap;

#ifdef ENABLE_FOG_DEPTH
uniform lowp vec3 FogColour;
uniform mediump float RcpMaxFogDepth;
#endif
#ifdef ENABLE_DISCARD_CLIP
uniform bool ClipPlaneBool;
#endif

in mediump vec3 EyeDir;
#ifdef ENABLE_FOG_DEPTH
in mediump float VertexDepth;
#endif
#ifdef ENABLE_DISCARD_CLIP
in highp float ClipDist;
#endif

layout (location = 0) out lowp vec4 oColour;

void main()
{
	#ifdef ENABLE_DISCARD_CLIP
		// Reject fragments behind the clip plane
		if(ClipDist < 0.0)
		{
			discard; // Too slow for hardware. Left as an example of how not to do this!
		}
	#endif
	
	#ifdef ENABLE_FOG_DEPTH
		// Mix the object's colour with the fogging colour based on fragment's depth
		lowp vec3 vFragColour = texture(CubeMap, EyeDir).rgb;
		
		// Test depth
		lowp float fFogBlend = clamp(VertexDepth * RcpMaxFogDepth, 0.0, 1.0);
		vFragColour.rgb = mix(vFragColour.rgb, FogColour.rgb, fFogBlend);
			
		oColour = vec4(vFragColour.rgb, 1.0);
	#else
		oColour = texture(CubeMap, EyeDir);
		
	#endif
}