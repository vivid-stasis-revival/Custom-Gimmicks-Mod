event_inherited();
if (!instance_exists(cc))
    exit;

global.NOTE_SIZE*=cc.mod_note_size;

if (!instance_exists(cc))
    exit;

if (sidespawner == 0 && cc.mod_sides > 0)
{
    spawnfunc();
    sidespawner = 1;
}

if (sidespawner == 1 && cc.mod_sides == 0)
    sidespawner = 0;

if (cc.mod_recolor > 0)
{
    curcolor = irandom(255);
    cc.mod_recolor = 0;
}

if (cc.mod_slash_anycol > 0)
{
    var the = instance_create_depth(0, 0, 255, o_plaudite_slash);
    var col = cc.mod_set_slash_col
    if (cc.mod_col_convertion){
        col=make_color_rgb(color_get_blue(col),color_get_green(col),color_get_red(col))
    }
    the.color = col;
    cc.mod_slash_anycol = 0;
}

if (cc.mod_plaudite_pburst > 0)
{
    for (var i = 0; i < cc.mod_plaudite_pburst; i++)
    {
        if (!instance_exists(o_2024pause))
            spawn_particles_directional(irandom_range(0, 320), -10, 701, o_pt_diamonddust, 1, 0, (delta_time / 10000) * cc.mod_pburstspeed, room_speed * 4, 1);
    }
    
    mod_pburstleft = 0;
}

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

if (cc.mod_sides > 0)
{
    spawnfunc();
    cc.mod_sides = 0;
}

layer_background_alpha(bgEleId, cc.mod_ditortedBG_alp);
layer_background_blend(bgEleId, make_color_rgb(color_get_blue(cc.mod_ditortedBG_col_rgb),color_get_green(cc.mod_ditortedBG_col_rgb),color_get_red(cc.mod_ditortedBG_col_rgb)));
if (cc.mod_wflash > 0)
    draw_sprite_ext(sp_opt_bgwhite, 0, 0, 0, 1, 1, 0, c_white, cc.mod_wflash);
