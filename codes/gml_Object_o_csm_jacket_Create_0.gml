jacketID=0
jackets=[]
if (global.boundary_shatter)
    defaultJacket = global.shatter_list[global.song_id_last].jacket;
else if (sprite_exists(global.loadjacket))
    defaultJacket = global.loadjacket;
else
    defaultJacket = song_generic;
array_push(jackets,defaultJacket)
