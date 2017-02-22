attribute vec3 in_Position;
attribute vec4 in_Colour;
attribute vec2 in_TextureCoord;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D MASKTEX;
uniform vec3 RESINV;
uniform float RADIUS;
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
    vec4 texture = texture2D(gm_BaseTexture, v_vTexcoord);
    vec4 mask = texture2D(MASKTEX, v_vTexcoord);

    float value = dot(mask.rgb, vec3(0.333));
    if(RESINV.z != 0.0) value = 1.0 - value;

    if(value != 0.0){
        vec2 offset, radius;
        float angle;

        radius = RADIUS * value / RESINV.xy;

        texture = blur(gm_BaseTexture, v_vTexcoord);
        for (int i = 0; i < 8; i += 1){
            angle = 0.785398 * float(i);
            offset = v_vTexcoord + vec2(cos(angle), sin(angle)) * radius;
            texture += blur( gm_BaseTexture, offset);
        }

        texture /= wvalue;
    }

    texture.a = 1.0;

    gl_FragColor = v_vColour * texture;
}
