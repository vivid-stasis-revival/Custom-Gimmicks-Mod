if (!instance_exists(cc))
    exit;

//normal particle
if(cc.mod_particle_alpha>0)
{
    timer += (cc.delta_s * 60);
    while (timer >= 2)
    {
        spawn_particles_area(irandom(320), irandom(180), depth - 99, o_pt_diamonddust_songgameplay, 1, 1.5, 1);
        timer -= 2;
    }
    if (instance_exists(o_pt_diamonddust_songgameplay)){
        o_pt_diamonddust_songgameplay.visible=false;
        o_pt_diamonddust_songgameplay.image_alpha*=cc.mod_particle_alpha;
    }
}
//stars
if (cc.ENABLE_STARPARTICLE){
    if (cc.mod_starspawner_timer > 0){
        star_timer-= (cc.timediff * 60);  
        while (star_timer <= 0)
        {
            if (cc.mod_activate_startrans){
                var l = irandom_range(0, 1);
                instance_create_depth(irandom_range(0, 110) + (210 * l), (cc.mod_starspd_multiplier < 0) ? 185 : -5, depth, o_csm_startransparent);
            }
            if (cc.mod_activate_starchgcol){
                var l = irandom_range(0, 1);
                instance_create_depth(irandom_range(0, 110) + (210 * l), (cc.mod_starspd_multiplier < 0) ? 185 : -5, 101, o_csm_starchangecol);
            }
            star_timer += cc.mod_starspawner_timer;
        }
    }

    if (instance_exists(o_csm_startransparent)){
        o_csm_startransparent.visible=false;
        o_csm_startransparent.image_alpha*=cc.mod_startrans_alpha;
    }
}
