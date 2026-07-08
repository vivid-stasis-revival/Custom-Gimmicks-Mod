if (!instance_exists(cc))
    exit;
if (array_length(ssList)>0)
    currentWarped=warpedTime(cc.currentms);
else
    currentWarped=cc.currentms;