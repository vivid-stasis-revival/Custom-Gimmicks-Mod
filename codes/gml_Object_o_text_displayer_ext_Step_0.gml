array_foreach(textObjects,function(o){
    o.updateSelf();
})

if (cc.ENABLE_DEBUG_INFO && cc.ENABLE_TEXT)
        if (keyboard_check_pressed(vk_pagedown))
            debugDisplayingID=(debugDisplayingID+1) mod array_length(textObjects);
        else if(keyboard_check_pressed(vk_pageup))
            debugDisplayingID=debugDisplayingID-1<0? (array_length(textObjects)-debugDisplayingID) mod array_length(textObjects):debugDisplayingID-1;