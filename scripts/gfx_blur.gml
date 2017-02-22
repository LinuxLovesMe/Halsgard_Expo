///gfx_blur(surface, iterations, size, bokeh);
if(surface_exists(argument0) && argument1>0 && argument2!=0){
    var SHADER, uSIZE, uTYPE, uBOKEH;
    var surf_width, surf_height, size, i;

    SHADER = shd_blur;
    uSIZE = shader_get_uniform(SHADER,"SIZE");
    uTYPE = shader_get_uniform(SHADER,"TYPE");
    uBOKEH = shader_get_uniform(SHADER,"BOKEH");

    surf_width = surface_get_width(argument0);
    surf_height = surface_get_height(argument0);

    shader_set(SHADER);
    shader_set_uniform_f(uBOKEH,argument3);
    for (i=0; i<argument1; i+=1){
        size = argument2/(1+1.333*i);
        shader_set_uniform_f(uSIZE,size/surf_width,size/surf_height);

        shader_set_uniform_f(uTYPE,0);
        surface_set_target(argument0);
        draw_surface_part(argument0, 0, 0, surf_width, surf_height - 32, 0, 0);
        surface_reset_target();
        
        shader_set_uniform_f(uTYPE,1);
        surface_set_target(argument0);
        draw_surface_part(argument0, 0, 0, surf_width, surf_height - 32, 0, 0);
        surface_reset_target();
    }

    shader_reset();

    surface_set_target(argument0);
    surface_reset_target();
}
