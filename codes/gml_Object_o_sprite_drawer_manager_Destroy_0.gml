var sprkys=struct_get_names(existsSprites);
for (var i=0;i<array_length(sprkys);i++){
    var ky=sprkys[i];
    var asset=struct_get(existsSprites,ky);
    sprite_delete(asset);
}