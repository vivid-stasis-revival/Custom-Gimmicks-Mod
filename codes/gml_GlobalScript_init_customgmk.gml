function UnlimitedAddGlobalMod(modName,modWeight,callBack=undefined,endCallBack=undefined){
    static lastIdx = 129;
    variable_struct_set(global.mods, modName, lastIdx);
    global.mod_callbacks[lastIdx] = callBack;
    global.mod_end_callbacks[lastIdx] = endCallBack;
    variable_struct_set(global.mod_weight, modName, modWeight);
    lastIdx++;
}
UnlimitedAddGlobalMod("jumpto",0);
UnlimitedAddGlobalMod("playspeed", 1);
UnlimitedAddGlobalMod("prsy", 2);
UnlimitedAddGlobalMod("prtrX", 2);
UnlimitedAddGlobalMod("prtrY", 2);
UnlimitedAddGlobalMod("prta", 1);
UnlimitedAddGlobalMod("xoffset", 1.5);
for (var lane=0;lane<7;lane++){
    UnlimitedAddGlobalMod(string("yoffsetind{0}", lane), 1.5);
    UnlimitedAddGlobalMod(string("xoffsetind{0}", lane), 1.5);
    UnlimitedAddGlobalMod(string("notealpind{0}", lane), 1.5);
    UnlimitedAddGlobalMod(string("boost_timeind{0}", lane), 2.5);
    UnlimitedAddGlobalMod(string("boost_distance{0}", lane), 2.5);
}
