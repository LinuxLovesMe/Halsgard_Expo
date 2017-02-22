attribute vec3 in_Position;
attribute vec4 in_Colour;
attribute vec2 in_TextureCoord;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec4 uv1;
varying vec4 uv2;
varying vec4 uv3;
varying vec4 uv4;

uniform vec2 POSITION;
uniform vec2 RESOLUTION;
uniform float ANGLE;

vec2 texcoord(vec2 TextureCoord, float Angle){
    vec2 TexCoord, VecCoord, Result;
    float hyp, angle;
    
    TexCoord = TextureCoord * RESOLUTION;
    VecCoord = TexCoord - POSITION;

    hyp = distance(TexCoord, POSITION);
    angle = atan(VecCoord.x / VecCoord.y) + radians(90.0) - ANGLE * Angle;

    if(sign(VecCoord.y) == -1.0){
        Result.x = POSITION.x + cos(angle) * hyp;
        Result.y = POSITION.y - sin(angle) * hyp;
    }else{
        Result.x = POSITION.x - cos(angle) * hyp;
        Result.y = POSITION.y + sin(angle) * hyp;
    }

    return Result / RESOLUTION;
}

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;

    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;

    uv1.xy = texcoord(in_TextureCoord,-0.5);
    uv1.zw = texcoord(in_TextureCoord,-0.375);
    uv2.xy = texcoord(in_TextureCoord,-0.25);
    uv2.zw = texcoord(in_TextureCoord,-0.125);
    uv3.xy = texcoord(in_TextureCoord,0.125);
    uv3.zw = texcoord(in_TextureCoord,0.25);
    uv4.xy = texcoord(in_TextureCoord,0.375);
    uv4.zw = texcoord(in_TextureCoord,0.5);
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec4 uv1;
varying vec4 uv2;
varying vec4 uv3;
varying vec4 uv4;

void main()
{
    vec4 texture = texture2D( gm_BaseTexture, v_vTexcoord);
    texture += texture2D( gm_BaseTexture, uv1.xy );
    texture += texture2D( gm_BaseTexture, uv1.zw );
    texture += texture2D( gm_BaseTexture, uv2.xy );
    texture += texture2D( gm_BaseTexture, uv2.zw );
    texture += texture2D( gm_BaseTexture, uv3.xy );
    texture += texture2D( gm_BaseTexture, uv3.zw );
    texture += texture2D( gm_BaseTexture, uv4.xy );
    texture += texture2D( gm_BaseTexture, uv4.zw );
    texture.rgb /= 9.0;
    texture.a = 1.0;
    gl_FragColor = v_vColour * texture;
}
