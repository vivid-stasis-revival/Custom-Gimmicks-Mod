var curms=(cc.mod_freeze==0)?cc.currentms:cc.mod_freeze
var excatCurMs=o_scrollSpeedHandler.warpedTime(curms + cc.mod_yoffset+variable_instance_get(cc, string("mod_yoffsetind{0}", arg1)))
var excatDist=(arg0+curms)-excatCurMs
var yoff = 144 - ((excatDist / 10) * arg3 * cc.mod_velocity);