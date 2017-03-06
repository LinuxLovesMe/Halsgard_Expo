///gfx_blur_masked(surface, tex_mask, iterations, radius, bokeh, invert);

if (surface_exists(argument0) && argument2>0 && argument3!=0){
    var SHADER, sMASKTEX, uRESINV, uRADIUS, uBOKEH, i;

    SHADER = shd_blur_masked;
    sMASKTEX = shader_get_sampler_index(SHADER,"MASKTEX");
    uRESINV = shader_get_uniform(SHADER,"RESINV");
    uRADIUS = shader_get_uniform(SHADER,"RADIUS");
    uBOKEH = shader_get_uniform(SHADER,"BOKEH");

    shader_set(SHADER);
    texture_set_stage(sMASKTEX,argument1);
    shader_set_uniform_f(uBOKEH,argument4);
    shader_set_uniform_f(uRESINV,surface_get_width(argument0),surface_get_height(argument0),argument5);

    for (i = 0; i < argument2; i += 1){
        shader_set_uniform_f(uRADIUS,argument3/(1+1.333*i));
        surface_set_target(argument0);
        draw_surface(argument0,0,0);
        surface_reset_target();
    }

    shader_reset();

    surface_set_target(argument0);
    surface_reset_target();
}
