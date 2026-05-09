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

|       gmk名        |                作用                 |                其它描述                |
| :----------------: | :---------------------------------: | :------------------------------------: |
|    textX_[tid]     |         调整字幕tid的横坐标         | 实际横坐标为textX\_[tid]+textX\_[tid]b |
|    textX_[tid]b    |         调整字幕tid的横坐标         |                                        |
|    textY_[tid]     |         调整字幕tid的纵坐标         | 实际纵坐标为textY\_[tid]+textY\_[tid]b |
|    textY_[tid]b    |         调整字幕tid的纵坐标         |                                        |
|   textalp_[tid]    |         调整字幕tid的透明度         |               范围[0,1]                |
|   textrot_[tid]    |        调整字幕tid的旋转角度        |                 角度制                 |
|  textcolrgb_[tid]  |           调整字幕tid颜色           |       将hex颜色转为10进制后填入        |
|  textscale_[tid]   |           调整字幕tid大小           |                默认为1                 |
|   textsep_[tid]    |         调整字幕tid的行间距         |                默认为1                 |
| textmaxwidth_[tid] | 调整字幕tid的行最大宽度（单位字符） |                默认为20                |

#### 背景
对于自定义背景(custom_jacket)，你只要往谱面目录下放入数个图片(jpg或png)并在gmk内使用custom_jacket切换即可，命名格式是```jacket[id```，比如id为的1图片就叫```jacket[1.png```或```jacket[1.jpg```
<br>

对于plaudite背景(plaudite_jacket),范围0~11，从0到10分别对应以下曲目的jacket:
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
|   BG_ditortScale   | 调整扭曲背景的扭曲块大小 |                       默认25                       |
|  BG_ditortAmount   |  调整扭曲背景的扭曲程度  |                       默认25                       |
#### 滤镜/shader
|         gmk名         |                作用                |         其它描述          |
| :-------------------: | :--------------------------------: | :-----------------------: |
|   fx_red_intensity    |        调整fx_red的滤镜强度        |                           |
|  fx_colorise_col_rgb  |       调整colorise滤镜的颜色       | 将hex颜色转为10进制后填入 |
| fx_colorise_col_alpha | 调整colorise滤镜的颜色中的alpha值  |                           |
| fx_colorise_intensity |       调整colorise滤镜的强度       |                           |
|       vdistort        | 效果与hdistort相同，但是是竖直方向 |          默认为0          |
|       barrelabx       |        调整barrel的横向色散        |          默认为0          |
|       barrelaby       |        调整barrel的竖向色散        |          默认为0          |
- 注：fx_red与fx_colorise实则使用的同一个滤镜，区别在于fx_red只能使用recolor随机改变颜色

#### 轨道Gimmick
| gmk名 |         作用          | 其它描述 |
| :---: | :-------------------: | :------: |
| prtrX | 真正意义上的绕x轴旋转 | 默认为0  |
| prtrY | 真正意义上的绕y轴旋转 | 默认为0  |

#### 其它
|         gmk名          |                                   作用                                   |                                       其它描述                                       |
| :--------------------: | :----------------------------------------------------------------------: | :----------------------------------------------------------------------------------: |
|         jumpto         |                            跳转至歌曲指定位置                            |                                       单位为秒                                       |
|       playspeed        |                             设置谱面播放速度                             |                                      默认值为1                                       |
|     col_convertion     |                  将自定义gmk内部分调整颜色的gmk逻辑转换                  | 不为0时会将输入的颜色以rgb的形式使用，否则以bgr的形式<br>受该gmk影响的将在描述中标出 |
|      slash_anycol      |                  生成一个slash，颜色由set_slash_col定义                  |                                                                                      |
|     set_slash_col      |                          调整slash_anycol的颜色                          |                 将hex颜色转为10进制后填入<br>*受col_convertion影响*                  |
|         cover1         |                             调整遮盖不透明度                             |                虽然不是新的gmk，但是作用变了：控制的是整个屏幕的遮盖                 |
| angelstar_checker_mode | 调整angelstar_checker的状态，0为受曲绘影响，1是不受影响，2是大于轨道图层 |                                       默认为0                                        |

### 非自定义部分的完整清单
|          gmk名          | 作用  |       说明        |
| :---------------------: | :---: | :---------------: |
|         uialpha         |       |                   |
|         cover1          |       |                   |
|         cover2          |       |                   |
|         cover3          |       |                   |
|         rainbow         |       |                   |
|          sides          |       |                   |
|         notealp         |       |                   |
|     noteoverlayalp      |       |                   |
|        scorealph        |       |                   |
|         bgalph          |       |                   |
|          gray           |       |                   |
|         barrel          |       |                   |
|         barrel2         |       |                   |
|        hdistort         |       |                   |
|          fish           |       |                   |
|           vig           |       |                   |
|           abx           |       |                   |
|          bloom          |       |                   |
|           aby           |       |                   |
|         aberamp         |       |                   |
|        glitchamp        |       |                   |
|      glitchoffset       |       |                   |
|         uhnoise         |       |                   |
|         static          |       |                   |
|       fx_hue_hue        |       |                   |
|    fx_hue_saturation    |       |                   |
|         fx_edge         |       |                   |
|      fx_posterize       |       |                   |
|        fx_twirl         |       |                   |
|    fx_posterize_vis     |       |                   |
|      fx_underwater      |       |                   |
|          bloom          |       |                   |
| angelstar_checker_alpha |       |                   |
|  angelstar_checker_set  |       |                   |
|         fx_zoom         |       |                   |
|         fx_red          |       |                   |
|         recolor         |       |                   |
|    holdoverlayalpha     |       |                   |
|     plaudite_pburst     |       |                   |
|       hide_combo        |       |                   |
|  plaudite_red_particle  |       |                   |
|      df_sideline2       |       |                   |
|        df_sides         |       |                   |
|       df_sideline       |       |                   |
|       df_whitebg        |       |                   |
|      df_grid_alpha      |       |                   |
|       df_grid_top       |       |                   |
|     df_grid_bottom      |       |                   |
|         wflash          |       |                   |
|     plaudite_jacket     |       |                   |
|          sina           |       |                   |
|          sino           |       |                   |
|          sinp           |       |                   |
|          cosa           |       |                   |
|          cosp           |       |                   |
|          coso           |       |                   |
|          tana           |       |                   |
|          tanp           |       |                   |
|          tano           |       |                   |
|          posx           |       |                   |
|          posy           |       |                   |
|         twx[id]         |       | [id]范围1~4，下同 |
|         twy[id]         |       |                   |
|         twa[id]         |       |                   |
|         twr[id]         |       |                   |