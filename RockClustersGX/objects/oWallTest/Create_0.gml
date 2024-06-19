image_angle = random_range(0,180);
image_index = irandom_range(0,4);
image_xscale = random_range(0.7,2);
image_yscale = image_xscale;
if (image_xscale == 0) image_xscale = 1;

enemy = irandom_range(1,3);
attackable = 0;
repeat (10) x -= irandom_range(-6,20);

if (enemy == 1) { 
	attackable = irandom_range(1,3);
	
	if (attackable == 1) {
	sprite_index = sRocksAttack;
	} else {
		sprite_index = sRocksEnemy;
	}
} else {
	sprite_index = sRocks;
}