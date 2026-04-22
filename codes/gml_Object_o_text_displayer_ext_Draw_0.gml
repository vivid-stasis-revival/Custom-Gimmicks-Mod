if (!instance_exists(cc))
    exit;

if (textalp>0 and enable_text_gimmick){
    draw_set_alpha(textalp);
    draw_set_halign(fa_center);
    draw_set_font(global.default_font);
    var col=textcolrgb
    col=make_color_rgb(color_get_blue(col),color_get_green(col),color_get_red(col))
    draw_set_color(col);
    draw_text_ext_transformed(textX,textY,current_text,textsep,textmaxwidth,textscale,textscale,textrot);
}