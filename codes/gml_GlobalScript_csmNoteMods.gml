//arg0:lane,arg1:time
function gmlNoteModsX(arg0, arg1, arg2)
{
    var scale = function(arg0, arg1, arg2, arg3, arg4)
    {
        return (((arg0 - arg1) * (arg4 - arg3)) / (arg2 - arg1)) + arg3;
    };
    
    var xpos = 0;
    if (cc.mod_beat != 0)
    {
        var fAccelTime = 0.3;
        var fTotalTime = 0.7;
        var fBeat = cc.currentbeataccurate + fAccelTime;
        var bEvenBeat = (fBeat % 2) < 1;
        fBeat %= 1;
        
        if (fBeat < fTotalTime)
        {
            var fAmount = 0;
            
            if (fBeat < fAccelTime)
            {
                fAmount = scale(fBeat, 0, fAccelTime, 0, 1);
                fAmount = fAmount * fAmount;
            }
            else
            {
                fAmount = scale(fBeat, fAccelTime, fTotalTime, 1, 0);
                fAmount = 1 - ((1 - fAmount) * (1 - fAmount));
            }
            
            fAmount *= (bEvenBeat ? 1 : -1);
            var fShift = 11 * fAmount * sin((arg1 / 60) + 1.5707963267948966);
            xpos += ((cc.mod_beat / 100) * fShift);
        }
    }
    xpos += cc.mod_xoffset+variable_instance_get(cc, string("mod_xoffsetind{0}", arg0));
    xpos += cc.mod_xoffsetb+variable_instance_get(cc, string("mod_xoffsetindb{0}", arg0));
    return xpos;
}
//arg0:dist, arg1:lane
function gmlNoteModsY(arg0, arg1,arg2)
{
    var scrollind=variable_instance_get(cc, string("mod_scrollind{0}",arg1));
    var curms=(cc.mod_freeze==0)?cc.currentms:cc.mod_freeze;
    var yoff=cc.mod_yoffset+variable_instance_get(cc, string("mod_yoffsetind{0}", arg1))
    yoff+=cc.mod_yoffsetb+variable_instance_get(cc, string("mod_yoffsetindb{0}", arg1))
    var excatCurMs=o_scrollSpeedHandler.warpedTime(curms + yoff);
    var excatDist=(arg0+curms)-excatCurMs
    var yoff = 144 - ((excatDist / 10) * cc.mod_scrollspeed * cc.mod_velocity * scrollind);
    
    if (cc.mod_driven != 0)
        yoff -= (cc.mod_driven * cc.bps * cc.mod_scrollspeed * cc.mod_velocity * 22 * scrollind);
    
    if (cc.mod_wave != 0)
        yoff -= ((cc.mod_wave / 100) * 20 * sin(excatDist / 152));
    
    if (cc.mod_boost_distance != 0)
    {
        var arghenaTimeDistance = cc.mod_boost_time+variable_instance_get(cc, string("mod_boost_timeind{0}", arg1));
        var arghenaMoveDistance = cc.mod_boost_distance+variable_instance_get(cc, string("mod_boost_distanceind{0}", arg1));
        var arghenaModded = -arghenaMoveDistance;
        
        if (excatDist < arghenaTimeDistance && arghenaTimeDistance > 0)
            arghenaModded = EaseInCubic(arghenaTimeDistance - excatDist, -arghenaMoveDistance, arghenaMoveDistance, arghenaTimeDistance);
        
        yoff += arghenaModded;
    }
    
    return yoff;
}
