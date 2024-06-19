if ((place_meeting(x,y-1,oPlayer)) || (place_meeting(x + 1,y,oPlayer)) || (place_meeting(x - 1,y,oPlayer))) && (enemy == 1) {
	audio_play_sound(sfxHurt,0,false);
	global.hp -= 3;
	global.resetsleft -= 3
	oPlayer.x = oPlayer.start_x;
	oPlayer.y = oPlayer.start_y;
}