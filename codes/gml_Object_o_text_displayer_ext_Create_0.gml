// tpath = cc.songInfo.chart_path + string("{0}_text_{1}.txt", global.df_load,tid);
textObjects=[];
debugDisplayingID=0;

function textObj(tid) constructor{

    static debugShown=["ID",
    "posX",
    "posY",
    "rotDeg",
    "alp",
    "col",
    "scale",
    "sep",
    "maxRowChars",
    "curTextIdx",
    "vAlignMode",
    "hAlignMode"
    ];
    static function textData(beginTime,ct) constructor{
        time=beginTime;
        content=ct;
    }
    static function colConvert(col){
        var r=color_get_red(col);
        var g=color_get_green(col);
        var b=color_get_blue(col);
        return make_color_rgb(r,g,b);
    }

    static CHAR_WIDTH=font_get_size(global.default_font)
    static SPECIAL_REPLACE={
        "{{":"{",
        "}}":"}",
        "{n}":"\n",
        "{comma}":",",
        "{t}":"\t"
    };
    static SPECIAL_KEYS=struct_get_names(SPECIAL_REPLACE);
    static CC_MODNAME_TEMPLATES=[
        "textX_{0}",
        "textX_{0}b",
        "textY_{0}",
        "textY_{0}b",
        "textrot_{0}",
        "textalp_{0}",
        "textcolrgb_{0}",
        "textscale_{0}",
        "textsep_{0}",
        "textmaxwidth_{0}",
        "textalignv_{0}",
        "textalignh_{0}"
    ];
    static CC_MODNAME_INITVAL={
        "textX_{0}":0,
        "textX_{0}b":0,
        "textY_{0}":0,
        "textY_{0}b":0,
        "textrot_{0}":0,
        "textalp_{0}":1,
        "textcolrgb_{0}":c_white,
        "textscale_{0}":1,
        "textsep_{0}":1,
        "textmaxwidth_{0}":20,
        "textalignv_{0}":fa_top,
        "textalignh_{0}":fa_center
    };

    static function updateSelf(){
        if (instance_exists(cc)){
            posX=variable_instance_get(cc, "mod_textX_"+string(ID))+variable_instance_get(cc, "mod_textX_"+string(ID)+"b");
            posY=variable_instance_get(cc, "mod_textY_"+string(ID))+variable_instance_get(cc, "mod_textY_"+string(ID)+"b");
            rotDeg=variable_instance_get(cc, "mod_textrot_"+string(ID));
            alp=variable_instance_get(cc, "mod_textalp_"+string(ID));
            col=colConvert(variable_instance_get(cc, "mod_textcolrgb_"+string(ID)));
            scale=variable_instance_get(cc, "mod_textscale_"+string(ID));
            sep=variable_instance_get(cc, "mod_textsep_"+string(ID));
            vAlignMode=variable_instance_get(cc, "mod_textalignv_"+string(ID));
            hAlignMode=variable_instance_get(cc, "mod_textalignh_"+string(ID));
            maxRowChars=variable_instance_get(cc, "mod_textmaxwidth_"+string(ID));
            if (curTextIdx<array_length(textDatas)-1 && cc.currentbeataccurate>=textDatas[curTextIdx+1].time)
                curTextIdx+=1;
        }
    }
    static function loadText(path){
        var fp=file_text_open_read(path);
        if (fp==-1) return;
        var lineNum=0;
        while(!file_text_eof(fp)){
            lineNum++;
            var line=file_text_readln(fp);
            var args=string_split(line, ",", true);
            if (array_length(args)<2)
                continue;
            try
            {
                for (var i=0;i<array_length(SPECIAL_KEYS);i++){
                    var ky=SPECIAL_KEYS[i];
                    args[1]=string_replace_all(args[1], ky, struct_get(SPECIAL_REPLACE, ky));
                }
                array_push(textDatas,new textData(real(args[0]),args[1]));
            }
            catch (e)
            {
                available=false;
                errorMsg=string("Error occured while parsing Line {0}", lineNum);
                break;
            }
            
        }
        file_text_close(fp);
        array_sort(textDatas, function(a,b){
            return a.time-b.time;
        });
        if (array_length(textDatas)==0)
        {
            available=false;
            errorMsg="No valid text data found in file.";
        }
    }
    static function addMods(c){
        for (var i=0;i<array_length(CC_MODNAME_TEMPLATES);i++){
            var modName=string(CC_MODNAME_TEMPLATES[i], ID);
            c.addExtraMod(modName, 0);
            variable_instance_set(cc, "mod_"+modName, struct_get(CC_MODNAME_INITVAL,CC_MODNAME_TEMPLATES[i]));
        }
    }
    static function drawSelf(){
        draw_set_alpha(alp);
        draw_set_valign(vAlignMode);
        draw_set_halign(hAlignMode);
        draw_set_font(global.default_font);
        draw_set_color(col);
        var currentText=textDatas[curTextIdx].content;
        draw_text_ext_transformed(posX,posY,currentText,sep,maxRowChars*CHAR_WIDTH,scale,scale,rotDeg);
        draw_set_valign(fa_top);
        draw_set_halign(fa_left);
    }
    static function drawDebug(){
        draw_set_alpha(1);
        draw_set_font(global.default_font);
        draw_set_color(c_white);
        var kys=debugShown;
        draw_set_valign(fa_top);
        draw_set_halign(fa_left);

        for (var i=0;i<array_length(kys);i++){
            var ky=kys[i];
            if (ky=="textDatas")
                continue;
            draw_text(20,20+11*i,ky+":"+string(variable_instance_get(self, ky)));
        }
    }
    ID=tid;
    posX=0;
    posY=0;
    rotDeg=0;
    alp=0;
    col=c_white;
    scale=1;
    sep=1;
    maxRowChars=20;
    curTextIdx=0;
    
    vAlignMode=fa_middle;
    hAlignMode=fa_center;
    available=true;
    errorMsg="";
    textDatas=[];
}

var pathPrefix=string("{0}_text_", global.df_load);
var prefixLength=string_length(pathPrefix);
var filePath=file_find_first(cc.songInfo.chart_path+pathPrefix+"*.txt", 16);
while(filePath != "")
{
    var tID=string_copy(filePath, prefixLength+1, string_length(filePath)-prefixLength-4);
    var _textObj=new textObj(tID);
    _textObj.loadText(cc.songInfo.chart_path+filePath);
    if (_textObj.available){
        array_push(textObjects, _textObj);
        _textObj.addMods(caller);
    }
    filePath=file_find_next();
}
file_find_close();
if (array_length(textObjects)<=0)
    instance_destroy(self);
