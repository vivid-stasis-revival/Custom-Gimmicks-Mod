event_inherited();

var song = global.song_list[global.last_freeplay_song];
var tpathOld = song.chart_path + string("{0}_text.txt", global.df_load)
var tpath = ""
if (file_exists(tpathOld)){
    if (!instance_exists(o_text_displayer)){
        instance_create_depth(0,0,-10,o_text_displayer,{
            text_path:tpathOld
        });
        
    }
}
else{
    if (!instance_exists(o_text_displayer_ext)){
        for (var tid=0;tid<50;tid++){
            tpath = song.chart_path + string("{0}_text_{1}.txt", global.df_load,tid);
            if (!file_exists(tpath)){
                continue;
            }
            addExtraMod(string("textX_{0}",tid),0);
            addExtraMod(string("textY_{0}",tid),0);
            addExtraMod(string("textX_{0}b",tid),0);
            addExtraMod(string("textY_{0}b",tid),0);
            addExtraMod(string("textalp_{0}",tid),0);   //0~1
            addExtraMod(string("textrot_{0}",tid),0);
            addExtraMod(string("textcolrgb_{0}",tid),0);    //dec
            addExtraMod(string("textscale_{0}",tid),0);
            addExtraMod(string("textsep_{0}",tid),0);
            addExtraMod(string("textmaxwidth_{0}",tid),0);
            variable_instance_set(cc,string("mod_textX_{0}",tid),room_width*0.5);
            variable_instance_set(cc,string("mod_textY_{0}",tid),room_width*0.5);
            variable_instance_set(cc,string("mod_textX_{0}b",tid),0);
            variable_instance_set(cc,string("mod_textY_{0}b",tid),0);
            variable_instance_set(cc,string("mod_textalp_{0}",tid),1);
            variable_instance_set(cc,string("mod_textrot_{0}",tid),0);
            variable_instance_set(cc,string("mod_textcolrgb_{0}",tid),16777215);
            variable_instance_set(cc,string("mod_textscale_{0}",tid),1);
            variable_instance_set(cc,string("mod_textsep_{0}",tid),2);
            variable_instance_set(cc,string("mod_textmaxwidth_{0}",tid),20);
            instance_create_depth(0,0,-10,o_text_displayer_ext,{
                textID:tid,
                text_path:tpath
            });
            
        }
    }
}
if (instance_exists(cc))
    instance_create_depth(0, 0, 721, o_angelstar_checker);
for (var i = 0; i < proxyCount; i++)
    proxies[i].pra = 1;

if (!layer_exists("tintLayer")){
    var tintLayer = layer_create(-2400,"tintLayer")
    var tintFX=fx_create("_filter_colourise")
    layer_set_fx(tintLayer,tintFX)
}

if (!layer_exists("bg"))
{
    var sprite = global.song_list[global.song_id_last].jacket;
    var bgEffLayer = layer_create(801);
    var bgLayer = layer_create(802);
    var distortEff = fx_create("_filter_heathaze");
    var blurEff = fx_create("_filter_large_blur");
    fx_set_parameter(distortEff, "g_Distort1Scale", 25);
    fx_set_parameter(distortEff, "g_Distort2Scale", 25);
    fx_set_parameter(distortEff, "g_Distort1Amount", 25);
    fx_set_parameter(distortEff, "g_Distort2Amount", 25);
    bgEleId = layer_background_create(bgLayer, sprite);
    layer_set_fx(bgEffLayer, distortEff);
    layer_set_fx(bgLayer, blurEff);
    layer_background_stretch(bgEleId, true);
}


addExtraMod("textX",0)
addExtraMod("textY",0)
addExtraMod("textalp",0)//0~1
addExtraMod("textrot",0)
addExtraMod("textcolhex",0)//dec
addExtraMod("textscale",0)
cc.mod_textX = room_width*0.5;
cc.mod_textY = room_height*0.5;
cc.mod_textalp = 1;
cc.mod_textrot = 0;
cc.mod_textcolhex = 16777215;
cc.mod_textscale = 1;

//OTHERS
addExtraMod("note_size")
cc.mod_note_size = 1;

addExtraMod("col_convertion", 0)
cc.mod_col_convertion = 0;//不为0时自动将所有输入的颜色转为rrggbb的形式（原本是bbggrr)

//BG
addExtraMod("ditortedBG_alp")
cc.mod_ditortedBG_alp = 0;
addExtraMod("ditortedBG_col")
cc.mod_ditortedBG_col_rgb = 16777215;

//CUSTOM SHADERS
addExtraMod("fx_red_intensity")
addExtraMod("fx_colorise_col_rgb");//col_rgb
addExtraMod("fx_colorise_col_alpha");//col_a
addExtraMod("fx_colorise_intensity");//strength
cc.mod_fx_red_intensity = 1;
cc.mod_fx_colorise_col_rgb = 16777215;
cc.mod_fx_colorise_col_alpha = 1;
cc.mod_fx_colorise_intensity = 0;
//SHADERS
surf_1=-1;
surf_2=-1;
draw_w=320;
draw_h=180;
//ANGELSTAR
addExtraMod("uialpha");
addExtraMod("cover1");
addExtraMod("cover2");
addExtraMod("cover3");
addExtraMod("rainbow");
addExtraMod("sides");
addExtraMod("notealp");
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
addExtraMod("abberationxamp");
addExtraMod("abberationyamp");
addExtraMod("fish");
addExtraMod("bloom");
// addExtraMod("glitchamp");
// addExtraMod("glitchoffset");
// addExtraMod("aberamp");
// addExtraMod("uhnoise");

