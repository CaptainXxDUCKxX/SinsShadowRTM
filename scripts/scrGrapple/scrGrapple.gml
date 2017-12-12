///// Grapple functionality /////
// Grapple Functions perfectly in this code. 
// There is no reason why this shouldn't work
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

/// Adding an if statement to try and add, when grappling, that same functionality 
// from the moving platform. So, this should center her, and players SHOULD 
// have to fight those forces being applied when she isn't centered 

/// It seems to be centering her to the left of the GrappleBlock; where the pendulum begins 
// Not too sure how to fix that, exactly; at least not in a logical way...
if(bGrappling == true) && objPlayerGrapple.x < instNearestGP.x
{	
	physics_apply_force(x, y, 200, 0);
}

if(bGrappling == true) && objPlayerGrapple.x > instNearestGP.x
{
	physics_apply_force(x, y, -200, 0);
}