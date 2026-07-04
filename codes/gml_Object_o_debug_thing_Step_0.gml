if (keyboard_check_pressed(vk_down)){
    idx++;
}
else if (keyboard_check_pressed(vk_up)){
    idx--;
}
if (idx<0)
    idx=array_length(templates)-1;
else if (idx>=array_length(templates))
    idx=0;
var strarg=[];
strarg[0]=templates[idx];
array_concat(strarg,argFuncs[idx]());
strfinal=method_call(string,strarg);