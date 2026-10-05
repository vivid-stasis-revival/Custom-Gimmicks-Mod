images=[];
TEMPLATE_VALUE_GMK=[
    ["imgx_{0}",160],
    ["imgy_{0}",90],
    ["imgytime_{0}",cc.ORIGINAL_FROM],
    ["imgrot_{0}",0],
    ["imgscalex_{0}",1],
    ["imgscaley_{0}",1],
    ["imgscaleytime_{0}",cc.ORIGINAL_FROM],
    ["imgskewx_{0}",0],
    ["imgskewy_{0}",0],
    ["imgcolrgb_{0}",c_white],
    ["imgxtime_{0}",cc.ORIGINAL_FROM],
    ["imgalp_{0}",1],
    ["imgxb_{0}",0],
    ["imgyb_{0}",0]
];
LEN_TEMPLATE_VALGMK=array_length(TEMPLATE_VALUE_GMK)

// Draw 里复用的世界矩阵：只写 2D 变换相关的 6 个元素，其余始终保持单位阵的值
mtx=matrix_build_identity();
mtxIdentity=matrix_build_identity();

function sprite(_sprid,_asset,_type,_lyer,_w,_h,_framecnt) constructor
{
    type=_type;
    ID=_sprid;
    asset=_asset;
    lyer=_lyer;
    framecnt=_framecnt;
    // 帧尺寸只取一次，Draw 每帧不再需要 sprite_get_width/height
    sw=sprite_get_width(asset);
    sh=sprite_get_height(asset);
    w=(_w==-1)?sw:_w;
    h=(_h==-1)?sh:_h;
    halfW=-sw/2;
    halfH=-sh/2;
    baseScaleW=(sw!=0)?w/sw:0;
    baseScaleH=(sh!=0)?h/sh:0;
    hDiv=(h!=0)?h:1;   //imgscaleytime 的分母，h 为 0 时退化为 1，避免除零
    lane=0;
    modKeys=[];        //"imgx_名字" 这类裸 gmk 名（注册 mod 时用）
    modNames=[];       //"mod_imgx_名字"（Draw 取值时用）
    idxKey=string("imgidx_{0}",_sprid);
    idxName="mod_"+string("imgidx_{0}",_sprid);

    function setLane(_l){
        self.lane=_l;
    }
}

function addImage(sprid,asset,assettype,lyer,w,h,framecnt=1){
    var spr=new sprite(sprid, asset, assettype, lyer, w, h,framecnt);
    // 预计算全部 mod 变量名：Draw 热路径里不再做 string() 格式化与字符串拼接
    var keys=array_create(LEN_TEMPLATE_VALGMK,"");
    var names=array_create(LEN_TEMPLATE_VALGMK,"");
    for (var j=0;j<LEN_TEMPLATE_VALGMK;j++){
        keys[j]=string(TEMPLATE_VALUE_GMK[j][0], sprid);
        names[j]="mod_"+keys[j];
    }
    spr.modKeys=keys;
    spr.modNames=names;
    array_push(images, spr);
    return spr;
}

function sort(){
    // merge_sort 返回的是新数组（并不原地排序），必须接住返回值
    images=merge_sort(images, function(pre,cur){
        return pre.lyer<=cur.lyer;
    });
}


function addGimmick(c){
    var n=array_length(images);
    for (var i=0;i<n;i++){
        var img=images[i];
        for (var j=0;j<LEN_TEMPLATE_VALGMK;j++){
            c.addExtraMod(img.modKeys[j], 0);
            variable_instance_set(cc, img.modNames[j], TEMPLATE_VALUE_GMK[j][1]);
        }
        if (img.type==1){
            c.addExtraMod(img.idxKey, 0);
            variable_instance_set(cc, img.idxName, 0);
        }
    }
}

function init(){
    if (array_length(images)<1){
        instance_destroy(self);
        exit;
    }
    addGimmick(caller);
    sort();
}
