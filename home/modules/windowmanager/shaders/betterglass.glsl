// betterglass.glsl
#version 450

layout (location = 0) in vec2 uv;
layout (location = 0) out vec4 fragColor;

layout (binding = 0) uniform sampler2D tex;
layout (push_constant) uniform PushConsts {
    float time;
    float opacity;
    vec2 resolution;
} pc;

vec2 aberration(vec2 uv, float amt) {
    float angle = 0.5;
    mat2 rot = mat2(cos(angle), -sin(angle), sin(angle), cos(angle));
    return uv + rot * vec2(amt * (uv.x - 0.5), amt * (uv.y - 0.5));
}

void main() {
    float shift = 0.002;
    vec3 col;
    col.r = texture(tex, aberration(uv, shift)).r;
    col.g = texture(tex, aberration(uv, -shift * 0.5)).g;
    col.b = texture(tex, aberration(uv, -shift)).b;
    
    // Add slight brightness bloom
    float bright = dot(col, vec3(0.299, 0.587, 0.114));
    col += bright * 0.05;
    
    // Add subtle noise
    float n = fract(sin(dot(uv.xy ,vec2(12.9898,78.233))) * 43758.5453);
    col += (n - 0.5) * 0.02;

    fragColor = vec4(col, pc.opacity);
}
