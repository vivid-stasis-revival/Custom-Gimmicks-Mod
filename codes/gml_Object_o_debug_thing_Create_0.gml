idx=0;
templates=["current_time:{0}\ncurrent_beat:{1}","nearestMod:\n{0}\n{1}\n{2}\n{3}"];
strfinal="";
argFuncs=[
    function(){
        var t=cc.currentms;
        var b=cc.currentbeataccurate;
        return [t,b]
    },
    function(){
        var out=[]
        for (var i=0;i<4;i++)
        {
            var m=obj_custom_gimmick.modlist[i];
            var cmod=string("{0},{1},{2},{3},{4},{5},{6}",m.b,m.d,script_get_name(m.e),m.v1,m.v2,m.m,m.p);
            out[i]=cmod;
        }
        return out;
}]