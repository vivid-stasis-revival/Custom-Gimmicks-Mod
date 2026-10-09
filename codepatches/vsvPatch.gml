global.vsvHandler=instance_create_depth(0,0,100,o_scrollSpeedHandler);
global.vsvHandler.loadSSListFromFile(chartPath + arg1 + ".vsv");
for (var i=0;i<array_length(lanes);i++){
    var l=lanes[i];
    global.vsvHandler.cacheNoteDistances(l)
}
if (global.op_mirror)