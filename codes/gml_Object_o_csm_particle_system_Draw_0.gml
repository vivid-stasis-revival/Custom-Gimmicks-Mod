if (!instance_exists(cc))
    exit;

if (!surface_exists(blackSurf)){
    blackSurf = surface_create(320, 180);
}


surface_set_target(blackSurf);
draw_clear_alpha(c_black, blackSurfAlpha);
gpu_set_blendmode(bm_subtract);
with (o_pt_diamonddust_songgameplay) {
    draw_self();
}
gpu_set_blendmode(bm_normal);
surface_reset_target();
draw_surface(blackSurf, 0, 0);
