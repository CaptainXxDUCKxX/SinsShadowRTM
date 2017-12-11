if(keyboard_check(ord("D"))) || (gamepad_button_check(0, gp_padr)) || (gamepad_axis_value(0,gp_axislh) > 0.1) && bAttacking == false
{
	bFacingRight = true;
	physics_apply_force(x, y, 310, 0);
	hspeed = 3;
	if bAttacking == false
	{
		sprite_index = sprWalk;
	} 
	if(bGrappling == true) && (hspeed != 0)
	{
		physics_apply_angular_impulse(100);
		sprite_index = sprAmeliaSwing;
	}

}
/*
	/// 
	if(keyboard_check(vk_down)) || (gamepad_button_check(0, gp_shoulderr))
	{
		tStopSlide = 2;
		bUnspaced = false;
		//physics_apply_force(x,y,580,0);
		sprite_index = sprSlide; 
	}
*/

if(keyboard_check(ord("A"))) || (gamepad_button_check(0, gp_padl)) || (gamepad_axis_value(0,gp_axislh) < -0.1) && bAttacking == false
{
	bFacingRight = false;
	physics_apply_force(x, y, -310, 0);
	hspeed = -3;
	if bAttacking == false
	{
		sprite_index = sprWalk;
	}
	if(bGrappling == true) && (hspeed != 0)
	{
		physics_apply_angular_impulse(-100);
		sprite_index = sprAmeliaSwing;
	}
	/*
	if(keyboard_check(vk_down)) || (gamepad_button_check(0, gp_shoulderr))
	{
		tStopSlide = 2;
		bUnspaced = false;
		//physics_apply_force(x,y,-580,0);
		sprite_index = sprSlide; 
	}
	*/
}

/*
	if(hspeed == 0) sprite_index = sprHang;
	else sprite_index = sprHang;
	
	if objPlayerGrapple.x < objGrappleBlock.x
	{
		physics_apply_force(x, y, 250, 0);
	}
	
	if objPlayerGrapple.x > objGrappleBlock.x 
	{
		physics_apply_force(x, y, -250, 0);
	}
	
}
*/

if(!keyboard_check(ord("A"))) && !keyboard_check(ord("D")) 
{
	if(bOnGround == true)
	{
		hspeed = 0;
		sprite_index = sprIdle;
	}
	if(bGrappling == true)
	{
		hspeed = 0;
		sprite_index = sprHang;
	}
}


/*
if position_meeting(x,y, objMovingPlatformPhys) 
  {
	  //path_start(pathMovingPlatform, iPlatformSpeed, path_action_restart, 0);
	  //gravity:=0;
	  //vspeed:=0;
	  //hspeed = other.hspeed;
  }   
*/	   