//fx relative
addExtraMod("fx_hue_hue");
addExtraMod("fx_hue_saturation");
addExtraMod("fx_edge");
addExtraMod("fx_posterize");
addExtraMod("fx_twirl");
addExtraMod("fx_posterize_vis");
addExtraMod("fx_underwater");
addExtraMod("fx_zoom");
addExtraMod("fx_red");
addExtraMod("recolor");

//other
addExtraMod("static");
addExtraMod("angelstar_checker_mode")
addExtraMod("angelstar_checker_alpha");
addExtraMod("angelstar_checker_set");
addExtraMod("holdoverlayalpha");
addExtraMod("plaudite_pburst");
addExtraMod("hide_combo");
addExtraMod("plaudite_red_particle");
addExtraMod("slash_anycol")
addExtraMod("set_slash_col")
addExtraMod("df_sideline2");
addExtraMod("df_sides");
addExtraMod("df_sideline");
addExtraMod("df_whitebg");
addExtraMod("df_grid_alpha");
addExtraMod("df_grid_top");
addExtraMod("df_grid_bottom");
addExtraMod("wflash");
addExtraMod("plaudite_jacket");
addExtraMod("barrelabx")
addExtraMod("barrelaby")
// addExtraMod("starspawner_timer");
// addExtraMod("starspd_low");
// addExtraMod("starspd_high");
// addExtraMod("starspd_multiplier");


curcolor = 0;
aft = -1;
pixelated_topscreen = -1;
aftsprite = -1;
//plaudite
sidespawner = 0;
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
// uMove = shader_get_uniform(shader_supernova_main, "move");
// uSinm = shader_get_uniform(shader_supernova_main, "sinm");
// uCosm = shader_get_uniform(shader_supernova_main, "cosm");
// uTanm = shader_get_uniform(shader_supernova_main, "tanm");
// uFish = shader_get_uniform(shader_supernova_main, "fish");
// noisesampler = shader_get_sampler_index(shader_supernova_main, "samplerRandom");
// noisetex = sprite_get_texture(sp_noise2, 0);

function custom_shader(){
    var glitchmult = 0.333;
    var tanmult = 0.6;
    var fishmult = 0.8;
    var twistmult = 0.6;

    if (global.df_load == "FINALE")
    {
        glitchmult = 0.333;
        tanmult = 0.5;
        twistmult = 0.5;
    }

    if (global.df_load == "MIDDLE")
    {
        glitchmult = 0.25;
        tanmult = 0.45;
        twistmult = 0.4;
    }

    if (global.df_load == "OPENING")
    {
        glitchmult = 0.2;
        tanmult = 0.3;
        twistmult = 0.2;
    }

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
}
//shader relative////////////////////////////////////
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
// cc.mod_uhnoise = 0;
// cc.mod_glitchamp = 0;
// cc.mod_glitchoffset = 0;
// cc.mod_posx = 0;
// cc.mod_posy = 0;
// cc.mod_sina = 0;
// cc.mod_cosa = 0;
// cc.mod_tana = 0;
// cc.mod_sinp = 1;
// cc.mod_cosp = 1;
// cc.mod_tanp = 1;
// cc.mod_sino = 0;
// cc.mod_coso = 0;
// cc.mod_tano = 0;
///////////////////////////////////////

//fx relative
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

//others
cc.mod_angelstar_checker_mode=0;
cc.mod_uialpha = 1;
cc.mod_cover1 = 0;
cc.mod_cover2 = 0;
cc.mod_cover3 = 0;
cc.mod_wflash = 0;
cc.mod_rainbow = 0;
cc.mod_sides = 0;
cc.mod_notealp = 1;
cc.mod_noteoverlayalp = 1;
cc.mod_scorealph = 1;
cc.mod_bgalph = 1;
cc.mod_noteoverlayalp = 1;
cc.mod_sg_endblip = 0;
cc.mod_sg_endblip_destroy = 0;

cc.mod_angelstar_checker_alpha = 0;
cc.mod_angelstar_checker_set = 0;
//plaudite

cc.mod_plaudite_pburst = 0;
cc.mod_hide_combo = 0;
cc.mod_plaudite_red_particle = 0;
cc.mod_slash_anycol=0;
cc.mod_set_slash_col=16777215;
cc.mod_plaudite_jacket = 11;
//df
cc.mod_df_sideline2 = 0;
cc.mod_df_sides = 0;
cc.mod_df_sideline = 0;
cc.mod_df_whitebg = 0;
cc.mod_df_grid_alpha = 0;
cc.mod_df_grid_top = 0;
cc.mod_df_grid_bottom = 0;
// //star crasher
// cc.starspawner_timer = 0;
// cc.starspd_low = 0;
// cc.starspd_high = 0;
// cc.starspd_multiplier = 0;
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

//gmks
