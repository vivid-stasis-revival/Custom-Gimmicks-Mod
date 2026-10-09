side = 207 * irandom(1);
width=12
top_x = random_range(0, 110) + side;
bottom_x = random_range(0, 110) + side;
cc.CreateChartTween(cc.currentms,cc.mod_lr_slash_close_time*1000,self,"width",EaseOutQuad,12,0)