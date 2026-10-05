// mod 变量名已在 addImage 里预计算为 spr.modNames，下标顺序与 TEMPLATE_VALUE_GMK 一致：
//   0 imgx  1 imgy  2 imgytime  3 imgrot  4 imgscalex  5 imgscaley
//   6 imgscaleytime  7 imgskewx  8 imgskewy  9 imgcolrgb  10 imgxtime  11 imgalp
var _n = array_length(images);
var _drew = false;

for (var i = 0; i < _n; i++) {
    var spr = images[i];

    var _alp = variable_instance_get(cc, spr.modNames[11]);
    if (_alp <= 0) {
        continue;
    }

    var curIdx = 1;
    if (spr.type == 1) {
        curIdx = round(variable_instance_get(cc, spr.idxName));
        curIdx = (curIdx < 0) ? 0 : curIdx % spr.framecnt;
    }

    var _imgx   = variable_instance_get(cc, spr.modNames[0]) + variable_instance_get(cc, spr.modNames[12]);
    var _imgy   = variable_instance_get(cc, spr.modNames[1]) + variable_instance_get(cc, spr.modNames[13]);
    var _ytime  = variable_instance_get(cc, spr.modNames[2]);
    var _rot    = variable_instance_get(cc, spr.modNames[3]);
    var _scalex = variable_instance_get(cc, spr.modNames[4]);
    var _scaley = variable_instance_get(cc, spr.modNames[5]);
    var _sctime = variable_instance_get(cc, spr.modNames[6]);
    var _skewx  = variable_instance_get(cc, spr.modNames[7]);
    var _skewy  = variable_instance_get(cc, spr.modNames[8]);
    var _col    = variable_instance_get(cc, spr.modNames[9]);
    var _xtime  = variable_instance_get(cc, spr.modNames[10]);

    // 这三个量必须每张图独立算：旧写法声明在循环外，上一张图设过的值会泄漏给
    // 后面没设置该 gmk 的图（与文档"值为 _ 时不生效"矛盾）
    var _ymove = 0;
    var _xmove = 0;
    var _sct = 1;
    if (_ytime != cc.ORIGINAL_FROM) {
        _ymove = gmlNoteModsY(_ytime, spr.lane, 0);
    }
    if (_xtime != cc.ORIGINAL_FROM) {
        _xmove = gmlNoteModsX(spr.lane, _xtime, 0);
    }
    if (_sctime != cc.ORIGINAL_FROM) {
        var _posO = gmlNoteModsY(0, spr.lane, 0);
        var _posEnd = gmlNoteModsY(_sctime, spr.lane, 0);
        _sct = (_posEnd - _posO) / spr.hDiv;
    }

    // 世界矩阵 = 缩放 → 斜切 → 旋转 → 平移 的合成，等价于原来的
    // MatrixScale/MatrixSkew/MatrixRotateZ/MatrixTranslate + 4 次 matrix_multiply，
    // 但省掉了每张图每帧 8 次数组分配
    var _cos = dcos(_rot);
    var _sin = dsin(_rot);
    var _fsx = _scalex * spr.baseScaleW;
    var _fsy = _scaley * _sct * spr.baseScaleH;
    mtx[0]  = _fsx * (_cos - _skewy * _sin);
    mtx[1]  = _fsx * (_sin + _skewy * _cos);
    mtx[4]  = _fsy * (_skewx * _cos - _sin);
    mtx[5]  = _fsy * (_skewx * _sin + _cos);
    mtx[12] = _imgx + _xmove;
    mtx[13] = _imgy + _ymove;

    matrix_set(matrix_world, mtx);
    draw_sprite_ext(
        spr.asset,
        curIdx,
        spr.halfW,
        spr.halfH,
        1,
        1,
        0,
        col_convert(_col),
        _alp
    );
    _drew = true;
}

// 复位放在循环外：每张图都会重设世界矩阵，中间不需要还原
if (_drew) {
    matrix_set(matrix_world, mtxIdentity);
}
