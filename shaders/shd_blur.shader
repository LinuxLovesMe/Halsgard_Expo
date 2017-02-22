attribute vec3 in_Position;
attribute vec4 in_Colour;
attribute vec2 in_TextureCoord;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec4 uv1;
varying vec4 uv2;
varying vec4 uv3;
varying vec4 uv4;

uniform vec2 SIZE;
uniform int TYPE;

void main()
{    
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;    
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
    
    if(TYPE == 1){        
        uv1.xy = vec2(v_vTexcoord.x, v_vTexcoord.y - SIZE.y * 0.5);
        uv1.zw = vec2(v_vTexcoord.x, v_vTexcoord.y - SIZE.y * 0.375);
        uv2.xy = vec2(v_vTexcoord.x, v_vTexcoord.y - SIZE.y * 0.25);
        uv2.zw = vec2(v_vTexcoord.x, v_vTexcoord.y - SIZE.y * 0.125);
        uv3.xy = vec2(v_vTexcoord.x, v_vTexcoord.y + SIZE.y * 0.125);
        uv3.zw = vec2(v_vTexcoord.x, v_vTexcoord.y + SIZE.y * 0.25);
        uv4.xy = vec2(v_vTexcoord.x, v_vTexcoord.y + SIZE.y * 0.375);
        uv4.zw = vec2(v_vTexcoord.x, v_vTexcoord.y + SIZE.y * 0.5);
    }else{
        uv1.xy = vec2(v_vTexcoord.x - SIZE.x * 0.5, v_vTexcoord.y);
        uv1.zw = vec2(v_vTexcoord.x - SIZE.x * 0.375, v_vTexcoord.y);
        uv2.xy = vec2(v_vTexcoord.x - SIZE.x * 0.25, v_vTexcoord.y);
        uv2.zw = vec2(v_vTexcoord.x - SIZE.x * 0.125, v_vTexcoord.y);
        uv3.xy = vec2(v_vTexcoord.x + SIZE.x * 0.125, v_vTexcoord.y);
        uv3.zw = vec2(v_vTexcoord.x + SIZE.x * 0.25, v_vTexcoord.y);
        uv4.xy = vec2(v_vTexcoord.x + SIZE.x * 0.375, v_vTexcoord.y);
        uv4.zw = vec2(v_vTexcoord.x + SIZE.x * 0.5, v_vTexcoord.y);
    }
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec4 uv1;
varying vec4 uv2;
varying vec4 uv3;
varying vec4 uv4;
uniform float BOKEH;

float wvalue;

vec4 blur(sampler2D in_texture, vec2 in_Texcoord){
    vec4 texture = texture2D(in_texture, in_Texcoord);    
    if(BOKEH != 0.0){
        float w = pow(abs(dot(texture.rgb,vec3(0.333)) + length(texture.rgb) + 0.1), BOKEH) + 1.0;
        wvalue += w;
        texture *= w;
    }else{
        wvalue = 9.0;
    }
    return texture;
}

void main()
{
    vec4 texture = blur( gm_BaseTexture, v_vTexcoord);
    texture += blur( gm_BaseTexture, uv1.xy);
    texture += blur( gm_BaseTexture, uv1.zw);
    texture += blur( gm_BaseTexture, uv2.xy);
    texture += blur( gm_BaseTexture, uv2.zw);
    texture += blur( gm_BaseTexture, uv3.xy);
    texture += blur( gm_BaseTexture, uv3.zw);
    texture += blur( gm_BaseTexture, uv4.xy);
    texture += blur( gm_BaseTexture, uv4.zw);
    texture.rgb /= wvalue;
    texture.a = 1.0;
    gl_FragColor = v_vColour * texture;
}
