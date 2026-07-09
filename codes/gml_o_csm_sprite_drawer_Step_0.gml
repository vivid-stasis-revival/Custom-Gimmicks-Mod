for (var i=0;i<array_length(images);i++){
    var spr=images[i];
    if (spr.type==1){
        var fs=variable_instance_get(cc, string("mod_framespd_{0}",spr.ID));
        if (fs >= 0){
            sprite_set_speed(spr.asset,fs,spritespeed_framespersecond);
            variable_instance_set(cc, string("mod_framespd_{0}",spr.ID),-1);
        }
    }
}