lifetime += cc.timediff;
image_alpha = min(1, 2 - (lifetime / 2)) * cc.mod_starchgcol_alpha;
//WriteInLogWithTag(self, string("{0},{1}", lifetime, image_alpha));
y += (spd * cc.mod_starspd_multiplier * cc.timediff * 60);
if (image_alpha <= 0 || y >= 185)
    instance_destroy();

var perc=y/185;
var h=lerp(col1Hsl[0],col2Hsl[0],perc);
var s=lerp(col1Hsl[1],col2Hsl[1],perc);
var v=lerp(col1Hsl[2],col2Hsl[2],perc);
image_blend=make_colour_hsv(h,s,v);