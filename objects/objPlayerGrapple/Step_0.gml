 /////STEP\\\\\

scrAttack();
scrGrapple();
scrPlayerMovement();

/// The grapple was broken because it was being called here, 
// I guess..? I deleted it here and called the script, and now 
// it works. Hooray.
  	     
/// SLIDE DASH/DODGE CODE ///

//She can apply the force in the air for some reason.
//Fix Application of force when vk_down is pressed in air
//limit the usage of slide dash to be much shorter; it can be used infinitely, given Amelia has stamina
if keyboard_check(vk_down) || (gamepad_button_check(0, gp_shoulderr)) && keyboard_check(ord("D")) && iCurrentStamina > 14 && bCanSlide == true
{
	bDashing = true;
	bUnspaced = true;
	iCurrentStamina -= 0.25; 
	physics_apply_force(x,y,1000,0);
	sprite_index = sprSlide;
}
if keyboard_check(vk_down) || (gamepad_button_check(0, gp_shoulderr)) && keyboard_check(ord("A")) && iCurrentStamina > 14 && bCanSlide == true
{
	bDashing = true;
	bUnspaced = true;
	iCurrentStamina -= 0.25; 
	physics_apply_force(x,y,-1000,0);
	sprite_index = sprSlide;
}
if keyboard_check_released(vk_down)
{
	bDashing = false;
}

/// END SLIDE DASH ///

/////// JUMP CONDITIONS AND FUNCTIONALITY //////

//Used to see if the space key has been released since last successful jump
if(keyboard_check_released(vk_space)) || (gamepad_button_check_released(0, gp_face1))
{
	bUnspaced = true;
}

//Check to see if player is on the ground
if(place_meeting(x,y+5,objCollisionPhys) or place_meeting(x,y+5,objMovingPlatformPhys)) or place_meeting(x, y+5, objCollisionPhysLOWHALF)
{
	bOnGround = true;
	bJumping = false;
	if iCurrentStamina >=15
	{
		bCanSlide = true;
	}
} 
else
{
	bOnGround = false;
	bCanSlide = false;
}

//Jump only under appropriate conditions for Keyboard
if(keyboard_check(vk_space)) && bUnspaced == true && bOnGround == true && iCurrentStamina > 14
{
	bUnspaced = false;
	physics_apply_impulse(x, y, 0, -220);
	bJumping = true;
}

//Jump only under appropriate conditions for Controller
if(gamepad_button_check(0, gp_face1)) && bUnspaced == true && bOnGround == true && iCurrentStamina > 14
{
	bUnspaced = false;
	physics_apply_impulse(x, y, 0, -220);
	bJumping = true;
}

//display correct sprite while jumping
if bJumping == true && bAttacking == false
{
	if phy_linear_velocity_y <= 0
		sprite_index = sprJump;
	if phy_linear_velocity_y > 0
		sprite_index = sprFall;
}

//display correct sprite while falling
if bGrappling == false && phy_linear_velocity_y > 0 && bOnGround == false && bAttacking == false
{
	sprite_index = sprFall;
}

/// END JUMP /// 

/// VARIABLES FOR PHYSICS ///
phys_x = phy_position_x
phys_y = phy_position_y

/// DEATH ///
if (objPlayerGrapple.y >= 1200) 
{
	iCurrentHP = 0; 
	tDeathBuffer -= 1; 
}

if (iCurrentHP <= 0) 
{
	tDeathBuffer -= 1;
	effect_create_above(ef_firework, x, y-1, 0.3, c_red);
	instance_destroy(objPlayerGrapple);
	//room_goto(rmDeathScreen); /// moved this to the DeathBuffer if statement 
} 

if(tDeathBuffer <= 0)
{
	room_goto(rmDeathScreen);
}

//FACING RIGHT
if bFacingRight == true
{
	image_xscale = 1;
}
else
{
	image_xscale = -1;
}


//DAMAGE BUFFER
tDmgBuffer -= 1;
if(tDmgBuffer <= 0)
{
	bCanTakeDamage = true;
}