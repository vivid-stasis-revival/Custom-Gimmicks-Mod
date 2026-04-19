if (!instance_exists(cc))
    exit;

colarray = [];
colarray[0] = color_get_red(make_color_hsv(curcolor, 255, 255));
colarray[1] = color_get_green(make_color_hsv(curcolor, 255, 255));
colarray[2] = color_get_blue(make_color_hsv(curcolor, 255, 255));

if (proxyCount!=0){
    //pass
}
else{
        if (aftsprite != undefined && sprite_exists(aftsprite))
{
    sprite_delete(aftsprite);
    aftsprite = undefined;
}
    shader_set(shader_angelstar_main);
    shader_set_uniform_f(uTime1, cc.currentms / 1000);
    shader_set_uniform_f(uGrayAmp, cc.mod_gray);
    shader_set_uniform_f(uBarrelAmp, cc.mod_barrel + cc.mod_barrel2);
    shader_set_uniform_f(uHDistortAmp, cc.mod_hdistort);
    shader_set_uniform_f(uSTime, cc.mod_glitchoffset);
    shader_set_uniform_f(uFishAmp, cc.mod_fish);
    shader_set_uniform_f(uVigAmp, cc.mod_vig);
    shader_set_uniform_f(bloom, cc.mod_bloom);
    draw_surface_stretched(application_surface, 0, 0, 320, 180);
    shader_reset();
}
//custom
tintarray = []
tintarray[0] = color_get_blue(cc.mod_fx_colorise_col_rgb);
tintarray[1] = color_get_green(cc.mod_fx_colorise_col_rgb);
tintarray[2] = color_get_red(cc.mod_fx_colorise_col_rgb);
tintarray[3] = cc.mod_fx_colorise_col_alpha;
fx_set_parameter(layer_get_fx("tintLayer"), "g_TintCol", tintarray);
fx_set_parameter(layer_get_fx("tintLayer"), "g_Intensity", cc.mod_fx_colorise_intensity);
fx_set_parameter(layer_get_fx("FX_red"), "g_Intensity", cc.mod_fx_red_intensity);
//
//original
fx_set_parameter(layer_get_fx("FX_red"), "g_TintCol", colarray);
fx_set_parameter(layer_get_fx("FX_hue"), "g_HueShift", cc.mod_fx_hue_hue);
fx_set_parameter(layer_get_fx("FX_hue"), "g_HueSaturation", cc.mod_fx_hue_saturation);
layer_set_visible(layer_get_id("FX_edge"), cc.mod_fx_edge);
layer_set_visible(layer_get_id("FX_posterize"), cc.mod_fx_posterize_vis);
fx_set_parameter(layer_get_fx("FX_posterize"), "g_ColourLevels", cc.mod_fx_posterize);
fx_set_parameter(layer_get_fx("FX_twirl"), "g_DistortAngle", cc.mod_fx_twirl);
fx_set_parameter(layer_get_fx("FX_underwater"), "g_Distort1Amount", cc.mod_fx_underwater);
fx_set_parameter(layer_get_fx("FX_underwater"), "g_Distort2Amount", cc.mod_fx_underwater);
fx_set_parameter(layer_get_fx("FX_zoom"), "g_ZoomBlurIntensity ", cc.mod_fx_zoom);
layer_set_visible(layer_get_id("FX_red"), cc.mod_fx_red);
