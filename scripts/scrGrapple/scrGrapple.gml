///// Grapple functionality /////
// Grapple Functions perfectly in this code. 
// There is no reason why this shouldn't work

// these variables are for the Chain Link
offset_y = 0;
next_rope = instance_create_layer(x, y, "Player", objRope);

/* 
/// this is just info that I want saved here to create the chain link rope thing
attach = physics_joint_distance_create(host, next_rope, host.x, host.y, next_rope.x, next_rope.y, false);
physics_joint_set_value(attach, phy_joint_damping_ratio, 1);
physics_joint_set_value(attach, phy_joint_frequency, 10);
*/



if(keyboard_check_pressed(vk_up)) && (instance_exists(objGrappleBlock)) && (distance_to_object(objGrappleBlock) < iGrappleRadius)
{
	bGrappling = true;
	instNearestGP = instance_nearest(x, y, objGrappleBlock);
	jointGrapple = physics_joint_rope_create(objPlayerGrapple, instNearestGP, (objPlayerGrapple.x + 9), (objPlayerGrapple.y - 41), instNearestGP.x, instNearestGP.y, 100, true); 
	bJumping = false;
}


if(keyboard_check_released(vk_up)) && (bGrappling == true) || (gamepad_button_check_released(0, gp_face3)) && (bGrappling == true)
{
	physics_joint_delete(jointGrapple);
	bGrappling = false;
}

/// MORE ACCURATE GRAPPLING /// 

/// Okay, I kind of have a closer grip on the accurate grapple functionality
// needs more refining; it's wonky, but not TERRIBLE
// not that great, but kinda cool

if(bGrappling == true) && objPlayerGrapple.x < instNearestGP.x
{	
	physics_apply_force(x, y, 350, 0);
	if(bGrappling == true) && objPlayerGrapple.x < instNearestGP.x && keyboard_check(ord("D"))
	{
		physics_apply_force(x, y, 370, 0);
	}
}

if(bGrappling == true) && objPlayerGrapple.x > instNearestGP.x
{
	physics_apply_force(x, y, -350, 0);
	if(bGrappling == true) && objPlayerGrapple.x > instNearestGP.x && keyboard_check(ord("A"))
	{
		physics_apply_force(x, y, -370, 0);
	}
}	
/// END ACCURATE GRAPPLING /// 

/// GRAPPLING TAKES STAMINA /// 
if(bGrappling == true)
{
	iCurrentStamina -= 0.5;
	if(iCurrentStamina <= 0)
	{
		bGrappling = false;
		physics_joint_delete(jointGrapple);
	}
}