if (!instance_exists(cc) || cc.mod_activate_starchgcol<=0)
    exit;

if (cc.mod_starspawner_timer > 0){
    timer-= (cc.timediff * 60);  
    while (timer <= 0)
    {
        var l = irandom_range(0, 1);
        instance_create_depth(irandom_range(0, 110) + (210 * l), (cc.mod_starspd_multiplier < 0) ? 185 : -5, 101, o_csm_starchangecol);
        timer += cc.mod_starspawner_timer;
    }
}