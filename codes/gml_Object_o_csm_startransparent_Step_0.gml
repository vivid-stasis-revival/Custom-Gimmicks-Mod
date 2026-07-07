lifetime += cc.timediff;
image_alpha = min(1, 2 - (lifetime / 2)) * cc.mod_starchgcol_alpha;
//WriteInLogWithTag(self, string("{0},{1}", lifetime, image_alpha));
y += (spd * cc.mod_starspd_multiplier * cc.timediff * 60);
if (image_alpha <= 0 || y >= 185)
    instance_destroy();