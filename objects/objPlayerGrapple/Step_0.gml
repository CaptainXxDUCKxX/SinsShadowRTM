 /////STEP\\\\\

scrAttack();
scrGrapple();
scrPlayerMovement();
/// The grapple was broken because it was being called here, 
// I guess..? I deleted it here and called the script, and now 
// it works. Hooray

/// Attempting to spawn an object with the press of a button
// Trying to draw a line between Amelia, two objects, and THEN the Grapple Point -- 12/15/17 3:02pm
// This suddenly started working (15 mins after it wasn't) -- 12/15/17 3:07pm
/*
if(keyboard_check_pressed(vk_up))
{
	instance_create_layer(x+20, y-41, "Player", objGP2);
}
*/

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
if(keyboard_check(vk_space)) && bUnspaced == true && bOnGround == true
{
	bUnspaced = false;
	physics_apply_impulse(x, y, 0, -220);
	bJumping = true;
}

//Jump only under appropriate conditions for Controller
if(gamepad_button_check(0, gp_face1)) && bUnspaced == true && bOnGround == true
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
	effect_create_above(ef_firework, x, y-1, 0.3, c_red);
	instance_destroy(objPlayerGrapple);
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