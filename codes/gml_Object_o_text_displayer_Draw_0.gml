if (!instance_exists(cc))
    exit;

if (cc.mod_textalp>0 and enable_text_gimmick){
    current_text=text_array[text_array_length-1][1];
    for(i=0;i<array_length(text_array);i++){
        if (text_array[i][0]>cc.currentbeataccurate){
            current_text=text_array[max(i-1,0)][1];
            break;
        }
    }
    draw_set_alpha(cc.mod_textalp);
    draw_set_halign(fa_center);
    draw_set_font(global.default_font);
    var col=cc.mod_textcolhex
    if (cc.mod_col_convertion){
        col=make_color_rgb(color_get_blue(col),color_get_green(col),color_get_red(col))
    }
    draw_set_color(col);
    draw_text_transformed(cc.mod_textX,cc.mod_textY,current_text,cc.mod_textscale,cc.mod_textscale,cc.mod_textrot);
}