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
    ["imgalp_{0}",1]
];
LEN_TEMPLATE_VALGMK=array_length(TEMPLATE_VALUE_GMK)

function sprite(_sprid,_asset,_type,_lyer,_w,_h,_framecnt) constructor
{
    type=_type;
    ID=_sprid;
    asset=_asset;
    lyer=_lyer;
    framecnt=_framecnt;
    w=(_w==-1)?sprite_get_width(asset):_w;
    h=(_h==-1)?sprite_get_height(asset):_h;
    lane=0;

    function setLane(_l){
        self.lane=_l;
    }
}

function addImage(sprid,asset,assettype,lyer,w,h,framecnt=1){
    var spr=new sprite(sprid, asset, assettype, lyer, w, h,framecnt);
    array_push(images, spr);
    return spr;
}

function sort(){
    array_sort(images, function(pre,cur){
        return sign(pre.lyer-cur.lyer);
    });
}


function addGimmick(c){
    for (var i=0;i<array_length(images);i++){
        var img=images[i];
        for (var j=0;j<LEN_TEMPLATE_VALGMK;j++){
            var valmdn=TEMPLATE_VALUE_GMK[j][0];
            c.addExtraMod(string(valmdn,img.ID), 0);
            variable_instance_set(cc, "mod_"+string(valmdn,img.ID), TEMPLATE_VALUE_GMK[j][1]);
        }
        if (img.type==1){
            c.addExtraMod(string("imgidx_{0}",img.ID), 0);
            variable_instance_set(cc, "mod_"+string("imgidx_{0}",img.ID), 0);
        }
    }
}

function init(){
    if (array_length(images)<1){
        instance_destroy(self);
    }
    addGimmick(caller);
    sort();
}

