///// Grapple functionality /////
// Grapple Functions perfectly in this code. 
// There is no reason why this shouldn't work

if(keyboard_check_pressed(vk_up)) && (instance_exists(objGrappleBlock)) && (distance_to_object(objGrappleBlock) < iGrappleRadius)
{
	active = true;
	instNearestGP = instance_nearest(x, y, objGrappleBlock);
	jointGrapple = physics_joint_rope_create(objPlayerGrapple, instNearestGP, (objPlayerGrapple.x + 9), (objPlayerGrapple.y - 41), instNearestGP.x, instNearestGP.y, 100, true); 
	bJumping = false;

	if(distance_to_object(objGrappleBlock) > iGrappleRadius) 
	{ 
		active = false;
	}
	
}

if(keyboard_check_released(vk_up)) && (active == true)
{
	physics_joint_delete(jointGrapple);
	active = false;
	
}