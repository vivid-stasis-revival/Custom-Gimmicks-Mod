### Custom Gimmick说明

#### cgmk配置文件
顾名思义，这个文件是用来管理要不要启用某一部分的gimmick的。

<br>

直接在谱面根目录下创建```[难度]_cgmk_config.json```即可，如FINALE难度的配置就写```FINALE_cgmk_config.json```，如果需要全局的配置文件，就直接创建```cgmk_config.json```。
- 注意，单独难度的配置的优先级是大于全局的。
- 如果目录没有配置文件，那么**下述所有配置都会被认为是true**

<br>

以下是可用的配置： 
|           配置名            |                         作用                         |
| :-------------------------: | :--------------------------------------------------: |
|     JACKET_MANAGE_MODE      | 调整换背景的模式，可填plaudite或custom，默认plaudite |
|         ENABLE_TEXT         |                   是否启用字幕gmk                    |
|     ENABLE_NON_BASE_FX      |            是否启用不在base obj内的fx gmk            |
| ENABLE_DF_GRID_AND_SIDELINE |            是否启用df的两侧的线或网格gmk             |
|  ENABLE_ANGELSTAR_CHECKER   |            是否启用anglestar的背景棋盘gmk            |
|      ENABLE_DISTORT_BG      |                    是否启用扭曲BG                    |
|    ENABLE_MUSIC_CONTROL     |       是否启用控制音乐的gmk(jumpto和playspeed)       |
|     ENABLE_STARPARTICLE     |               是否启用星星粒子相关gmk                |
|      ENABLE_DEBUG_INFO      |       是否在屏幕上绘制调试信息(于1.11暂时废弃)       |

<br>

在json内，你只要像下面这样填入配置信息就好了，你可以从上述的配置种填一或多个，**不填的默认为true**

```json
{
    "ENABLE_TEXT":false,
    "ENABLE_NON_BASE_FX":false,
    "JACKET_MANAGE_MODE":"custom"
}
```

#### 字幕效果

首先要在谱面的目录下创建一个文件： ``` [难度]_text.txt```，如ENCORE难度就创建一个```ENCORE_text.txt```

之后在文件里面按照以下格式打轴，一行一个语句：

``````
[拍数],[字幕的内容]
``````

之后就可以使用gimmick操作字幕了，以下是可以操作字幕的gimmick：

|   gmk名    |        作用        |                      其它描述                       |
| :--------: | :----------------: | :-------------------------------------------------: |
|   textX    |  调整字幕的横坐标  |                                                     |
|   textY    |  调整字幕的纵坐标  |                                                     |
|  textalp   |  调整字幕的透明度  |                      范围[0,1]                      |
|  textrot   | 调整字幕的旋转角度 |                       角度制                        |
| textcolhex |    调整字幕颜色    | 将hex颜色转为10进制后填入<br>*受col_convertion影响* |
| textscale  |    调整字幕大小    |                       默认为1                       |

在v1.5及以后，可以使用多文件字幕，要使用要创建文件：```[难度]_text_[编号].txt```，如ENCORE难度的2号字幕就创建一个```ENCORE_text_2.txt```
内部格式同单文件字幕，但是使用的gmk不太一样，下面记指定的字幕文件的编号为```[tid]```
> 从1.10.0开始,tid可以是任意字符串了，之前只能是0~49的数字

