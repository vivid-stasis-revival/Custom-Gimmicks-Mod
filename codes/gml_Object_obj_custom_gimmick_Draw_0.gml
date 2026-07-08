event_inherited();
if (!instance_exists(cc))
    exit;

if (cc.mod_wflash > 0)
    draw_sprite_ext(sp_opt_bgwhite, 0, 0, 0, 1, 1, 0, c_white, cc.mod_wflash);

if (cc.mod_static > 0)
{
    var frame = floor(cc.currentbeataccurate * 16) % 4;
    draw_sprite_ext(sp_static, frame, 0, 0, 2.5, 1.40625, 0, c_white, cc.mod_static);
    draw_sprite_ext(sp_static, (frame + 1) % 4, 160, 0, 2.5, 1.40625, 0, c_white, cc.mod_static);
    draw_sprite_ext(sp_static, (frame + 2) % 4, 160, 90, 2.5, 1.40625, 0, c_white, cc.mod_static);
    draw_sprite_ext(sp_static, (frame + 3) % 4, 0, 90, 2.5, 1.40625, 0, c_white, cc.mod_static);
}


draw_sprite_ext(sp_cover2, 0, 0, 0, 0.25, 0.25, 0, c_black, cc.mod_cover2);
draw_sprite_ext(sp_cover3, 0, 0, 0, 0.25, 0.25, 0, c_black, cc.mod_cover3);
draw_sprite_ext(sp_cover4, 0, 0, 0, 0.25, 0.25, 0, c_black, cc.mod_cover1);

