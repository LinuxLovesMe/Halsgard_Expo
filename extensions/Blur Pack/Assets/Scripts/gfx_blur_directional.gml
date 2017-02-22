///gfx_blur_directional(surface, iterations, centered, direction, size);
if(surface_exists(argument0) && argument1>0 && argument4!=0){
    var SHADER, uSIZE, uCENTERED;
    var surf_width, surf_height, angle, dir_cos, dir_sin, size, i;

    SHADER = shd_blur_directional;
    uSIZE = shader_get_uniform(SHADER,'SIZE');
    uCENTERED = shader_get_uniform(SHADER,'CENTERED');

    surf_width = surface_get_width(argument0);
    surf_height = surface_get_height(argument0);
    angle = degtorad(argument3);
    dir_cos = cos(angle);
    dir_sin = sin(angle);

    shader_set(SHADER);
    shader_set_uniform_f(uCENTERED,argument2);

    for (i=0; i<argument1; i+=1){
        size = argument4/(1+1.333*i);
        shader_set_uniform_f(uSIZE,-size/surf_width*dir_cos,size/surf_height*dir_sin);
        surface_set_target(argument0);
        draw_surface(argument0,0,0);
        surface_reset_target();
    }

    shader_reset();

    surface_set_target(argument0);
    surface_reset_target();
}
