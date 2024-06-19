draw_set_font(fScore);
if (room == Room2) {
	draw_text(16,745,"Released and Developed by OPagel");
	draw_text(850,745,"v1.1.1");
}

if (room == Room1) {
draw_text(16,16,string_join(": ", "FPS", fps));
draw_set_font(fScore);
draw_text(16, 716, string_join(": ", "HP", global.hp));
draw_text(120, 716, string_join(": ", "SECTION", global.score));
draw_text(864, 716, string_join("", global.score * 15, "m"));
//draw_text(864, 690, string_join("","$",(global.score * 1.2) - 1.2));
if (global.resetsleft > 0) {
draw_text(280, 716, string_join(": ", "RESETS LEFT", global.resetsleft));
} else {
	draw_text(280, 716, "You can no longer reset.");
}
if (global.hp < 1) {
	draw_text(350,480,string_join(": ", "Personal Best", global.highscore));
	draw_text(450,510,string_join("", global.highscore * 15,"m"));
	if !gamepad_is_connected(0) {
	draw_text(300,450,"Press Space to Play Again");
	} else {
		draw_text(300,450,"Press Options to Play Again");
	}
}
} else {
	draw_set_font(fTitle);
	draw_circle(370,circle_y,20,true);
	draw_circle(370,circle_y,19,true);
	draw_circle(370,circle_y,18,true);
	draw_circle(370,circle_y,17,true);
	draw_circle(370,circle_y,16,true);
	draw_circle(370,circle_y,15,true);
	draw_text(410,480,"START");
	draw_text(420,540,"QUIT");
	if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")) || (gamepad_axis_value(0,gp_axislv) > 0)) {
		
		if (down_update == 0) {
			audio_play_sound(sfxSelect,0,false);
			if (circle_y == 506)  { circle_y += 60; } else { circle_y -= 60;}
			down_update = 1;
		}
		
	} else {
		down_update = 0;
	}
	if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")) || (gamepad_axis_value(0,gp_axislv) < 0)) {
		
		if (up_update == 0) {
		if (circle_y == 566)  { circle_y -= 60; } else { circle_y += 60;}
		audio_play_sound(sfxSelect,0,false);
		up_update = 1
		}
		} else {
			up_update = 0;
		}
}