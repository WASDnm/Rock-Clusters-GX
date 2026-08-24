randomize();
circle_y = 506;
circle_r = 0;
global.score = 1;
global.hp = 25;
global.resetsleft = 15;
global.highscore = 0;
global.money = 0;
global.allmoney = 0;
global.ug_jump = 0;
global.ug_speed = 0;
up_update = 0;
down_update = 0;
gamepad_set_axis_deadzone(0,0.5);
ini_open("highscore.ini") {
	global.highscore = ini_read_real("Score","highscore",0);
	global.allmoney = ini_read_real("Score","allmoney",0);
	global.ug_jump = ini_read_real("Upgrades","jump",0);
	global.ug_speed = ini_read_real("Upgrades","speed",0);
}
ini_close();

if (room == Room1) {
	if (audio_is_playing(sfxTitleJingle)) audio_stop_sound(sfxTitleJingle);
audio_play_sound(asset_get_index(string_join("","mMainTheme",irandom_range(1,2))),0,false);
} else {
	audio_stop_all();
	audio_play_sound(sfxTitleJingle,0,false);
}

if (room == Room1) {
if (instance_exists(oWallTest)) instance_destroy(oWallTest);
repeat (20) {
	instance_create_layer(x + irandom_range(-5,3),y + irandom_range(-80,70),layer,oWallTest);
}
}