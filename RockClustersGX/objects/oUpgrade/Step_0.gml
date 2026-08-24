if (keyboard_check_pressed(vk_backspace)) || keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(0,gp_face2) 
{
	ini_open("highscore.ini");
	ini_write_real("Upgrades","jump",global.ug_jump);
	ini_write_real("Upgrades","speed",global.ug_speed);
	ini_write_real("Score","allmoney",global.allmoney);
	ini_close();
	room = Room2;
}

if (keyboard_check_pressed(vk_up)) && (option != 0) {
	option--;
}

if (keyboard_check_pressed(vk_down)) && (option < optionmax) {
	option++;
}

if (option == 0) {
if (keyboard_check_pressed(vk_right)) && (sign(global.allmoney) != -1) && (global.allmoney != 0) && (global.allmoney > 15){ 
	global.ug_jump++;
	global.allmoney -= 15;
}
else if (keyboard_check_pressed(vk_left)) && (global.ug_jump > 0) {
	global.ug_jump--;
	global.allmoney += 15;
}
}

if (option == 1) {
if (keyboard_check_pressed(vk_right)) && (sign(global.allmoney) != -1) && (global.allmoney != 0) && (global.allmoney > 5){ 
	global.ug_speed++;
	global.allmoney -= 5;
}
else if (keyboard_check_pressed(vk_left)) && (global.ug_speed > 0) {
	global.ug_speed--;
	global.allmoney += 5;
}
}