|       gmk名        |                 作用                  |                 其它描述                  |
| :----------------: | :-----------------------------------: | :---------------------------------------: |
|    textX_[tid]     |         调整字幕[tid]的横坐标         |  实际横坐标为textX\_[tid]+textX\_[tid]b   |
|    textX_[tid]b    |         调整字幕[tid]的横坐标         |                                           |
|    textY_[tid]     |         调整字幕[tid]的纵坐标         |  实际纵坐标为textY\_[tid]+textY\_[tid]b   |
|    textY_[tid]b    |          调整字幕tid的纵坐标          |                                           |
|   textalp_[tid]    |         调整字幕[tid]的透明度         |                 范围[0,1]                 |
|   textrot_[tid]    |        调整字幕[tid]的旋转角度        |                  角度制                   |
|  textcolrgb_[tid]  |           调整字幕[tid]颜色           |         将hex颜色转为10进制后填入         |
|  textscale_[tid]   |           调整字幕[tid]大小           |                  默认为1                  |
|   textsep_[tid]    |         调整字幕[tid]的行间距         |                  默认为1                  |
| textmaxwidth_[tid] | 调整字幕[tid]的行最大宽度（单位字符） |                 默认为20                  |
|  textalignv_[tid]  |      调整字幕[tid]的中心垂直位置      | 默认为顶部<br>0,1,2分别为顶部，中部，底部 |
|  textalignh_[tid]  |      调整字幕[tid]的中心水平位置      | 默认为居中<br>0,1,2分别为左侧，居中，右侧 |

#### 背景
对于自定义背景模式(custom)，你只要往谱面目录下放入数个图片(jpg或png)并在gmk内使用custom_jacket切换即可，命名格式是```jacket[id```，比如id为的1图片就叫```jacket[1.png```或```jacket[1.jpg```
<br>

对于plaudite背景(plaudite),范围0~11，从0到10分别对应以下曲目的jacket:
- transparent（透明背景）
- pyromania
- valor
- unraveling
- supernova
- libertia
- stopmotion
- convergence
- red（纯红色背景）
- plaudite
- astellion

|       gmk名        |           作用           |                      其它描述                      |
| :----------------: | :----------------------: | :------------------------------------------------: |
|   ditortedBG_alp   |  调整扭曲背景的不透明度  |                     范围[0,1]                      |
| ditortedBG_col_rgb |    调整扭曲背景的颜色    |             将hex颜色转为10进制后填入              |
|  plaudite_jacket   |      切换粒子的背景      | 虽然不是新的gmk，但是多了新的参数:11，代表默认背景 |
|   custom_jacket    |      切换粒子的背景      |         填入要切换的图片id，0代表默认背景          |
|   BG_ditortScale   | 调整扭曲背景的扭曲块大小 |                       默认0                        |
|  BG_ditortAmount   |  调整扭曲背景的扭曲程度  |                       默认0                        |
#### 滤镜/shader
|         gmk名         |                         作用                          |                           其它描述                            |
| :-------------------: | :---------------------------------------------------: | :-----------------------------------------------------------: |
|        fx_red         |    效果与fx_colorise相同，但是可由recolor随机颜色     |                                                               |
|        recolor        |                 重新调整fx_red的颜色                  |                                                               |
|   fx_red_intensity    |                 调整fx_red的滤镜强度                  |                                                               |
|  fx_colorise_col_rgb  |                调整colorise滤镜的颜色                 |                   将hex颜色转为10进制后填入                   |
| fx_colorise_col_alpha |           调整colorise滤镜的颜色中的alpha值           |                                                               |
| fx_colorise_intensity |                调整colorise滤镜的强度                 |                                                               |
|       vdistort        |                       纵向模糊                        |                            默认为0                            |
|       hdistort        |                       横向模糊                        |                            默认为0                            |
|       barrelabx       |                 调整barrel的横向色散                  |                            默认为0                            |
|       barrelaby       |                 调整barrel的竖向色散                  |                            默认为0                            |
|         sina          |                  将ui扭曲为正弦波形                   |        这类gmk的a指振幅，o指周期的倒数，p指相位，下同         |
|         sino          |                                                       |                  默认为0（0代表禁用），下同                   |
|         sinp          |                                                       |                        p默认为1，下同                         |
|         cosa          |               将ui扭曲为纵向的正弦波形                |                                                               |
|         cosp          |                                                       |                                                               |
|         coso          |                                                       |                                                               |
|         tana          |               将ui扭曲为纵向的正切波形                |                                                               |
|         tano          |                                                       |                                                               |
|         tanp          |                                                       |                                                               |
|         posx          |                    横向移动ui界面                     |                            默认为0                            |
|         posy          |                    纵向移动ui界面                     |                            默认为0                            |
|        twx[id]        |                在屏幕产生一个螺旋扭曲                 | x，y指扭曲中心位置，a指扭曲程度，r指扭曲半径[id]范围1~4，下同 |
|        twy[id]        |                                                       |                                                               |
|        twa[id]        |                                                       |                                                               |
|        twr[id]        |                                                       |                                                               |
|         gray          |                       灰色滤镜                        |                                                               |
|        barrel         |                                                       |                   最后效果是barrel+barrel2                    |
|        barrel2        |                                                       |                                                               |
|         fish          |                     鱼眼效果幅度                      |                                                               |
|          vig          |                                                       |                                                               |
|          abx          |                  调整横向色散的幅度                   |                                                               |
|          aby          |                  调整纵向色散的幅度                   |                                                               |
|         bloom         |                       光晕幅度                        |                                                               |
|       glitchamp       |                                                       |                                                               |
|     glitchoffset      |                                                       |                                                               |
|        uhnoise        |                                                       |                                                               |
|      fx_hue_hue       |                     调整整体色相                      |                                                               |
|   fx_hue_saturation   |                    调整整体饱和度                     |                                                               |
|        fx_edge        |                       边缘检测                        |                                                               |
|     fx_posterize      |                                                       |                                                               |
|       fx_twirl        | 在屏幕中心产生螺旋扭曲，这个gmk控制这个扭曲的扭曲程度 |                                                               |
|   fx_posterize_vis    |                 是否启用fx_posterize                  |                                                               |
|     fx_underwater     |                       水下效果                        |                                                               |
|        fx_zoom        |                                                       |                                                               |
- 注：fx_red与fx_colorise实则使用的同一个滤镜，区别在于fx_red只能使用recolor随机改变颜色

