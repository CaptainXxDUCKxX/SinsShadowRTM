 /////STEP\\\\\

scrAttack();

///// Grapple functionality /////
// The iGrappleRadius variable seems to be a bit janky. She can grapple when she's near an instance of objGrappleBlock, but she does not grapple the nearest one
// only the first one
// it doesn't matter what instance layer the Grapple Point is on, either 
// Need to figure out why it's only drawing the physics joint rope on that singular objGrappleBlock... 
if(keyboard_check_pressed(vk_up)) || (gamepad_button_check_pressed(0, gp_face3)) && (instance_exists(objGrappleBlock)) && (distance_to_object(objGrappleBlock) < iGrappleRadius)
{
	active = true;
	instNearestGP = instance_nearest(x, y, objGrappleBlock);
	jointGrapple = physics_joint_rope_create(objPlayerGrapple, instNearestGP, (objPlayerGrapple.x + 9), (objPlayerGrapple.y - 41), instNearestGP.x, instNearestGP.y, 100, true); 
	bJumping = false;
	/*
	if instNearestGP.y < y
	{
		mx = instNearestGP.x;
		my = instNearestGP.y;*/
	if(distance_to_object(objGrappleBlock) > iGrappleRadius) 
	{ 
		active = false;
	}
}


if(keyboard_check_released(vk_up)) && (active == true)|| (gamepad_button_check_released(0, gp_face3)) && (active == true)
{
	physics_joint_delete(jointGrapple);
	active = false;
	
}

/// END GRAPPLY FUNCTION ///

///// PLAYER MOVEMENT /////
//if(hspeed == 0) sprite_index = sprIdle;

if(keyboard_check(ord("D"))) || (gamepad_button_check(0, gp_padr)) || (gamepad_axis_value(0,gp_axislh) > 0.1)
{
	image_xscale = 1;
	physics_apply_force(x, y, 310, 0);
	hspeed = 3;
	sprite_index= sprWalk; 
	if(active == true)
	{
		physics_apply_angular_impulse(100);
		sprite_index = sprAmeliaSwing;
	}
	if(keyboard_check(vk_down)) || (gamepad_button_check(0, gp_shoulderr))
	{
		bCanSlide = true;
		tStopSlide = 2;
		bUnspaced = false;
		bOnGround = true;
		//physics_apply_force(x,y,580,0);
		sprite_index = sprSlide; 
	}
}

if(keyboard_check(ord("A"))) || (gamepad_button_check(0, gp_padl)) || (gamepad_axis_value(0,gp_axislh) < -0.1)
{
	image_xscale = -1;
	physics_apply_force(x, y, -310, 0);
	hspeed = -3;
	sprite_index = sprWalk;
	if(active == true)
	{
		physics_apply_angular_impulse(-100);
		sprite_index = sprAmeliaSwing;
	}
	if(keyboard_check(vk_down)) || (gamepad_button_check(0, gp_shoulderr))
	{
		bCanSlide = true; 
		tStopSlide = 2;
		bUnspaced = false;
		bOnGround = true;
		//physics_apply_force(x,y,-580,0);
		sprite_index = sprSlide; 
	}
}

if(active == true) && (hspeed == 0)
{
	sprite_index = sprHang; 
}	

if(!keyboard_check(ord("A"))) && !keyboard_check(ord("D")) 
{
	if(bOnGround == true)
	{
		hspeed = 0;
		sprite_index = sprIdle;
	}
}

if position_meeting(x,y, objMovingPlatformPhys) 
  {
	  //path_start(pathMovingPlatform, iPlatformSpeed, path_action_restart, 0);
	  //gravity:=0;
	  //vspeed:=0;
	  //hspeed = other.hspeed;
  }   
	   
/// END PLAYER MOVEMENT ///	   
	     
/// SLIDE DASH/DODGE CODE ///

//She can apply the force in the air for some reason.
//Fix Application of force when vk_down is pressed in air
//limit the usage of slide dash to be much shorter; it can be used infinitely, given Amelia has stamina
if keyboard_check(vk_down) || (gamepad_button_check(0, gp_shoulderr)) && keyboard_check(ord("D")) && iCurrentStamina > 14  
{
	bUnspaced = true;
	iCurrentStamina -= 1; 
	physics_apply_force(x,y,1000,0);
	sprite_index = sprSlide;
}
if keyboard_check(vk_down)|| (gamepad_button_check(0, gp_shoulderr))&& keyboard_check(ord("A")) && iCurrentStamina > 14  

{
	bUnspaced = true;
	iCurrentStamina -= 1; 
	physics_apply_force(x,y,-1000,0);
	sprite_index = sprSlide;
}

/// END SLIDE DASH /// 

/////// JUMP CONDITIONS AND FUNCTIONALITY //////

//Used to see if the space key has been released since last successful jump
if(keyboard_check_released(vk_space)) || (gamepad_button_check_released(0, gp_face1))
{
	bUnspaced = true;
}

//Check to see if player is on the ground
if(place_meeting(x,y+5,objCollisionPhys) or place_meeting(x,y+5,objMovingPlatformPhys))
{
	bOnGround = true;
	bJumping = false;
} 
else
{
	bOnGround = false;
}

//Jump only under appropriate conditions for Keyboard
if(keyboard_check(vk_space)) && bUnspaced == true && bOnGround == true && iCurrentStamina > 14
{
	bUnspaced = false;
	physics_apply_impulse(x, y, 0, -220);
	iCurrentStamina -= 15;
	bJumping = true;
}

//Jump only under appropriate conditions for Controller
if(gamepad_button_check(0, gp_face1)) && bUnspaced == true && bOnGround == true && iCurrentStamina > 14
{
	bUnspaced = false;
	physics_apply_impulse(x, y, 0, -220);
	iCurrentStamina -= 15;
	bJumping = true;
}

//display correct sprite while jumping
if bJumping == true
{
	if phy_linear_velocity_y <= 0
		sprite_index = sprJump;
	if phy_linear_velocity_y > 0
		sprite_index = sprFall;
}

//display correct sprite while falling
if active == false && phy_linear_velocity_y > 0 && bOnGround == false
{
	sprite_index = sprFall;
}

/// END JUMP /// 

/// VARIABLES FOR PHYSICS ///
phys_x = phy_position_x
phys_y = phy_position_y

/// DEATH ///
if (objPlayerGrapple.y >= 1200) iCurrentHP = 0; 

if (iCurrentHP <= 0) 
{
	instance_destroy(objPlayerGrapple);
	room_goto(rmDeathScreen);
} 