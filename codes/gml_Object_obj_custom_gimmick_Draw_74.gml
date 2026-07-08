if (!instance_exists(cc))
    exit;

if (proxyCount!=0){
    //pass
}
else{
    if (aftsprite != undefined && sprite_exists(aftsprite))
    {
        sprite_delete(aftsprite);
        aftsprite = undefined;
    }
    shader_set(shader_custom_main);
    shader_set_uniform_f(uTime, cc.currentms / 1000);
    shader_set_uniform_f(uGrayAmp, cc.mod_gray);
    shader_set_uniform_f(uBarrelAmp, cc.mod_barrel + cc.mod_barrel2);
    shader_set_uniform_f(uHDistortAmp, cc.mod_hdistort);
    shader_set_uniform_f(uVDistortAmp, cc.mod_vdistort);
    shader_set_uniform_f(uFishAmp, cc.mod_fish);
    shader_set_uniform_f(uVigAmp, cc.mod_vig);
    shader_set_uniform_f(bloom, cc.mod_bloom);
    shader_set_uniform_f(uAbX, cc.mod_abx);
    shader_set_uniform_f(uAbY, cc.mod_aby);
    shader_set_uniform_f(uAbberationX, cc.mod_barrelabx);
    shader_set_uniform_f(uAbberationY, cc.mod_barrelaby);
    shader_set_uniform_f(uSTime, cc.mod_glitchoffset);
    shader_set_uniform_f(uGlitchAmp, cc.mod_glitchamp);
    shader_set_uniform_f(uHNoise, cc.mod_uhnoise);
    for (var i = 1; i < 5; i++)
    {
        var twx = variable_instance_get(cc, string("mod_twx{0}", i));
        var twy = variable_instance_get(cc, string("mod_twy{0}", i));
        var twa = variable_instance_get(cc, string("mod_twa{0}", i));
        var twr = variable_instance_get(cc, string("mod_twr{0}", i));
        shader_set_uniform_f(variable_instance_get(cc,string("uTwist{0}",i)), twx, twy, twa * 0.6, twr);
    }
    shader_set_uniform_f(uSinm, cc.mod_sina,cc.mod_sinp,cc.mod_sino);
    shader_set_uniform_f(uCosm, cc.mod_cosa,cc.mod_sinp,cc.mod_coso);
    shader_set_uniform_f(uTanm, cc.mod_tana,cc.mod_tanp,cc.mod_tano);
    shader_set_uniform_f(uMove, cc.mod_posx,cc.mod_posy);
    texture_set_stage(uNoiseSampler, noisetex);
    draw_surface_stretched(application_surface, 0, 0, 320, 180);
    shader_reset();
}
//custom
if (cc.ENABLE_NON_BASE_FX)
{
    var colarray = [];
    colarray[0] = color_get_red(make_color_hsv(cc.mod_curcolor, 255, 255));
    colarray[1] = color_get_green(make_color_hsv(cc.mod_curcolor, 255, 255));
    colarray[2] = color_get_blue(make_color_hsv(cc.mod_curcolor, 255, 255));
    var tintarray = []
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
}
