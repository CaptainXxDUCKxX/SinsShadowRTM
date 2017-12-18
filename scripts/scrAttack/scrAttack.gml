//ATTACK functionality
if !bJumping
{
	bAtJumpApex = false;
}
if(keyboard_check_pressed(vk_left)) && !bGrappling
{
	bAttacking = true;
	audio_play_sound(sndSlashAttack, 5, false);
	if(bJumping && phy_linear_velocity_y > -75 && phy_linear_velocity_y < 75)
	{
		bAtJumpApex = true;
		sprite_index = sprSwordFall;
	}
	if(bJumping && phy_linear_velocity_y >= 75 || phy_linear_velocity_y <= -75)
	{
		bAtJumpApex = false;
	}
	if(bJumping && phy_linear_velocity_y <= -75 && !bAtJumpApex)
	{
		sprite_index = sprSwordJump;
	}
	if(bJumping && phy_linear_velocity_y >= 75 && !bAtJumpApex)
	{
		sprite_index = sprSwordFall2;
	}
	if(!bJumping)
	{
	sprite_index = sprSwordAtk;
	}
}
else
{
//	if ceil(image_index) >= image_number
	if image_index >= (image_number - 0.50)
	{
		bAttacking = false;
		sprite_index = sprIdle;
	}
}

/*
if bFacingRight && image_index >= 3 && bAttacking
{
instance_create_layer((x+20),y,"Player",objSwordHitbox);
}
else
{
	instance_destroy(objSwordHitbox);
}
*/
if !bFacingRight && image_index >= 3 && bAttacking
{
	instance_create_layer((x-50),y,"Player",objSwordHitbox);
}

else if bFacingRight && image_index >= 3 && bAttacking
{
	instance_create_layer((x+20),y,"Player",objSwordHitbox);
}
else
{
	instance_destroy(objSwordHitbox);
}

