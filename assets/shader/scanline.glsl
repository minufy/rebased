extern vec2 texture_size;
extern number scanline_strength;
extern number glow_strength;

vec4 effect(vec4 vertex_color, Image texture, vec2 texture_coords, vec2 screen_coords) {
    vec2 pixel = 1.0 / texture_size;

    vec4 base = Texel(texture, texture_coords);

    // Sample the four neighboring pixels.
    vec3 nearby = (
        Texel(texture, texture_coords + vec2( pixel.x, 0.0)).rgb +
        Texel(texture, texture_coords + vec2(-pixel.x, 0.0)).rgb +
        Texel(texture, texture_coords + vec2(0.0,  pixel.y)).rgb +
        Texel(texture, texture_coords + vec2(0.0, -pixel.y)).rgb
    ) * 0.25;

    // Only brighter nearby pixels produce much glow.
    vec3 glow = max(nearby - vec3(0.25), vec3(0.0));

    // One darkened line for roughly every two source pixels.
    float pixel_y = texture_coords.y * texture_size.y;
    float scanline = 1.0
        - scanline_strength
        * (0.5 + 0.5 * sin(pixel_y * 3.14159265));

    vec3 result = base.rgb + glow * glow_strength;
    result *= scanline;

    return vec4(result, base.a) * vertex_color;
}