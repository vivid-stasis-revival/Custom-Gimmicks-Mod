images=[];
static TEMPLATE_VALUE_GMK=[
    ["imgx_{0}",160],
    ["imgy_{0}",90],
    ["imgytime_{0}",0],
    ["imgrot_{0}",0],
    ["imgscalex_{0}",1],
    ["imgscaley_{0}",1],
    ["imgscaleytime_{0}",cc.ORIGINAL_FROM]
    ["imgskewx_{0}",0],
    ["imgskewy_{0}",0],
    ["imgalp_{0}",1],
    ["imgcolrgb_{0}",c_white]
];
static LEN_TEMPLATE_VALGMK=array_length(TEMPLATE_VALUE_GMK)

function sprite(_sprid,_asset,_type,_lyer,_w,_h) constructor
{
    type=_type;     //static:0 //animate:1
    ID=_sprid;
    asset=_asset;
    lyer=_lyer;
    w=_w;
    h=_h;
}
function addPicture(sprid,asset,assettype,lyer,w,h){
    var spr=new sprite(sprid, asset, assettype, lyer, w, h);
    array_push(images, spr);
}

function sort(){
    array_sort(images, function(pre,cur){
        return pre.lyer-cur.lyer;
    });
}



function addGimmick(c){
    for (var i=0;i<array_length(images);i++){
        var img=images[i];
        for (var i=0;i<LEN_TEMPLATE_VALGMK;i++){
            var valmdn=TEMPLATE_VALUE_GMK[i][0];
            c.addExtraMod(string(valmdn,img.ID), 0);
            variable_instance_set(cc, "mod_"+string(valmdn,img.ID), TEMPLATE_VALUE_GMK[i][1]);
        }
        if 
    }
}


/*
Format:
[] - must
{} - choosable
Static,[sprid],[img_path],[layer],{img_w},{img_h}
Animated,[sprid],[img_path],[layer],[framecnt],{img_w},{img_h}
*/
function loadFromLine(raw){

}