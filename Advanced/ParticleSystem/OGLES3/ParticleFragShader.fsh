#version 300 es

uniform sampler2D sTexture;

in mediump vec2 vTexCoord;
layout (location = 0) out lowp vec4 oColour;

void main()
{
	oColour = vec4(texture(sTexture, vTexCoord).rgb, vTexCoord.s);
}
