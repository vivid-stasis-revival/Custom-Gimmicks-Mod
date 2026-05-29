event_inherited();
if (!instance_exists(cc))
    exit;

//global.NOTE_SIZE*=cc.mod_note_size;

if (!instance_exists(cc))
    exit;

if (sidespawner == 0 && cc.mod_sides > 0)
{
    spawnfunc();
    sidespawner = 1;
}

if (sidespawner == 1 && cc.mod_sides == 0)
    sidespawner = 0;

if (cc.mod_slash_anycol > 0)
{
    var the = instance_create_depth(0, 0, 255, o_anycol_slash);
    var col = cc.mod_set_slash_col
    if (cc.mod_col_convertion){
        col=make_color_rgb(color_get_blue(col),color_get_green(col),color_get_red(col))
    }
    the.color = col;
    cc.mod_slash_anycol = 0;
}

if (cc.mod_sides > 0)
{
    spawnfunc();
    cc.mod_sides = 0;
}

if(cc.ENABLE_NON_BASE_FX)
{
    if (cc.mod_recolor > 0)
    {
        curcolor = irandom(255);
        cc.mod_recolor = 0;
    }
}

if (cc.ENABLE_DF_GRID_AND_SIDELINE)
{
    if (cc.mod_df_sideline2 > 0)
    {
        with (instance_create_depth(0, 0, depth, obj_distortedfate_sideline))
        {
            TweenFire(self, EaseOutCirc, 0, true, 0, 0.75, "x", 0, 90);
            TweenFire(self, EaseOutCirc, 0, true, 0, 0.75, "image_alpha", 1, 0);
        }
        
        with (instance_create_depth(319, 0, depth, obj_distortedfate_sideline))
        {
            TweenFire(self, EaseOutCirc, 0, true, 0, 0.75, "x", 319, 229);
            TweenFire(self, EaseOutCirc, 0, true, 0, 0.75, "image_alpha", 1, 0);
        }
        
        cc.mod_df_sideline2 = 0;
    }
}

if(cc.ENABLE_DISTORT_BG){
    layer_background_sprite(bgEleId, o_csm_jacket.jacket);
    o_csm_particle_system.blackSurfAlpha=1-cc.mod_ditortedBG_alp;
    layer_background_blend(bgEleId, make_color_rgb(color_get_blue(cc.mod_ditortedBG_col_rgb),color_get_green(cc.mod_ditortedBG_col_rgb),color_get_red(cc.mod_ditortedBG_col_rgb)));
    fx_set_parameter(blurEff, "g_Radius", cc.mod_BG_blurRadius);
    fx_set_parameter(blurEff, "g_NoiseTexture ", noisetex);
    fx_set_parameter(distortEff, "g_Distort1Scale", cc.mod_BG_ditortScale);
    fx_set_parameter(distortEff, "g_Distort2Scale", cc.mod_BG_ditortScale);
    fx_set_parameter(distortEff, "g_Distort1Amount", cc.mod_BG_ditortAmount);
    fx_set_parameter(distortEff, "g_Distort2Amount", cc.mod_BG_ditortAmount);
}

if(cc.ENABLE_ANGELSTAR_CHECKER)
{
    if (cc.mod_angelstar_checker_mode==0)
        o_angelstar_checker.depth=721;
    else if (cc.mod_angelstar_checker_mode==1)
        o_angelstar_checker.depth=301;
    else if (cc.mod_angelstar_checker_mode==2)
        o_angelstar_checker.depth=-50;
    
}