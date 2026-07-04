event_inherited();

depth=-400
//Initilizers
function InitSkinChange(){
    if (!cc.ENABLE_SKIN_CHANGE)
        exit;
    singleSkins=[
        [sp_note_chip_normal, sp_note_chip_normal, sp_note_hold_nor+mal, sp_note_chip_normal, sp_note_chip_mine_normal],
        [sp_note_chip_stopmotion, sp_note_hold_start_stopmotion, sp_note_hold_stopmotion, sp_note_hold_end_stopmotion, sp_empty],
        [sp_note_chip_extendnova, sp_note_chip_extendnova, sp_note_hold_extendnova, sp_note_chip_extendnova, sp_note_chip_mine_normal],
        [sp_note_chip_stargazers, sp_note_hold_start_stargazers, sp_note_hold_stargazers, sp_note_hold_end_stargazers, sp_empty]
    ]
    bumperSkins=[
        [sp_note_bumper_normal, sp_note_bumper_timing_normal, sp_note_bumper_mine_normal],
        [sp_note_bumper_stopmotion, sp_empty, sp_empty],
        [sp_note_bumper_extendnova, sp_note_bumper_timing_normal, sp_note_bumper_mine_normal],
        [sp_note_bumper_stargazers, sp_note_bumper_timing_stargazers, sp_empty]

    ]
    addExtraMod("changeskin", 0, function(st,dur,v1,skinID){
        for (var lane=0;lane<7;lane++)
        {
            if (lane<4)
                obj_note_rendering.lane_sprites[lane]=obj_custom_gimmick.singleSkins[skinID]
            else
                obj_note_rendering.lane_sprites[lane]=obj_custom_gimmick.bumperSkins[skinID]
        }
    })
}

function InitCSMJacket(){
    layer_destroy_instances(layer_get_id("Instances_2"))
    layer_destroy_instances(layer_get_id("Instances_1"))
    var Lparticle=layer_create(401)
    var LBG=layer_create(404)
    instance_create_layer(0, 32, Lparticle, o_csm_particle_system)
    instance_create_layer(0, 32, LBG, o_csm_jacket)
    if (cc.JACKET_MANAGE_MODE=="plaudite"){
        addExtraMod("plaudite_jacket");
        cc.mod_plaudite_jacket = 11;
    }
    else{
        addExtraMod("custom_jacket");
        cc.mod_custom_jacket = 0;
    }
}

function InitText(){
    if (!cc.ENABLE_TEXT)
        exit;
    var tpathOld = cc.chartPath + string("{0}_text.txt", global.df_load);
    var tpath = "";
    if (file_exists(tpathOld)){
        addExtraMod("textX",0);
        addExtraMod("textY",0);
        addExtraMod("textalp",0);
        addExtraMod("textrot",0);
        addExtraMod("textcolhex",0);
        addExtraMod("textscale",0);
        cc.mod_textX = room_width*0.5;
        cc.mod_textY = room_height*0.5;
        cc.mod_textalp = 1;
        cc.mod_textrot = 0;
        cc.mod_textcolhex = 16777215;
        cc.mod_textscale = 1.0;
        var displayerSetting={};
        struct_set(displayerSetting,"text_path",tpathOld);
        if (!instance_exists(o_text_displayer)){
            instance_create_depth(0,0,-10,o_text_displayer,displayerSetting);
        }
    }
    else if (!instance_exists(o_text_displayer_ext)){
        var displayerSetting={};
        struct_set(displayerSetting,"caller",id);
        instance_create_depth(0,0,-10,o_text_displayer_ext,displayerSetting);
    }
}

function InitDistortBG(){
    if (!cc.ENABLE_DISTORT_BG)
        exit;
    var sprite = global.song_list[global.song_id_last].jacket;
    bgLayer = layer_create(402);
    blurLayer = layer_create(403);
    distortEff = fx_create("_filter_heathaze");
    blurEff = fx_create("_filter_large_blur");
    bgEleId = layer_background_create(bgLayer, sprite);
    var noisetex = sprite_get_texture(sp_noise2, 0);
    layer_set_fx(bgLayer, distortEff);
    layer_set_fx(blurLayer, blurEff);
    layer_background_stretch(bgEleId, true);
    //

    addExtraMod("ditortedBG_alp");
    addExtraMod("ditortedBG_col");
    addExtraMod("BG_ditortScale");
    addExtraMod("BG_ditortAmount");
    addExtraMod("BG_blurRadius");
    cc.mod_ditortedBG_alp = 0;
    cc.mod_ditortedBG_col_rgb = 16777215;
    cc.mod_BG_ditortScale = 0;
    cc.mod_BG_ditortAmount = 0;
    cc.mod_BG_blurRadius = 0;
}

