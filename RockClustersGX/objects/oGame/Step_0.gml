if (room == Room1) {
if (keyboard_check_pressed(vk_backspace)) { room = Room2;
	audio_stop_all(); }
if (global.score > global.highscore) {
	global.highscore = global.score;
	ini_open("highscore.ini") {
		ini_write_real("Score","highscore",global.highscore);
	}
	ini_close();
}
if (gamepad_button_check_pressed(0,gp_start) || keyboard_check_pressed(ord("R"))) && (global.hp != 0) {
	if (global.resetsleft > 0) {
		audio_play_sound(sfxSkip,0,false);
		instance_destroy(oWallTest);
		global.hp -= 2;
oPlayer.x = oPlayer.start_x;
	oPlayer.y = oPlayer.start_y;
	oPlayer.Xv = 0;
	oPlayer.Yv = 0;
	instance_destroy(oWallTest);
repeat (20) {
	instance_create_layer(x + irandom_range(-5,3), y + irandom_range(-80,70),layer,oWallTest);
}
global.resetsleft--;
}
}
} else {
if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter) || gamepad_button_check(0,gp_face1)) {
	if (circle_y == 506) {
	room = Room1;
	} else {
		game_end();
	}
}
}