### Custom Gimmick自定义部分说明

#### 字幕效果：

首先要在谱面的目录下创建一个文件： ``` [难度]_text.txt```，如ENCORE难度就创建一个```ENCORE_text.txt```

之后在文件里面按照以下格式打轴，一行一个语句：

``````
[拍数],[字幕的内容]
``````

之后就可以使用gmk操作字幕了，以下是可以操作字幕的gmk：

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

|      gmk名       |         作用          |                其它描述                |
| :--------------: | :-------------------: | :------------------------------------: |
|   textX_[tid]    |  调整字幕tid的横坐标  | 实际横坐标为textX\_[tid]+textX\_[tid]b |
|   textX_[tid]b   |  调整字幕tid的横坐标  |                                        |
|   textY_[tid]    |  调整字幕tid的纵坐标  | 实际纵坐标为textY\_[tid]+textY\_[tid]b |
|   textY_[tid]b   |  调整字幕tid的纵坐标  |                                        |
|  textalp_[tid]   |  调整字幕tid的透明度  |               范围[0,1]                |
|  textrot_[tid]   | 调整字幕tid的旋转角度 |                 角度制                 |
| textcolrgb_[tid] |    调整字幕tid颜色    |       将hex颜色转为10进制后填入        |
| textscale_[tid]  |    调整字幕tid大小    |                默认为1                 |
|  textsep_[tid]   |    调整字幕tid大小    |                默认为1                 |

#### 背景
|       gmk名        |         作用         |                      其它描述                      |
| :----------------: | :------------------: | :------------------------------------------------: |
|   ditortedBG_alp   | 调整扭曲背景的透明度 |                     范围[0,1]                      |
| ditortedBG_col_rgb |  调整扭曲背景的颜色  |             将hex颜色转为10进制后填入              |
|  plaudite_jacket   |    切换粒子的背景    | 虽然不是新的gmk，但是多了新的参数:11，代表默认背景 |
#### 滤镜/shader
|         gmk名         |               作用                |         其它描述          |
| :-------------------: | :-------------------------------: | :-----------------------: |
|   fx_red_intensity    |       调整fx_red的滤镜强度        |                           |
|  fx_colorise_col_rgb  |      调整colorise滤镜的颜色       | 将hex颜色转为10进制后填入 |
| fx_colorise_col_alpha | 调整colorise滤镜的颜色中的alpha值 |                           |
| fx_colorise_intensity |      调整colorise滤镜的强度       |                           |
- 注：fx_red与fx_colorise实则使用的同一个滤镜，区别在于fx_red只能使用recolor随机改变颜色

#### 轨道Gimmick
| gmk名 |   作用   | 其它描述 |
| :---: | :------: | :------: |
| prsy  | 纵向斜切 | 默认为0  |

#### 其它
|     gmk名      |                  作用                  |                                       其它描述                                       |
| :------------: | :------------------------------------: | :----------------------------------------------------------------------------------: |
|     jumpto     |           跳转至歌曲指定位置           |                                       单位为秒                                       |
|   playspeed    |            设置谱面播放速度            |                                      默认值为1                                       |
| col_convertion | 将自定义gmk内部分调整颜色的gmk逻辑转换 | 不为0时会将输入的颜色以rgb的形式使用，否则以bgr的形式<br>受该gmk影响的将在描述中标出 |
|  slash_anycol  | 生成一个slash，颜色由set_slash_col定义 |                                                                                      |
| set_slash_col  |         调整slash_anycol的颜色         |                 将hex颜色转为10进制后填入<br>*受col_convertion影响*                  |
|     cover1     |            调整遮盖不透明度            |                虽然不是新的gmk，但是作用变了：控制的是整个屏幕的遮盖                 |

#### 官方gmk部分
|          gmk名          | 作用  | 其它描述 |
| :---------------------: | :---: | :------: |
|         uialpha         |       |          |
|         cover1          |       |          |
|         cover2          |       |          |
|         cover3          |       |          |
|         wflash          |       |          |
|         rainbow         |       |          |
|          sides          |       |          |
|         notealp         |       |          |
|          video          |       |          |
|     noteoverlayalp      |       |          |
|        scorealph        |       |          |
|         bgalph          |       |          |
|          gray           |       |          |
|         barrel          |       |          |
|         barrel2         |       |          |
|        hdistort         |       |          |
|          fish           |       |          |
|           vig           |       |          |
|           abx           |       |          |
|           aby           |       |          |
|         aberamp         |       |          |
|        glitchamp        |       |          |
|      glitchoffset       |       |          |
|         uhnoise         |       |          |
|     abberationxamp      |       |          |
|     abberationyamp      |       |          |
|         static          |       |          |
|       fx_hue_hue        |       |          |
|    fx_hue_saturation    |       |          |
|         fx_edge         |       |          |
|      fx_posterize       |       |          |
|        fx_twirl         |       |          |
|    fx_posterize_vis     |       |          |
|      fx_underwater      |       |          |
|          bloom          |       |          |
| angelstar_checker_alpha |       |          |
|  angelstar_checker_set  |       |          |
|         fx_zoom         |       |          |
|         fx_red          |       |          |
|         recolor         |       |          |
|    holdoverlayalpha     |       |          |
|     plaudite_pburst     |       |          |
|       hide_combo        |       |          |
|  plaudite_red_particle  |       |          |
|      slash_anycol       |       |          |
|      set_slash_col      |       |          |
|      df_sideline2       |       |          |
|        df_sides         |       |          |
|       df_sideline       |       |          |
|       df_whitebg        |       |          |
|      df_grid_alpha      |       |          |
|       df_grid_top       |       |          |
|     df_grid_bottom      |       |          |
|     plaudite_jacket     |       |          |
