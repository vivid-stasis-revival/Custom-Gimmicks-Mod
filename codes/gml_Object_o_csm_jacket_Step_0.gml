var enablePlaudite=variable_instance_exists(cc, "mod_plaudite_jacket")
var enableCustom=variable_instance_exists(cc, "mod_custom_jacket")
if (enablePlaudite){
    switch (cc.mod_plaudite_jacket)
    {case 0:
        jacket = song_transparent;
        break;
    
    case 1:
        jacket = song_pyromania;
        break;
    
    case 2:
        jacket = song_valor;
        break;
    
    case 3:
        jacket = song_unraveling;
        break;
    
    case 4:
        jacket = song_supernova;
        break;
    
    case 5:
        jacket = song_libertia;
        break;
    
    case 6:
        jacket = song_stopmotion;
        break;
    
    case 7:
        jacket = song_convergence;
        break;
    
    case 8:
        jacket = song_red;
        break;
    
    case 9:
        jacket = song_plaudite;
        break;
    
    case 10:
        jacket = song_astellion;
        break;
    
    case 11:
        jacket = default_jacket;
        break;
    }
    exit;
}
jacket=jackets[jacketID]