event_inherited();
if (!instance_exists(cc))
    exit;
draw_sprite_ext(sp_cover2, 0, 0, 0, 0.25, 0.25, 0, c_black, cc.mod_cover2);
draw_sprite_ext(sp_cover3, 0, 0, 0, 0.25, 0.25, 0, c_black, cc.mod_cover3);
draw_sprite_ext(sp_cover4, 0, 0, 0, 0.25, 0.25, 0, c_black, cc.mod_cover1);

draw_sprite(sp_df_sideline, 0, -1 + (cc.mod_df_sideline * 114), 0);
draw_sprite(sp_df_sideline, 0, 320 - (cc.mod_df_sideline * 114), 0);
draw_set_color(c_white);
draw_set_alpha(cc.mod_df_whitebg);
draw_rectangle(-1, -1, 321, 181, false);
draw_set_alpha(cc.mod_df_grid_alpha);
draw_sprite_part(sp_df_grid, 0, 0, cc.mod_df_grid_top, 320, cc.mod_df_grid_bottom - cc.mod_df_grid_top, 0, cc.mod_df_grid_top);
draw_set_alpha(1);
