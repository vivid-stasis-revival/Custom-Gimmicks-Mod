if (!struct_exists(global.currentSongInfo,"is_custom"))
    exit;
addExtraMod = function(modName, weight = 1, callBack = undefined, endCallBack = undefined)
{
    var i = lastExtraModIndex;
    lastExtraModIndex++;
    variable_struct_set(extraMods, modName, i);
    extraModCallbacks[i] = callBack;
    extraModEndCallbacks[i] = endCallBack;
    variable_struct_set(global.mod_weight, modName, weight);
};
updateMods = function()
{
    while (curmod < array_length(modlist) && cc.currentbeataccurate >= modlist[curmod].b)
    {
        var thismod = modlist[curmod];
        var start = 1000 * TimeFromBPMListAndBeat(cc.bpmlist, thismod.b, cc.chartoffset);
        var duration = thismod.d * (60000 / GetBPMAtBeat(cc.bpmlist, thismod.b));
        var modID=thismod.ig?struct_get(global.mods, thismod.m):struct_get(extraMods, thismod.m);
        if (modID == undefined)
        {
            curmod++;
            continue;
        }
        if (thismod.ig?(global.mod_callbacks[modID] == undefined) : (extraModCallbacks[modID] == undefined))
        {
            cc.CreateChartTween(start, duration, (thismod.p >= 0) ? proxies[thismod.p] : cc, ((thismod.p >= 0) ? "" : "mod_") + thismod.m, thismod.e, thismod.v1, thismod.v2);
        }
        else
        {
            cc.CreateChartCallback(start, thismod.ig ? global.mod_callbacks[modID] : extraModCallbacks[modID],duration, thismod.v1, thismod.v2, thismod.e);
            
            if (thismod.ig?(global.mod_end_callbacks[modID] != undefined) : (extraModEndCallbacks[modID] != undefined))
                cc.CreateChartCallback(start + duration, thismod.ig ? global.mod_end_callbacks[modID] : extraModEndCallbacks[modID],duration, thismod.v1, thismod.v2, thismod.e);
        }
        
        curmod++;
    }
    
    for (var i = 0; i < array_length(perframelist); i++)
    {
        var thisper = perframelist[i];
        
        if (cc.currentbeataccurate > thisper.b && cc.currentbeataccurate < thisper.e)
        {
            var meth = method(self, thisper.f);
            meth(cc.currentbeataccurate);
        }
    }
};
