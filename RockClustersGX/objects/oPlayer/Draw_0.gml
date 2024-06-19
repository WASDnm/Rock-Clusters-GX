if (walljumps > max_walljumps - 1) {
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,0,c_grey,1);
} else {
draw_self();
}