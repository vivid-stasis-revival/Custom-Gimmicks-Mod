ssList=[];
disPrefix=[];
currentWarped=0;

function velocity(t_ms,velo) constructor
{
    velocity=velo;
    time=t_ms;
}

function cmd_addVelo(ms,velo){
    array_push(ssList,new velocity(ms,velo));
}

function cmd_addVeloTween(ms,msEnd,stVelo,edVelo,easing,step=32){
    var easeFunc=struct_get(global.eases, easing);
    var duration=msEnd-ms;
    var change=edVelo-stVelo
    for (var t=ms; t<=msEnd; t+=1/step){
        var ct=t-ms;
        var velo=easeFunc(ct,stVelo,change,duration);
        array_push(ssList,new velocity(t,velo));
    }
}

CommandMap={
    addVelo:cmd_addVelo,
    addVeloTween:cmd_addVeloTween
}

CommandArgTypes={
    addVelo:[real,real],
    addVeloTween:[real,real,real,real,string,real]
}

function vsvLineArgsConvert(cmd,args){
    var argFuncs=struct_get(CommandArgTypes,cmd);
    var oper=args;
    for (var i=0;i<array_length(args);i++){
        oper[i]=argFuncs[i](oper[i]);
    }
    return oper;
}
function vsvLineParser(line){
    var lb=string_pos("(", line);
    var rb=string_pos(")", line);
    var strArgs=string_copy(line, lb+1, rb-lb-1);
    var command=string_copy(line, 1, lb-1);
    var args=string_split(strArgs, ",");
    args=vsvLineArgsConvert(command,args);
    method_call(struct_get(CommandMap,command),args)
}

function loadSSListFromFile(path){
    if (file_exists(path))
    {
        var fp=file_text_open_read(path);
        while (!file_text_eof(fp)){
            var line=file_text_readln(fp);
            vsvLineParser(line)
        }
        array_sort(ssList,function(a,b){
            return a.time-b.time;
        });
    }
    if (array_length(ssList)==0 || ssList[0].time>0)
        array_insert(ssList,0,new velocity(0,1));
    genDistancePrefixList();
}


function genDistancePrefixList()
{
    disPrefix=[0];
    var dis=0;
    for (var i=1;i<array_length(ssList);i++)
    {
        dis+=(ssList[i].time-ssList[i-1].time)*ssList[i-1].velocity;
        array_push(disPrefix,dis);
    }
}

function getNearestPassedVelocityIndex(t)
{
    var l=0,r=array_length(ssList)-1;
    var result=0;
    while (l<=r)
    {
        var mid=(l+r) div 2;
        if (ssList[mid].time<=t)
        {
            result=mid;
            l=mid+1;
        }
        else
        {
            r=mid-1;
        }
    }
    return result;
}

// === 核心查询：W(t) = 从时刻 0 到 t 的视觉总距离 ===

function warpedTime(t)
{
    var idx=getNearestPassedVelocityIndex(t);
    return disPrefix[idx]+(t-ssList[idx].time)*ssList[idx].velocity;
}

// === 缓存所有音符的 W(note.ms)，速度变更时调用 ===

function cacheNoteDistances(noteList)
{
    array_foreach(noteList,function(n){
        n._svCachedDist=warpedTime(n.ms);
        if (n.holdEnd!=undefined)
            n._svCachedHoldEndDist=warpedTime(n.holdEnd);
    });
}