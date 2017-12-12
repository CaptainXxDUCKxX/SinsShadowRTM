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
if bUrsaMoveRight && !bAttacking
{
	image_xscale = 1;
	physics_apply_force(x, y, 675, 0);
	sprite_index = sprUrsaWalk;
}
if !bUrsaMoveRight && !bAttacking
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
	}

if bUrsaMoveRight == false
{
	if collision_line((x - 40), (y - 27), (x - 256), (y - 27), objPlayerGrapple, false, true) > 0
	{
		bCanSee = true;
		//show_debug_message("Rawr.");
	}
	else
	{
		bCanSee = false;
		//show_debug_message("...");
	}
}
else if bUrsaMoveRight == true
{
	
	if collision_line((x + 40), (y - 27), (x + 256), (y - 27), objPlayerGrapple, false, true) > 0
	{
		bCanSee = true;
		//show_debug_message("Rawr.");
	}
	else
	{
		bCanSee = false;
		//show_debug_message("...");
	}
}

//Attack
if bCanSee && bCanAttack && distance_to_object(objPlayerGrapple) < 10
{
	bAttacking = true;
	sprite_index = sprUrsaAttack;
	image_index = 0;
	//image_speed = 1;
}

if sprite_index == sprUrsaAttack && image_index > 5.5
{
	bAttacking = false;
	sprite_index = sprUrsaWalk;
}

//debug
if sprite_index == sprUrsaAttack
{
	show_debug_message(image_index);
}