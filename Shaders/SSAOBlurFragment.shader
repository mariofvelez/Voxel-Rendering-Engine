#version 430 core

out float FragColor;

in vec2 TexCoord;

uniform sampler2D ssaoInput;

void main()
{
	vec2 texel_size = 1.0 / vec2(textureSize(ssaoInput, 0));
	float result = 0.0;
	for (int x = -2; x < 2; ++x)
	{
		for (int y = -2; y < 2; ++y)
		{
			vec2 offset = vec2(float(x), float(y)) * texel_size;
			result += texture(ssaoInput, TexCoord + offset).r;
		}
	}
	FragColor = result / 16.0;
}