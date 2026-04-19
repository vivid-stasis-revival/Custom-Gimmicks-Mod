function UnlimitedAddGlobalMod(modName,modWeight){
    static lastIdx = 128;
    variable_struct_set(global.mods, modName, lastIdx);
    variable_struct_set(global.mod_weight, modName, modWeight);
    lastIdx++;
}
UnlimitedAddGlobalMod("jumpto",0);
UnlimitedAddGlobalMod("playspeed", 1);
UnlimitedAddGlobalMod("prsy", 2);
UnlimitedAddGlobalMod("prtrX", 2);
UnlimitedAddGlobalMod("prtrY", 2);
UnlimitedAddGlobalMod("prta", 1);
