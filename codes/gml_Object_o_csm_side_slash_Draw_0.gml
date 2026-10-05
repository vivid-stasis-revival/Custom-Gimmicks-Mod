if (color == 0)
{
    draw_set_color(color);
    draw_line_width(-6, left_y, 326, right_y, width);
}
else{
    gpu_set_blendmode_ext(bm_inv_dest_color, bm_zero);
    draw_set_color(color);
    draw_line_width(top_x, -10, bottom_x, 190, width);
    gpu_set_blendmode(bm_normal);
}