# 更新日志
---
### v1.6.2
- 新增prtrX与prtrY，分别对应仿射变换下的绕x轴旋转和绕y轴旋转
- 修复了字幕播放顺序可能出错的问题

### v1.6.3
- 添加了控制行最大宽度的gmk: textmaxwidth
- 修复了行最大宽度的逻辑，现在是以字符为单位
  
### v1.7.0 -pre1
- 支持了shader：abx,aby,barrelabx,barrelaby,vdistort,bloom ，具体见文档
- 支持了angelstar_checker系列

### v1.7.0
- pre1的内容
- 支持了aop,glitch,tw,pos系列等shader，具体参见文档
- 新增cgmk配置，具体也请见文档

### v1.7.1
- 修复了游玩官谱会崩溃的bug

### v1.8.0
- 支持了中途更换自定义的bg，具体可见文档
- distortedBG系列的扭曲滤镜现在可以被部分控制（BG_ditortScale BG_ditortAmount）了，具体见文档
- 再度修复了游玩官谱会崩溃的bug(???)

### v1.8.1
- 修复了游玩切出窗口时因surface不存在导致的崩溃
- 修复了cover盖不住note的问题
- 再度优化粒子系统（？

### v1.8.2
- 加了一些gmk的ind变种
- 新增xoffset

### v1.9.0
- 适配新版本体

### v1.10.0
- 优化了字幕gmk，并新增了调整对齐方式gmk，具体见文档
- 修复了部分gmk无法使用的问题（plaudite_pburst,playspeed）
- 将jumpto细化为jumpto_beat和jumpto_s，具体见文档
- 新增reset_scrollspeed

### v1.10.1
- 修复了谱面路径相关问题
- 修复了cosX滤镜的问题
- 现在jacket系列如果id值超过现有jacket数量/小于0 会 自动取余/取id最大的jacket

### v1.11.0
- 现在支持皮肤更换
- 支持图片插入[WIP]
- sides被细化成了unraveling_sidething, astellion_sidething和apocalypse_sidething
- 常规SV（支持不等距的那种）支持[WIP]
- 暂时废弃ENABLE_DEBUG_INFO
- 星星相关gmk支持
- 修复了df相关特效图层错误问题