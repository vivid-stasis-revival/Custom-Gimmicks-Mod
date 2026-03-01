ppos = cpos;
if (cc.mod_playspeed!=1 && cc.mod_playspeed!=undefined){
    
    if (cc.playback!=undefined)
    {
        val=round(cc.mod_playspeed*100)/100
        audio_sound_pitch(cc.playback,val)
    }
}

if(cc.mod_jumpto>0){
    if (cc.playback!=undefined)
    {
        audio_sound_set_track_position(cc.playback, cc.mod_jumpto);
        cc.mod_jumpto=0
    }
}