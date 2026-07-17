global.__merge=function(lpart,rpart,compareFunc){
    var l = array_length(lpart), r = array_length(rpart);
    var i = 0, j = 0;
    var sorted = [];
    
    while (i < l && j < r) {
        if (compareFunc(lpart[i], rpart[j])) {
            array_push(sorted, lpart[i]);
            i++;
        } else {
            array_push(sorted, rpart[j]);
            j++;
        }
    }
    
    // 处理剩余元素
    while (i < l) {
        array_push(sorted, lpart[i]);
        i++;
    }
    while (j < r) {
        array_push(sorted, rpart[j]);
        j++;
    }
    
    return sorted;
}

global.merge_sort=function(arr,compareFunc){
    if (array_length(arr)<=1){
        return arr;
    }
    var mid;
    var rarr=[];
    var larr=[];
    mid=array_length(arr) div 2;
    for (var i=0;i<mid;i++){
        array_push(larr,arr[i]);
    }
    for (var i=mid; i<array_length(arr); i++){
        array_push(rarr,arr[i]);
    }
    larr=global.merge_sort(larr,compareFunc);
    rarr=global.merge_sort(rarr,compareFunc);
    return global.__merge(larr,rarr,compareFunc);
}
//【1，2，3，4，5】
//【1，2】【3，4，5】