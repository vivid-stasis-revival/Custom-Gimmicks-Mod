var spr,_alp;
var vals=[]; //_x,_y,_yt,_rot,_scalex,_scaley,_scaleytime,_skewx,_skewy,
var mI=matrix_build_identity();
var mFinal=mI;
var mScale,mSkew,mRot,mTrans;
var timescaled=1;
for (var i=0;i<array_length(images);i++){
    spr=images[i];
    _alp=variable_instance_get(cc,string(TEMPLATE_VALUE_GMK[LEN_TEMPLATE_VALGMK-1],spr.ID));
    if (_alp<=0)
        continue;
    for (var j=0;j<LEN_TEMPLATE_VALGMK-1;j++){
        vals[j]=variable_instance_get(cc, "mod_"+string(TEMPLATE_VALUE_GMK[j],spr.ID));
    }

    val[2]=NoteModsY(val[2], 0, undefined, cc.scrollspeed)
    if (vals[6]!=cc.ORIGINAL_FROM){
        var posO=NoteModsY(0, 0, undefined, cc.scrollspeed)
        var posEnd=NoteModsY(vals[6], 0, undefined, cc.scrollspeed)
        timescaled=abs(posEnd-posO)/sprite_get_height(spr.asset)
    }
    var baseScaleW=spr.w/sprite_get_width(spr.asset)
    var baseScaleH=spr.h/sprite_get_height(spr.asset)

    mScale=MatrixScale(vals[4]*baseScaleW,vals[5]*timescaled*baseScaleH);
    mSkew=MatrixSkew(vals[7],vals[8]);
    mRot=MatrixRotateZ(vals[3]);
    mTrans=MatrixTranslate(vals[0],val[1]+val[2]);

    mFinal=matrix_multiply(mFinal,mScale);
    mFinal=matrix_multiply(mFinal,mSkew);
    mFinal=matrix_multiply(mFinal,mRot);
    mFinal=matrix_multiply(mFinal,mTrans);
    matrix_set(matrix_world, mFinal);
    draw_sprite_ext(spr.asset,0,-sprite_get_width(spr.asset)/2,-sprite_get_height(spr.asset)/2,1,1,0,c_white,);
    matrix_set(matrix_world,mI);
    mFinal=mI;
}