if (!instance_exists(cc))
    exit;

timer += (cc.delta_s * 60);

while (timer >= 2)
{
    spawn_particles_area(irandom(320), irandom(180), depth - 99, o_csm_diamonddust_songgameplay, 1, 1.5, 1);
    timer -= 2;
}