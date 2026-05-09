var enablePlaudite=variable_instance_exists(cc, "mod_plaudite_jacket")
var enableCustom=variable_instance_exists(cc, "mod_custom_jacket")
if (enablePlaudite){
    jacketID=cc.mod_plaudite_jacket;
}
else if(enableCustom){
    jacketID=cc.mod_custom_jacket;
}

jacket=jackets[jacketID]