#### 粒子相关
|        gmk名        |               作用               |                    其它描述                     |
| :-----------------: | :------------------------------: | :---------------------------------------------: |
|  starspawner_timer  |           控制星星数量           |                                                 |
| starspd_multiplier  |         星星下落速度倍率         |                                                 |
|     starspd_low     |         星星最慢下落速度         |                                                 |
|    starspd_high     |         星星最快下落速度         |                                                 |
|  active_starchgcol  |         启用渐变色型星星         | 使用hsv进行渐变，方式是h，对h，s和v各自单独补间 |
|  active_startrans   |          启用蒙版型星星          |           这种星星会在黑色蒙版上挖空            |
|   startrans_alpha   |        蒙版型星星不透明度        |                                                 |
|  starchgcol_alpha   |       渐变色型星星不透明度       |                                                 |
|  starchgcol_up_rgb  | 渐变色型星星在屏幕上半部分的颜色 |         将hex颜色转为十进制后填入，下同         |
| starchgcol_down_rgb | 渐变色型星星在屏幕下半部分的颜色 |                                                 |
|   particle_alpha    |      控制菱形粒子的不透明度      |                                                 |
|       rainbow       |        让菱形粒子变为彩色        |                                                 |
|   plaudite_pburst   |          从顶部喷射粒子          |               value2控制喷射强度                |

#### 轨道Gimmick
| gmk名 |         作用          |          其它描述          |
| :---: | :-------------------: | :------------------------: |
| prtrX | 真正意义上的绕x轴旋转 | 默认为0<br>*是全局gimmick* |
| prtrY | 真正意义上的绕y轴旋转 | 默认为0<br>*是全局gimmick* |
| prsy  |       纵向斜切        | 默认为0<br>*是全局gimmick* |

