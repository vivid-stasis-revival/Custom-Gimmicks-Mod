current_text="";
enable_text_gimmick=false;
text_array = [];
file = file_text_open_read(text_path);
_ln = "";
text_info = [];
_ln_cnt=0;

while (!file_text_eof(file))
{
    _ln = file_text_readln(file);
    _ln_cnt++;
    if ((_ln=="\n") or (_ln=="") or (string_starts_with(_ln,"//"))){
        continue;
    }
    text_info = string_split(_ln, ",",true,1);
    text_info[0] = real(text_info[0]);
    text_info[1] = string_replace_all(text_info[1], "{n}", "\n");
    array_push(text_array, text_info);
}

for(var i=0;i<array_length(text_array);i++){
    var swapped=false
    for(var j=0;j<array_length(text_array);j++){
        if(text_array[i][0]<text_array[j][0]){
            var temp=text_array[i]
            text_array[i]=text_array[j]
            text_array[j]=temp
            swapped=true
        }
    }
    if (!swapped)
        break;
}

if (array_length(text_array)>0){
    enable_text_gimmick=true
}
text_array_length=array_length(text_array)

file_text_close(file)
//variables
textX=room_width*0.5
textY=room_width*0.5
textalp=1
textrot=0
textcolrgb=16777215
textscale=1
textsep=2