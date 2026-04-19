global.MatrixTrapezoidal=function(trX,trY){
    var M;
    M[0] = 1;//used as scaleX
    M[4] = 0;//used as skewX
    M[8] = 0;
    M[12] = 0;//used as moveX
    M[1] = 0;//used as skewY
    M[5] = 1;//used as scaleY
    M[9] = 0;
    M[13] = 0;//used as moveY
    M[2] = 0;
    M[6] = 0;
    M[10] = 1;
    M[14] = 0;
    M[3] = trX;//TrapeHorizontal
    M[7] = trY;//TrapeVertical
    M[11] = 0;
    M[15] = 1;
    return M;
}