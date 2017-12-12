/// @description Insert description here
// You can write your code in this editor

///Ursa AI pathing
//Turn Ursa away from walls and gaps
if collision_point((x - 78), (y - 26.5), objCollisionPhys, false, true) || !collision_point((x - 100), (y + 15), objCollisionPhys, false, true)
{
	bUrsaMoveRight = true;
}
if collision_point((x + 78), (y - 26.5), objCollisionPhys, false, true) || !collision_point((x + 100), (y + 15), objCollisionPhys, false, true)
{
	bUrsaMoveRight = false;
}

//Make Ursa walk and face the direction she is facing
if bUrsaMoveRight == true 
{
	image_xscale = 1;
	physics_apply_force(x, y, 675, 0);
	sprite_index = sprUrsaWalk;
}
if bUrsaMoveRight == false 
{
	image_xscale = -1;
	physics_apply_force(x, y, -675, 0);
	sprite_index = sprUrsaWalk;
}

///Ursa Attacking
//Attack refresh timer
tAttackRefresh -= 1;
if tAttackRefresh <= 0
	{
		bCanAttack = true;
		tAttackRefresh = 180;
	}
if bUrsaMoveRight == false && bCanAttack == true
{
	if collision_line((x - 40), (y - 27), (x - 256), (y - 27), objPlayerGrapple, false, true) > 0
	{
		show_debug_message("Rawr.");
	}
	else
	{
		show_debug_message("...");
	}
}
else if bUrsaMoveRight == true && bCanAttack == true
{
	
	if collision_line((x + 40), (y - 27), (x + 256), (y - 27), objPlayerGrapple, false, true) > 0
	{
		show_debug_message("Rawr.");
	}
	else
	{
		show_debug_message("...");
	}
}