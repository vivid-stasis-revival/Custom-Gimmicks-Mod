image_alpha = 0;
lifetime = 0;
imgidx = irandom(3);
spd = random_range(cc.mod_starspd_low, cc.mod_starspd_high);
var col1 = global.col_convert(cc.mod_starchgcol_up_rgb);
var col2 = global.col_convert(cc.mod_starchgcol_down_rgb);
col1Hsl=[colour_get_hue(col1),colour_get_saturation(col1),colour_get_value(col1)];
col2Hsl=[colour_get_hue(col2),colour_get_saturation(col2),colour_get_value(col2)];
