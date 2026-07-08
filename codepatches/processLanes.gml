global.speedHandler=instance_create_depth(0,0,100,o_scrollSpeedHandler);
global.speedHandler.loadSSListFromFile(chartPath + arg1 + ".vsv");
for (var i=0;i<array_length(lanes);i++){
    var l=lanes[i];
    global.speedHandler.cacheNoteDistances(l)
}
if (global.op_mirror)