if(mouse_check_button_pressed(mb_left))
{
	bAttackAnim = true;
	sprite_index = sprSwordAtk; 
	audio_play_sound(sndSlashAttack, 5, false);
	if image_xscale == 1
	{
		instance_create_layer((x+20),y,"Player",objSwordHitbox);
	}
	if image_xscale == -1
	{
		instance_create_layer((x-50),y,"Player",objSwordHitbox);
	}
}
else
{
	if ceil(image_index) >= image_number
	{
		sprite_index = sprIdle;
	}
}

