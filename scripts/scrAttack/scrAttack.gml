//ATTACK functionality
if(mouse_check_button_pressed(mb_left)) && bGrappling == false && bDashing == false
{
	bAttacking = true;
	sprite_index = sprSwordAtk;
	audio_play_sound(sndSlashAttack, 5, false);
}
else
{
	if ceil(image_index) >= image_number
	{
		bAttacking = false;
		sprite_index = sprIdle;
	}
}

if bFacingRight && image_index > 4 && bAttacking
{
instance_create_layer((x+20),y,"Player",objSwordHitbox);
}

if bFacingRight == false && image_index > 4 && bAttacking
{
instance_create_layer((x-50),y,"Player",objSwordHitbox);
}