mod_freeze = 0;
mod_jumpto = 0;
mod_playspeed = 1;
songInfo = global.song_list[global.last_freeplay_song];

if(struct_exists(songInfo, "is_custom"))
{
    ENBALE_CHANGEABLE_JACKET=true;
    JACKET_MANAGER="plaudite"//or custom
    ENABLE_TEXT=true;
    ENABLE_NON_BASE_FX=true;
    ENABLE_DF_GRID_AND_SIDELINE=true;
    ENABLE_ANGELSTAR_CHECKER=true;
    ENABLE_DISTORT_BG=true;
    ENABLE_MUSIC_CONTROL=true;
    var loadConfig=true;
    var configPath = songInfo.chart_path + string("{0}_cgmk_config.json", global.df_load);
    if (!file_exists(configPath)){
        configPath = songInfo.chart_path + "cgmk_config.json";
        if (!file_exists(configPath))
            loadConfig=false;
    }

    config={};
    configText="";
    if (loadConfig){
        var fp=file_text_open_read(configPath);
        while (!file_text_eof(fp))
        configText = configText + file_text_readln(fp);
        file_text_close(fp);
        config=json_parse(configText);
    }
    if (struct_names_count(config)>0)
    {
        var keys=struct_get_names(config);
        array_foreach(keys,
            function(_ele,_idx){
            variable_instance_set(cc, _ele, struct_get(config, _ele));
            }
        )
    }
}

if(!struct_exists(songInfo, "is_custom") || !ENABLE_NON_BASE_FX){
    layer_destroy(layer_get_id("FX_red"));
    layer_destroy(layer_get_id("FX_twirl"));
    layer_destroy(layer_get_id("FX_posterize"));
    layer_destroy(layer_get_id("FX_edge"));
    layer_destroy(layer_get_id("FX_hue"));
    layer_destroy(layer_get_id("FX_underwater"));
    layer_destroy(layer_get_id("FX_zoom"));
}