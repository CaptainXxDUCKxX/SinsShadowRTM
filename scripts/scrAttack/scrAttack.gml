//ATTACK functionality
if(mouse_check_button_pressed(mb_left)) && bGrappling == false && bDashing == false
{
	bAttacking = true;
	sprite_index = sprSwordAtk; 
	audio_play_sound(sndSlashAttack, 5, false);
	if bFacingRight
	{
		instance_create_layer((x+20),y,"Player",objSwordHitbox);
	}
	if bFacingRight == false
	{
		instance_create_layer((x-50),y,"Player",objSwordHitbox);
	}
}
else
{
	if ceil(image_index) >= image_number
	{
		bAttacking = false;
		sprite_index = sprIdle;
	}
}
/*
	if(keyboard_check_pressed("D"))
	{
		switch(sprite_index)
		{
			case sprWalk:
			case sprSwordAtk:
			image_speed = .5
			//sprite_index = sprSwordAtk;//switches the sprite
			//break;//completed what was done and move on
		}
	}
*/