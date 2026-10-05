side = 207 * irandom(1);
width=12
top_x = random_range(0, 110) + side;
bottom_x = random_range(0, 110) + side;
cc.CreateChartTween(cc.currentms,1000,self,"width",EaseOutQuad,12,0)