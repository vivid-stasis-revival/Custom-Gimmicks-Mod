global.col_convert=function(col){
    var r=color_get_red(col);
    var g=color_get_green(col);
    var b=color_get_blue(col);
    return make_color_rgb(r,g,b);
}