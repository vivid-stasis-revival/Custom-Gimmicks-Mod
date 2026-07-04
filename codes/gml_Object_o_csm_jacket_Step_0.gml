var enablePlaudite=variable_instance_exists(cc, "mod_plaudite_jacket")
var enableCustom=variable_instance_exists(cc, "mod_custom_jacket")
if (enablePlaudite){
    jacketID=(cc.mod_plaudite_jacket<0)?array_length(jackets)-1:ceil(cc.mod_plaudite_jacket) mod array_length(jackets);
}
else if(enableCustom){
    jacketID=(cc.mod_custom_jacket<0)?array_length(jackets)-1:ceil(cc.mod_custom_jacket) mod array_length(jackets);
}

jacket=jackets[jacketID]