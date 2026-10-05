function MatrixTrapezoidal(trX,trY){
    var M;
    M[0] = 1;//scaleX
    M[4] = 0;//skewX
    M[8] = 0;
    M[12] = 0;//moveX
    M[1] = 0;//skewY
    M[5] = 1;//scaleY
    M[9] = 0;
    M[13] = 0;//moveY
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

//角度制梯形(射影)矩阵：写 m[0]/m[5](cos压缩) 和 m[3]/m[7](射影项)，
//  用法与位置和 MatrixTrapezoidal 相同 —— 乘在 MScale*MRot 之后、MSkew*MTrans 之前
//  trX : 绕x轴倾斜的角度(deg) -> 纵向梯形(y->w)，写进 m[7]
//  trY : 绕y轴倾斜的角度(deg) -> 横向梯形(x->w)，写进 m[3]
//  trD : 物距(px)，按"缩放后/屏幕上"的 px 给
//射影项 = sin(角度)/trD：
//  本槽位乘的坐标已经过 MScale/MRot，也就是"缩放后(屏幕)px"，缩放早就体现在坐标里，
//  所以 trD 按屏幕px直接给即可，不需要再按缩放换算（真要放到 MScale 之前当未缩放几何px用，
//  由调用方自己把系数乘上对应的缩放）。
//  sin 是精确的平面倾斜系数(tan 只是小角度近似)；d 越大透视越弱，d<=0 视为完全不倾斜。
//  参考量级：半宽47.5px的note代理在10°下，trD=320时两端局部缩放比≈1.11，trD=700时≈1.05。
//cos压缩 = m[0]=cos(trY)、m[5]=cos(trX)：
//  平面绕某条轴倾斜后，被倾斜的那条轴在屏幕上会正向缩短 cos(角度)，这是真3D旋转的另一半，
//  和上面的射影项合起来才等于"真正意义上的绕轴旋转"（trY 压 x 方向、trX 压 y 方向）。
//  两轴同时倾斜时忽略了二阶交叉项(sin*sin)，要精确的复合旋转就用 matrix_build 自己搭。
//符号约定：trX>0 让 +y 一侧(下)远离观察者变小；trY>0 让 +x 一侧(右)远离观察者变小。
//注意：轴分配与 MatrixTrapezoidal(trX,trY) 相反（那个把 trX 写进 m[3]）；
//  也不同于 matrix_build 那类纯仿射构造器 —— 射影项只能在 GM 默认的2D正交管线下直接写，
//  不需要透视投影（纯仿射矩阵写不出 m[3]/m[7]）。
function MatrixTrapezoidalNew(trX,trY,trD){
    var on = (trD != 0);//trD<=0 视为完全不倾斜：射影项为0，也不做 cos 压缩
    var inv = on ? (1 / trD) : 0;//避免除零把画面甩飞
    var cfX = dcos(trY);//绕y轴倾斜造成的 x 方向压缩
    var cfY = dcos(trX);//绕x轴倾斜造成的 y 方向压缩
    var M;
    M[0] = cfX;//scaleX
    M[4] = 0;//skewX
    M[8] = 0;
    M[12] = 0;//moveX
    M[1] = 0;//skewY
    M[5] = cfY;//scaleY
    M[9] = 0;
    M[13] = 0;//moveY
    M[2] = 0;
    M[6] = 0;
    M[10] = 1;
    M[14] = 0;
    M[3] = dsin(trY) * inv;//TrapeHorizontal(绕y轴倾斜)
    M[7] = dsin(trX) * inv;//TrapeVertical(绕x轴倾斜)
    M[11] = 0;
    M[15] = 1;
    return M;
}