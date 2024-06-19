	if (room == Room1) {
	if (global.hp < 1) {
		audio_stop_all();
		instance_deactivate_all(true);
		draw_sprite_ext(Sprite9,0,50,20, 0.2,0.2,0,c_white,1);
		global.hp = 0;
		if (keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0,gp_start)) room_restart();
	}
if (global.resetsleft < 0) global.resetsleft = 0;
} else {
	draw_sprite_ext(sLogo,0,65,20, 0.2,0.2,0,c_white,1);
}