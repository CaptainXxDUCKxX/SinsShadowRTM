/// Creating a pendulum swing rope just like Amelia has with OG Grapple Point 
// but have it activate ONLY when she iniaites grappling 

if(objPlayerGrapple.bGrappling == true)
{
	jointGrapple2 = physics_joint_rope_create(objPlayerGrapple, instNearestGP, (objPlayerGrapple.x + 9), (objPlayerGrapple.y - 41), instNearestGP.x, instNearestGP.y, 100, true);
}	
