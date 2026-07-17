jackets = [];
newAdds = [];
jacketID = 0;

function FindJackets()
{
    var avaliablePostfix = [".png", ".jpg"];
    var path = cc.chartPath;
    var _filePath = file_find_first(path + "jacket[*.*", 16);
    
    while (_filePath != "")
    {
        var _fileName = filename_name(_filePath);
        var _fileExt = filename_ext(_filePath);
        
        if (!array_contains(avaliablePostfix, _fileExt))
        {
            _filePath = file_find_next();
            continue;
        }
        
        var _pos = string_last_pos("[", _fileName);
        var _endPos = string_last_pos(".", _fileName);

        if (_pos != 0)
        {
            var _jID = real(string_copy(_fileName, _pos + 1, _endPos));
            var _spr = sprite_add(path + _filePath, 1, true, true, 0, 0);
            array_set(jackets, _jID, _spr);
            array_push(newAdds, _spr);
        }
        
        _filePath = file_find_next();
    }
    file_find_close();
}

if (global.boundary_shatter)
    defaultJacket = global.shatter_list[global.song_id_last].jacket;
else if (sprite_exists(global.loadjacket))
    defaultJacket = global.loadjacket;
else
    defaultJacket = song_generic;

if (cc.JACKET_MANAGE_MODE == "plaudite")
{
    array_push(jackets, song_transparent);
    array_push(jackets, song_pyromania);
    array_push(jackets, song_valor);
    array_push(jackets, song_unraveling);
    array_push(jackets, song_supernova);
    array_push(jackets, song_libertia);
    array_push(jackets, song_stopmotion);
    array_push(jackets, song_convergence);
    array_push(jackets, song_red);
    array_push(jackets, song_plaudite);
    array_push(jackets, song_astellion);
    array_push(jackets, defaultJacket);
}
else if (cc.JACKET_MANAGE_MODE == "custom")
{
    array_push(jackets, defaultJacket);
    FindJackets();
}
jacket=jackets[0]
jacketBlend=c_white;
jacketAlpha=1;