if (!instance_exists(cc))
    exit;

if (blackSurf==-1){
    blackSurf = surface_create(320, 180);
}
surface_set_target(blackSurf);
draw_clear_alpha(c_black, blackSurfAlpha);
gpu_set_blendmode_ext(bm_zero, bm_inv_src_alpha);
with (o_pt_diamonddust_songgameplay) {
    draw_self();
}
gpu_set_blendmode(bm_normal);
surface_reset_target();
draw_surface(blackSurf, 0, 0);