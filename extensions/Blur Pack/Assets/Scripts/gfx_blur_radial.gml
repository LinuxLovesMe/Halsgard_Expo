///gfx_blur_radial(surface, iterations, x, y, centered, radius);
if(surface_exists(argument0) && argument1>0 && argument5!=0){
    var SHADER, uCENTERED, uPOSITION, uRADIUS;
    var surf_width, surf_height, radius, i;

    SHADER = shd_blur_radial;
    uCENTERED = shader_get_uniform(SHADER,"CENTERED");
    uPOSITION = shader_get_uniform(SHADER,"POSITION");
    uRADIUS = shader_get_uniform(SHADER,"RADIUS");
    
    surf_width = surface_get_width(argument0);
    surf_height = surface_get_height(argument0);
    radius = argument5/surf_height;

    shader_set(SHADER);
    shader_set_uniform_f(uCENTERED,argument4);
    shader_set_uniform_f(uPOSITION,argument2/surf_width,argument3/surf_height);

    for (i=0; i<argument1; i+=1){
        shader_set_uniform_f(uRADIUS,radius/(1+1.333*i));
        surface_set_target(argument0);
        draw_surface(argument0,0,0);
        surface_reset_target();
    }

    shader_reset();

    surface_set_target(argument0);
    surface_reset_target();
}
