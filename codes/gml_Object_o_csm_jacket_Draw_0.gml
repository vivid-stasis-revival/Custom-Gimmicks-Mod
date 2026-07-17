gpu_set_blendmode_ext(bm_dest_color, bm_zero);
gpu_set_tex_filter(true);
draw_sprite_stretched_ext(jacket, 0, -50, -50, 420, 268, jacketBlend, jacketAlpha)
gpu_set_tex_filter(false);
gpu_set_blendmode(bm_normal);