function InitNonBaseFX(){
    if (!cc.ENABLE_NON_BASE_FX) {
        exit;
    }
    //CUSTOM FX
    if (!layer_exists("tintLayer")){
    var tintLayer = layer_create(-2400,"tintLayer")
    var tintFX=fx_create("_filter_colourise")
    layer_set_fx(tintLayer,tintFX)
    addExtraMod("fx_red_intensity")
    addExtraMod("fx_colorise_col_rgb");//col_rgb
    addExtraMod("fx_colorise_col_alpha");//col_a
    addExtraMod("fx_colorise_intensity");//strength
    cc.mod_fx_red_intensity = 1;
    cc.mod_fx_colorise_col_rgb = 16777215;
    cc.mod_fx_colorise_col_alpha = 1;
    cc.mod_fx_colorise_intensity = 0;

    //NON CUSTOM FX
    addExtraMod("recolor");
    addExtraMod("fx_hue_hue");
    addExtraMod("fx_hue_saturation");
    addExtraMod("fx_edge");
    addExtraMod("fx_posterize");
    addExtraMod("fx_twirl");
    addExtraMod("fx_posterize_vis");
    addExtraMod("fx_underwater");
    addExtraMod("fx_zoom");
    addExtraMod("fx_red");
    cc.mod_fx_hue_hue = 0;
    cc.mod_fx_hue_saturation = 1;
    cc.mod_fx_edge = 0;
    cc.mod_fx_posterize = 32;
    cc.mod_fx_posterize_vis = 0;
    cc.mod_fx_twirl = 0;
    cc.mod_fx_underwater = 0.01;
    cc.mod_fx_zoom = 0;
    cc.mod_fx_red = 0;
    cc.mod_recolor = 0;
    }
}

function InitDFGridAndLine(){
    if (!cc.ENABLE_DF_GRID_AND_SIDELINE)
        exit;
    //df
    addExtraMod("df_sideline2");
    addExtraMod("df_sides");
    addExtraMod("df_sideline");
    addExtraMod("df_whitebg");
    addExtraMod("df_grid_alpha");
    addExtraMod("df_grid_top");
    addExtraMod("df_grid_bottom");
    cc.mod_df_sideline2 = 0;
    cc.mod_df_sides = 0;
    cc.mod_df_sideline = 0;
    cc.mod_df_whitebg = 0;
    cc.mod_df_grid_alpha = 0;
    cc.mod_df_grid_top = 0;
    cc.mod_df_grid_bottom = 0;
}

function InitAngelstarChecker(){
    if(!cc.ENABLE_ANGELSTAR_CHECKER)
        exit;
    if (instance_exists(cc))
        instance_create_depth(0, 0, 721, o_angelstar_checker);
    addExtraMod("angelstar_checker_mode")
    addExtraMod("angelstar_checker_alpha");
    addExtraMod("angelstar_checker_set");
    cc.mod_angelstar_checker_mode=0;
    cc.mod_angelstar_checker_alpha = 0;
    cc.mod_angelstar_checker_set = 0;
}

function InitCustomShader(){
    //Shader Init
    uTime = shader_get_uniform(shader_custom_main, "time");
    uGrayAmp = shader_get_uniform(shader_custom_main, "uGrayAmp");
    uBarrelAmp = shader_get_uniform(shader_custom_main, "uBarrelAmp");
    uHDistortAmp = shader_get_uniform(shader_custom_main, "uHDistortAmp");
    uVDistortAmp = shader_get_uniform(shader_custom_main, "uVDistortAmp");
    uFishAmp = shader_get_uniform(shader_custom_main, "uFishAmp");
    uVigAmp = shader_get_uniform(shader_custom_main, "uVigAmp");
    bloom = shader_get_uniform(shader_custom_main, "bloom");
    uAbberationX = shader_get_uniform(shader_custom_main, "abberationx");
    uAbberationY = shader_get_uniform(shader_custom_main, "abberationy");
    uAbX = shader_get_uniform(shader_custom_main, "abX");
    uAbY = shader_get_uniform(shader_custom_main, "abY");
    uMove = shader_get_uniform(shader_custom_main, "move");
    uSinm = shader_get_uniform(shader_custom_main, "sinm");
    uCosm = shader_get_uniform(shader_custom_main, "cosm");
    uTanm = shader_get_uniform(shader_custom_main, "tanm");
    uHNoise=shader_get_uniform(shader_custom_main, "uHnoise");
    uGlitchAmp=shader_get_uniform(shader_custom_main, "glitchAmp");
    uSTime=shader_get_uniform(shader_custom_main, "stime");
    for (var i=1; i<=4; i++)
        variable_instance_set(cc,string("uTwist{0}",i),shader_get_uniform(shader_custom_main, string("twist{i}",i)));
    uNoiseSampler = shader_get_sampler_index(shader_supernova_main, "samplerRandom");
    noisetex = sprite_get_texture(sp_noise2, 0);

    addExtraMod("uialpha");
    addExtraMod("cover1");
    addExtraMod("cover2");
    addExtraMod("cover3");
    addExtraMod("rainbow");
    addExtraMod("sides");
    addExtraMod("noteoverlayalp");
    addExtraMod("scorealph");
    addExtraMod("bgalph");
    //shaderRelative
    addExtraMod("gray");
    addExtraMod("barrel");
    addExtraMod("barrel2");
    addExtraMod("hdistort");
    addExtraMod("vdistort");
    addExtraMod("vig");
    addExtraMod("abx");
    addExtraMod("aby");
    addExtraMod("barrelabx")
    addExtraMod("barrelaby")
    addExtraMod("fish");
    addExtraMod("bloom");
    addExtraMod("glitchamp");
    addExtraMod("glitchoffset");
    addExtraMod("uhnoise");
    addExtraMod("posx");
    addExtraMod("posy");
    for (var i = 1; i <= 4; i++)
    {
        addExtraMod(string("twx{0}", i));
        addExtraMod(string("twy{0}", i));
        addExtraMod(string("twa{0}", i));
        addExtraMod(string("twr{0}", i));
    }

    cc.mod_gray = 0;
    cc.mod_barrel = 0;
    cc.mod_barrel2 = 0;
    cc.mod_hdistort = 0;
    cc.mod_vdistort = 0;
    cc.mod_fish = 0;
    cc.mod_vig = 0;
    cc.mod_abx = 0;
    cc.mod_aby = 0;
    cc.mod_barrelabx=0;
    cc.mod_barrelaby=0;
    cc.mod_bloom = 0;
    cc.mod_uhnoise = 0;
    cc.mod_glitchamp = 0;
    cc.mod_glitchoffset = 0;
    //uCurvem
    cc.mod_sino = 0;
    cc.mod_sina = 0;
    cc.mod_sinp = 1;
    cc.mod_cosa = 0;
    cc.mod_cosp = 1;
    cc.mod_coso = 0;
    cc.mod_tana = 0;
    cc.mod_tanp = 1;
    cc.mod_tano = 0;
    //umove
    cc.mod_posx=0;
    cc.mod_posy=0;
    //utwist
    for (var i = 1; i <= 4; i++)
        {
            variable_instance_set(cc, string("mod_twx{0}", i), 0);
            variable_instance_set(cc, string("mod_twy{0}", i), 0);
            variable_instance_set(cc, string("mod_twa{0}", i), 0);
            variable_instance_set(cc, string("mod_twr{0}", i), 0.4);
        }

}



