var x_direction = (keyboard_check(ord("D")) || (keyboard_check(vk_right))|| (gamepad_axis_value(0,gp_axislh) > 0) || (gamepad_axis_value(0,gp_axislh) > 0)) - (keyboard_check(ord("A")) || keyboard_check(vk_left) || (gamepad_axis_value(0,gp_axislh) < 0) || (gamepad_axis_value(0,gp_axislh) < 0));
var jump = keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up) || keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0,gp_face1) || gamepad_button_check_pressed(0,gp_face2)
collision = [oWallTest,oStartingPlatform,oWalls];
var on_the_ground = place_meeting(x,y + 1, collision);
var can_wall_jump = place_meeting(x + 1 * image_xscale,y,collision);
var atk = keyboard_check(ord("M")) || keyboard_check(ord("Z")) || gamepad_button_check(0,gp_face3) || gamepad_button_check(0,gp_shoulderrb); 
var atkrelease = atk = keyboard_check_pressed(ord("M")) || keyboard_check_pressed(ord("Z"))|| gamepad_button_check_pressed(0,gp_face3) || gamepad_button_check_pressed(0,gp_shoulderrb);
var walljumping = (can_wall_jump) && (jump) && (x_direction != 0)

if (x_direction != 0) image_xscale = x_direction;
Xv = x_direction * spd;

Yv += 0.7;

if (can_wall_jump) && (jump) && (x_direction != 0){
	if (!instance_exists(oWallJumpEffect)) instance_create_layer(x + 16 * image_xscale,y,layer,oWallJumpEffect);
	Yv = -8;
		walljumps++;
}
	
if (jump) && on_the_ground
 { 
		jumps = 1;
		 if (jumps == 1) {
			 audio_play_sound(sfxJump,0,false);
		 Yv = -8;
		}
 } else {
	 if on_the_ground jumps = 0;
	 if jump && !walljumping {
		 jumps++;
		 if (jumps == 2) {
			 audio_play_sound(sfxJump,0,false,1,0,1.1);
			 Yv = -6;
			 } else {
				 if (jumps > 2) {
					 jumps = 0;
				 }
				}
			}
		}
	 

if (atk) {
		image_index = 3;
		if (atkrelease) {
		audio_play_sound(sfxPewRc,0,false);
		instance_create_layer(x,y + 12,layer,oProyectile);
		}
	} else {
if (!on_the_ground) {
	sprite_index = sJettis;
	image_index = 2;
} else {
	if (x_direction != 0) {
		sprite_index = sJettisWalk;
	} else {
		sprite_index = sJettis;
		image_index = 0;
	}
}
	}
	
if (y < -30) {
	x = start_x;
	y = start_y;
	Xv = 0;
	Yv = 0;
	instance_destroy(oWallTest);
repeat (20) {
	instance_create_layer(oGame.x + irandom_range(-5,3 * (global.score/2)),oGame.y + irandom_range(-80 - (global.score/2),70),layer,oWallTest);
}
global.score += 1;
global.money = (global.score * 1.2) - 1.2
global.resetsleft += 1;
}


if (on_the_ground) || (!can_wall_jump) { walljumps = 0; }

if (place_meeting(x + Xv, y, collision)) { 
	var onSlope = false;
    var _tol = abs(Xv) + 2;
    for(var i = 0; i < _tol; i++)
    {
        if (!place_meeting(x + Xv,y - i,collision))
        {
            y -= i;
            onSlope = true;
            break;
        }
	}
	
	if (!onSlope) {
	while (!place_meeting(x + sign(Xv), y, collision)) {
		x += sign(Xv);
	}
	
	Xv = 0; 
	}
} else {
	onSlope = false;
    _tol = abs(Xv) + 1
    for(var i = 0; i < _tol; i++)
    {
        if (!place_meeting(x + Xv,y + i,collision)) and (place_meeting(x + Xv,y + (i + 1),collision))
        {
            y += i;
            onSlope = true;
            break;
        }
    }
}

x += Xv;

if (place_meeting(x, y + Yv, collision)) { 
	
	while (!place_meeting(x, y + sign(Yv), collision)) {
		y += sign(Yv);
	}
	
	Yv = 0; 
}

y += Yv;
