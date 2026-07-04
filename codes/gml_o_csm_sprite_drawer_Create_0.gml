images=[];
function sprite(sprid,asset) constructor
{
    ID=sprid;
    asset=asset;
    lyer=0;
}
function addPicture(sprid,asset){
    var spr=new sprite(sprid, asset);
    array_push(images, spr);
}

function sort(){
    array_sort(images, function(pre,cur){
        return pre.lyer-cur.lyer;
    });
}

static TEMPLATE_VALUE_GMK=[
    ["imgx_{0}",160],
    ["imgy_{0}",90],
    ["imgytime_{0}",0],
    ["imgrot_{0}",0],
    ["imgscalex_{0}",1],
    ["imgscaley_{0}",1],
    ["imgskewx_{0}",0],
    ["imgskewy_{0}",0],
    ["imgalp_{0}",1],
    ["imgcolrgb_{0}",c_white]
    ];
static LEN_TEMPLATE_VALGMK=array_length(TEMPLATE_VALUE_GMK)
 
function addGimmick(c){
    for (var i=0;i<array_length(images);i++){
        var img=images[i];
        for (var i=0;i<LEN_TEMPLATE_VALGMK;i++){
            var valmdn=TEMPLATE_VALUE_GMK[i][0];
            c.addExtraMod(string(valmdn,img.ID), 0);
            variable_instance_set(cc, "mod_"+string(valmdn,img.ID), TEMPLATE_VALUE_GMK[i][1]);
        }
    }
}

function loadFromLine(raw){

}