//Init some gmk
InitCSMJacket()
InitText();
InitDistortBG();
InitNonBaseFX();
InitDFGridAndLine();
InitAngelstarChecker();
InitCustomShader();
//End of Init

for (var i = 0; i < proxyCount; i++)
    proxies[i].pra = 1;
//OTHERS
addExtraMod("col_convertion", 0)
cc.mod_col_convertion = 0;//不为0时自动将所有输入的颜色转为rrggbb的形式（原本是bbggrr)

//SHADERS
// surf_1=-1;
// surf_2=-1;
// draw_w=320;
// draw_h=180;
//ANGELSTAR

//other
addExtraMod("static");
addExtraMod("holdoverlayalpha");
addExtraMod("plaudite_pburst",1,function(start, dur, v1, v2)
{
    for (var i = 0; i < v2; i++)
        spawn_particles_directional(irandom_range(0, 320), -10, 701, o_pt_diamonddust_songgameplay, 1, 0, 1.5 * cc.mod_pburstspeed, 240, 1);
});
addExtraMod("hide_combo");
addExtraMod("slash_anycol")
addExtraMod("set_slash_col")
addExtraMod("wflash");
// addExtraMod("starspawner_timer");
// addExtraMod("starspd_low");
// addExtraMod("starspd_high");
// addExtraMod("starspd_multiplier");


curcolor = 0;
aft = -1;
pixelated_topscreen = -1;
aftsprite = -1;
sidespawner = 0;
function custom_shader(){
    
    if (aftsprite != undefined && sprite_exists(aftsprite))
    {
        sprite_delete(aftsprite);
        aftsprite = undefined;
    }
    //ANGELSTAR
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
    shader_set_uniform_f(uCosm, cc.mod_cosa,cc.mod_cosp,cc.mod_coso);
    shader_set_uniform_f(uTanm, cc.mod_tana,cc.mod_tanp,cc.mod_tano);
    shader_set_uniform_f(uMove, cc.mod_posx,cc.mod_posy);
    texture_set_stage(uNoiseSampler, noisetex);
    //SUPANOVA
}

//others
cc.mod_uialpha = 1;
cc.mod_cover1 = 0;
cc.mod_cover2 = 0;
cc.mod_cover3 = 0;
cc.mod_wflash = 0;
cc.mod_rainbow = 0;
cc.mod_sides = 0;
cc.mod_noteoverlayalp = 1;
cc.mod_scorealph = 1;
cc.mod_bgalph = 1;
cc.mod_noteoverlayalp = 1;
cc.mod_sg_endblip = 0;
cc.mod_sg_endblip_destroy = 0;


//plaudite
cc.mod_plaudite_pburst = 0;
cc.mod_hide_combo = 0;
cc.mod_slash_anycol=0;
cc.mod_set_slash_col=16777215;

//special
function spawnfunc()
{
    with (instance_create_depth(150, 90, 260, o_unravel_sidething))
        dir = 1;
    
    with (instance_create_depth(170, 90, 260, o_unravel_sidething))
        dir = -1;
}
shouldPixelate = true;
main_shader = custom_shader;
