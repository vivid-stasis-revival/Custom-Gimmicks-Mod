if (!instance_exists(cc))
    exit;

particle_system_add_alpha(particles_fast, cc.delta_s * -0.5);
particle_system_add_speed(particles_fast, cc.delta_s * 60);
particle_system_add_position(particles_fast, cc.mod_particlexpower * cc.timediff * 60, cc.mod_particleypower * cc.timediff * 60);
particle_system_add_alpha(particles_slow, cc.timediff * -0.25);
particle_system_add_speed(particles_slow, cc.timediff * 60);
particle_system_add_position(particles_slow, cc.mod_particlexpower * cc.timediff * 60, cc.mod_particleypower * cc.timediff * 60);
particle_system_cull(particles_slow, -50, -50, 370, 230);
timer += (cc.delta_s * 60);

while (timer >= 2)
{
    if (global.op_bgparticles != 0)
    {
        var _x = irandom(320);
        var _y = irandom(180);
        
        repeat ((1 / global.op_bgparticles) + 1)
            particle_system_add_particle(particles_fast, _x, _y, (random(2) - 1) * 1.5, (random(2) - 1) * 1.5, 0, 0, 1, 1, 1, irandom(3), (cc.mod_rainbow == -1) ? 16777215 : make_colour_hsv(irandom(255), 255 * cc.mod_rainbow, 255));
    }
    
    timer -= 2;
}