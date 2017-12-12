///// Grapple functionality /////
// Grapple Functions perfectly in this code. 
// There is no reason why this shouldn't work
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

/// CHAIN LINK ///

/// Adding an if statement to try and add, when grappling, that same functionality 
// from the moving platform. So, this should center her, and players SHOULD 
// have to fight those forces being applied when she isn't centered 

/// It seems to be centering her to the left of the GrappleBlock; where the pendulum begins 
// Not too sure how to fix that, exactly; at least not in a logical way...
if(bGrappling == true) && objPlayerGrapple.x < instNearestGP.x
{	
	physics_apply_force(x, y, 250, 0);
}

if(bGrappling == true) && objPlayerGrapple.x > instNearestGP.x
{
	physics_apply_force(x, y, -250, 0);
}