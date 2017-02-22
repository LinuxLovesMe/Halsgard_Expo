///gfx_blur_twist(surface, iterations, x, y, angle);
if(surface_exists(argument0) && argument1>0 && argument4!=0){
    var SHADER, uPOSITION, uRESOLUTION, uANGLE, i;

    SHADER = shd_blur_twist;
    uPOSITION = shader_get_uniform(SHADER,"POSITION");
    uRESOLUTION = shader_get_uniform(SHADER,"RESOLUTION");
    uANGLE = shader_get_uniform(SHADER,"ANGLE");

    shader_set(SHADER);
    shader_set_uniform_f(uPOSITION,argument2,argument3);
    shader_set_uniform_f(uRESOLUTION,surface_get_width(argument0),surface_get_height(argument0));

    for (i=0; i<argument1; i+=1){
        shader_set_uniform_f(uANGLE,degtorad(argument4/(1+1.333*i)));
        surface_set_target(argument0);
        draw_surface(argument0,0,0);
        surface_reset_target();
    };

    shader_reset();

    surface_set_target(argument0);
    surface_reset_target();
}
