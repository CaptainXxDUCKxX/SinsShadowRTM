/// @description Insert description here
// You can write your code in this editor

if !position_empty((x - 78), (y - 26.5))
{
	//show_debug_message("Collision");
}
if position_empty((x - 78), (y - 26.5))
{
	//show_debug_message("No collision");
}

if !position_empty((x + 78), (y - 26.5))
{
	show_debug_message("Collision");
}
if position_empty((x + 78), (y - 26.5))
{
	show_debug_message("No collision");
}

//Ursa AI pathing

if iUrsaSpeed > 1
{
	image_xscale = 1;
	physics_apply_force(x, y, 400, 0);
	hspeed = 1.5;
	sprite_index = sprUrsaWalk;
}

if iUrsaSpeed < 1
{
	image_xscale = -1;
	physics_apply_force(x, y, -400, 0);
	hspeed = -5;
	sprite_index = sprUrsaWalk;
}


//Timer countdown
if bCanAttack == false
	{                     
		tAttackRefresh -= 1;
	}
	
//Attack refresh
if tAttackRefresh <= 0
	{
		sprite_index = sprUrsaAttack
		bCanAttack = true;
		tAttackRefresh = 180;
	}



//This makese the Ursa flip when it switches it's position.	
if (x < iPrevFrameX)
	{
	image_xscale = -1;
	}
else if (x > iPrevFrameX)
	{
	image_xscale = 1;
	}
iPrevFrameX = x;
