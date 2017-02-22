attribute vec3 in_Position;
attribute vec4 in_Colour;
attribute vec2 in_TextureCoord;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

varying vec4 uv1;
varying vec4 uv2;
varying vec4 uv3;
varying vec4 uv4;

uniform vec2 RESOLUTION;
uniform float RADIUS;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;    
    
    vec2 radius = RADIUS / RESOLUTION;
    uv1.xy = v_vTexcoord + vec2(1.0,0.0) * radius;    
    uv1.zw = v_vTexcoord + vec2(0.707106,0.707106) * radius;    
    uv2.xy = v_vTexcoord + vec2(0.0,1.0) * radius;    
    uv2.zw = v_vTexcoord + vec2(-0.707106,0.707106) * radius;    
    uv3.xy = v_vTexcoord + vec2(-1.0,0.0) * radius;    
    uv3.zw = v_vTexcoord + vec2(-0.707106,-0.707106) * radius;    
    uv4.xy = v_vTexcoord + vec2(0.0,-1.0) * radius;    
    uv4.zw = v_vTexcoord + vec2(0.707106,-0.707106) * radius;
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

void main(){
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
