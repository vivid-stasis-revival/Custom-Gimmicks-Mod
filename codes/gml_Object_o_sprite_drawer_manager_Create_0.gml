existsSprites={};
existsDrawers={};
ENUM_IMGTYPES={
    "static":0,
    "animated":1
}

function parseLayer(raw){
    var args=[];
    args=string_split(raw, ",");
    var name=args[0];
    var d=-real(args[1]);
    if (abs(d)>=15999){
        d=sign(d)*15999;
    }
    var objEx={
        caller:caller
    }
    var obj=instance_create_depth(0,0,d,o_csm_sprite_drawer,objEx);
    struct_set(existsDrawers, name, obj);
}

function parseImage(raw){
    static curLayer="";
    var args=[];
    if (string_ends_with(raw, ":")){
        curLayer=string_copy(raw, 1, string_length(raw)-1);
        return;
    }
    var obj;
    var type,name,path,priority,framecnt=1,h=-1,w=-1,_asset;
    args=string_split(raw, ",");
    argscnt=array_length(args);
    type=struct_get(ENUM_IMGTYPES, args[0]);
    name=args[1];
    path=args[2];
    priority=real(args[3]);
    switch (type){
        case 0:
            if(argscnt==5){
                w=real(args[4]);
            }
            else if (argscnt==6){
                w=real(args[4]);
                h=real(args[5]);
            }
            break;
        case 1:
            framecnt=real(args[4]);
            if (argscnt==6){
                w=real(args[5]);
            }
            else if (argscnt==7){
                w=real(args[5]);
                h=real(args[6]);
            }
            break;
    }
    var ky=sha1_file(cc.chartPath+path);
    if (struct_exists(existsSprites, ky)){
        _asset=struct_get(existsSprites, ky);
    }
    else{
        _asset=sprite_add(cc.chartPath+path, framecnt, false, false, 0, 0);
        struct_set(existsSprites, ky, _asset);
    }
    var obj=struct_get(existsDrawers,curLayer);
    //sprid,asset,assettype,lyer,w,h
    obj.addImage(name,_asset,type,priority,w,h,framecnt);
}

AREA_HANDLER={
    "Layer":parseLayer,
    "Image":parseImage
};

//! Layer读入depth要取反
area="";
lineHandler=undefined;

var path=cc.chartPath;
filePath=path+string("{0}.vsp",global.df_load);
if (!file_exists(filePath)){
    filePath=path+"GLOBAL.vsp";
    if (!file_exists(filePath)){
        instance_destroy(self);
        exit;
    }
}
var fp=file_text_open_read(filePath);
while (!file_text_eof(fp)){
    var _ln=file_text_readln(fp);
    _ln=string_trim(_ln);
    _ln=string_replace_all(_ln, " ", "");
    if (string_length(_ln) < 1){
        continue;
    }
    else if(string_starts_with(_ln, "//")){
        continue;
    }
    else if(string_starts_with(_ln, "#")){
        area=string_copy(_ln, 2, string_length(_ln)-1);
        lineHandler=struct_get_fallback(AREA_HANDLER,area,undefined);
    }
    else{
        if (lineHandler==undefined)
            continue;
        lineHandler(_ln);
    }
    
}
file_text_close(fp);
with (o_csm_sprite_drawer){
    init();
}