#### Note效果
此处[lane]指代第n条轨道，0~3为4k的1~4轨，456为左中右bumper
|        gmk名         |                    作用                    |                   其它描述                    |
| :------------------: | :----------------------------------------: | :-------------------------------------------: |
|       xoffset        |                谱面横向偏移                |           单位px<br>*是全局gimmick*           |
|   yoffsetind[lane]   |    效果同yoffset，但只对[lane]轨道生效     |    与yoffset是累加关系<br>*是全局gimmick*     |
|   xoffsetind[lane]   |    效果同xoffset，但只对[lane]轨道生效     |    与xoffset是累加关系<br>*是全局gimmick*     |
|   notealpind[lane]   |    效果同notealp，但只对[lane]轨道生效     |    与notealp是累乘关系<br>*是全局gimmick*     |
| boost_timeind[lane]  |   效果同boost_time，但只对[lane]轨道生效   |   与boost_time是累加关系<br>*是全局gimmick*   |
| boost_distance[lane] | 效果同boost_distance，但只对[lane]轨道生效 | 与boost_distance是累加关系<br>*是全局gimmick* |
|  reset_scrollspeed   |              重置scrollspeed               |                *是全局gimmick*                |

#### 其它
|          gmk名          |                                   作用                                   |                                       其它描述                                       |
| :---------------------: | :----------------------------------------------------------------------: | :----------------------------------------------------------------------------------: |
|       jumpto_beat       |                             跳转谱面指定位置                             |                 在value2处填具体的值，单位为拍数<br>*是全局gimmick*                  |
|        jumpto_s         |                             跳转谱面指定位置                             |       当value1>0时单位为秒否则为毫秒，在value2处填具体的值<br>*是全局gimmick*        |
|        playspeed        |                             设置谱面播放速度                             |                             默认值为1<br>*是全局gimmick*                             |
|     col_convertion      |                  将自定义gmk内部分调整颜色的gmk逻辑转换                  | 不为0时会将输入的颜色以rgb的形式使用，否则以bgr的形式<br>受该gmk影响的将在描述中标出 |
|      slash_anycol       |                  生成一个slash，颜色由set_slash_col定义                  |                                                                                      |
|      set_slash_col      |                          调整slash_anycol的颜色                          |                 将hex颜色转为10进制后填入<br>*受col_convertion影响*                  |
|         cover1          |                           调整屏幕遮盖不透明度                           |                虽然不是新的gmk，但是作用变了：控制的是整个屏幕的遮盖                 |
|         cover2          |                          轨道外侧遮盖的不透明度                          |                                                                                      |
|         cover3          |                            轨道遮盖的不透明度                            |                                                                                      |
| angelstar_checker_mode  | 调整angelstar_checker的状态，0为受曲绘影响，1是不受影响，2是大于轨道图层 |                                       默认为0                                        |
| angelstar_checker_alpha |                          调整棋盘效果的不透明度                          |                                                                                      |
|  angelstar_checker_set  |                               刷新棋盘效果                               |                                                                                      |
|         wflash          |                                 白色闪屏                                 |                                                                                      |
|         static          |                          调整雪花效果的不透明度                          |                                                                                      |
|      df_sideline2       |                生成一对向外移动的黑色竖线，缓动为outCirc                 |                                                                                      |
|       df_sideline       |                      绘制一对可以控制移动的白色竖线                      |                             范围[0,1]，1代表抵达屏幕边缘                             |
|    df_sideline_alpha    |                         控制df_sideline的透明度                          |                                                                                      |
|       df_whitebg        |                                 白色背景                                 |                                                                                      |
|      df_grid_alpha      |                          df中的网格效果不透明度                          |                                                                                      |
|       df_grid_top       |                        控制网格可视部分的顶部位置                        |                                                                                      |
|     df_grid_bottom      |                        控制网格可视部分的底部位置                        |                                                                                      |
|     noteoverlayalp      |                                                                          |                                                                                      |
|         bgalph          |                        控制轨道非灰色部分的透明度                        |                                                                                      |
|    holdoverlayalpha     |                           轨道灰色部分的透明度                           |                                                                                      |
|       hide_combo        |                              隐藏combo显示                               |                                                                                      |

