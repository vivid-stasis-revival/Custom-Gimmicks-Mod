existsSprite={}
existsInstance={}

var path=cc.chartPath;
filePath=path+string("{0}.vsp",global.df_load);
if (!file_exists(filePath)){
    filePath=path+"GLOBAL.vsp";
    if (!file_exists(filePath)) instance_destroy(self);
}

file_text_open_read(filePath){

}