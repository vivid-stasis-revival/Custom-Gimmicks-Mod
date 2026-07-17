if (!instance_exists(cc) || cc.mod_activate_startrans<=0)
    exit;

particle_system_add_alpha(stars, cc.timediff * -0.5*cc.mod_startrans_alpha);
particle_system_add_speed(stars, cc.mod_starspd_multiplier * cc.timediff * 60);
particle_system_cull(stars, -50, -10, 370, 190);

if (cc.mod_starspawner_timer > 0)
{
    timer -= (cc.timediff * 60);
    
    while (timer <= 0)
    {
        particle_system_add_particle(stars, irandom_range(0, 110) + (210 * irandom(1)), (cc.mod_starspd_multiplier < 0) ? 190 : -10, 0, random_range(cc.mod_starspd_low, cc.mod_starspd_high), 0, 0, 1, 1, 2, irandom(3), 16777215);
        timer += cc.mod_starspawner_timer;
    }
}
