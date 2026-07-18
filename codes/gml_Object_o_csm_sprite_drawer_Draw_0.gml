// TEMPLATE_VALUE_GMK=[
//     ["imgx_{0}",160],
//     ["imgy_{0}",90],
//     ["imgytime_{0}",0],
//     ["imgrot_{0}",0],
//     ["imgscalex_{0}",1],
//     ["imgscaley_{0}",1],
//     ["imgscaleytime_{0}",cc.ORIGINAL_FROM],
//     ["imgskewx_{0}",0],
//     ["imgskewy_{0}",0],
//     ["imgcolrgb_{0}",c_white],
//     ["imgalp_{0}",1]
// ];
var spr, _alp;
var vals = [];
var mI = matrix_build_identity();
var mFinal = mI;
var mScale, mSkew, mRot, mTrans;
var timescaled = 1;
var ytimemoved=0;
var xtimemoved=0;
var curIdx = 1;

for (var i = 0; i < array_length(images); i++) {
    curIdx = 1;
    spr = images[i];
    _alp = variable_instance_get(cc, "mod_"+string(TEMPLATE_VALUE_GMK[LEN_TEMPLATE_VALGMK - 1][0], spr.ID));
    if (_alp <= 0) {
        continue;
    }
    if (spr.type == 1) {
        curIdx = round(variable_instance_get(cc, "mod_"+string("imgidx_{0}", spr.ID)));
        curIdx = curIdx < 0?0: curIdx % spr.framecnt;
    }
    for (var j = 0; j < LEN_TEMPLATE_VALGMK - 1; j++) {
        vals[j] = variable_instance_get(cc, "mod_" + string(TEMPLATE_VALUE_GMK[j][0], spr.ID));
    }
    if (vals[2] != cc.ORIGINAL_FROM) {
        ytimemoved = global.gmlNoteModsY(vals[2], spr.lane, 0,cc.mod_scrollspeed);
    }
    if (vals[10]!=cc.ORIGINAL_FROM){
        xtimemoved=global.gmlNoteModsX(spr.lane,vals[10],0);
    }
    if (vals[6] != cc.ORIGINAL_FROM) {
        var posO = global.gmlNoteModsY(0, spr.lane,0 ,cc.mod_scrollspeed);
        var posEnd = global.gmlNoteModsY(vals[6], spr.lane,0 ,cc.mod_scrollspeed);
        timescaled = posEnd - posO / spr.h;
    }
    var baseScaleW = spr.w / sprite_get_width(spr.asset);
    var baseScaleH = spr.h / sprite_get_height(spr.asset);

    mScale = MatrixScale(vals[4] * baseScaleW, vals[5] * timescaled * baseScaleH);
    mSkew = MatrixSkew(vals[7], vals[8]);
    mRot = MatrixRotateZ(vals[3]);
    mTrans = MatrixTranslate(vals[0]+xtimemoved, vals[1] + ytimemoved);

    mFinal = matrix_multiply(mFinal, mScale);
    mFinal = matrix_multiply(mFinal, mSkew);
    mFinal = matrix_multiply(mFinal, mRot);
    mFinal = matrix_multiply(mFinal, mTrans);
    matrix_set(matrix_world, mFinal);
    draw_sprite_ext(
        spr.asset,
        curIdx,
        -sprite_get_width(spr.asset) / 2,
        -sprite_get_height(spr.asset) / 2,
        1,
        1,
        0,
        global.col_convert(vals[9]),
        _alp
    );
    matrix_set(matrix_world, mI);
    mFinal = mI;
}