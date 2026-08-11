x += (((xspd * cc.delta_s) + (cc.mod_particlexpower * cc.timediff)) * 60);
y += (((yspd * cc.delta_s) + (cc.mod_particleypower * cc.timediff)) * 60);
image_alpha -= ((cc.delta_s * 60) / lifetime);

if (image_alpha <= 0 || x < -50 || x > 370 || y < -50 || y > 230)
    instance_destroy();
