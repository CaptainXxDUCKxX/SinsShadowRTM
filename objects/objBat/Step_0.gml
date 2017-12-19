//Bat AI pathing
iBatXRetreatLeft = objPlayerGrapple.x - 300;
iBatXRetreatRight = objPlayerGrapple.x + 300;
iBatYRetreat = objPlayerGrapple.y - 80;


if instance_exists(objPlayerGrapple)
	{
	if (distance_to_object(objPlayerGrapple) < iBatDetectionRadius && bCanAttack == true && objPlayerGrapple.bCanTakeDamage == true)
		{
		bContinuePath = 0;
		path_end();
		dirToPlayer = point_direction(x,y,objPlayerGrapple.x, objPlayerGrapple.y-40);
		x += lengthdir_x(2,dirToPlayer);
		y += lengthdir_y(2,dirToPlayer);
		}
	else if bContinuePath == 0
		{
			if(bRetreatPointPicked == false)
			{
				iBatRetreatChosenX = choose(iBatXRetreatLeft, iBatXRetreatRight);
				iBatRetreatChosenY = iBatYRetreat; 
				bRetreatPointPicked = true;
			}
			if(distance_to_point(iBatRetreatChosenX, iBatRetreatChosenY) <= 5)
			{
				bContinuePath = 1;
				path_start(pathEnemyBat, iBatSpeed, path_action_continue, 0);
			}
			else
			{
				iDirToRetreat = point_direction(x,y,iBatRetreatChosenX, iBatRetreatChosenY);
				x += lengthdir_x(2,iDirToRetreat);
				y += lengthdir_y(2,iDirToRetreat);
			}
		}
	}

//Bat sound
tBatNoise -= 1;
if (distance_to_object(objPlayerGrapple) <= iBatNoiseRadius)
{
	if tBatNoise <= 0
	{
		tBatNoise = random_range(180, 420);
		audio_play_sound(sndBatNoise, 10, false);
	}
}

//Timer countdown
if bCanAttack == false
	{                     
		tAttackRefresh -= 1;
	}
	
//Attack refresh
if tAttackRefresh <= 0
	{
		bCanAttack = true;
		tAttackRefresh = 180;		
	}


//Bat taking damage and dying
hit = instance_place (x, y, objSwordHitbox);

if (hit != noone)
	{
	batHP -= 1; //BREAKING GAME
	audio_play_sound(sndSliceAttack, 5, false);
	effect_create_above(ef_explosion, x, y-1, 0.3, c_purple);
	//instance_destroy ();
	}
	
if(batHP <=0)
	{					   
		lootDrop = random(100)
		if(lootDrop >= 70)
		{
			instance_create_layer(x,y,"Player",objHealthPickUp);
		}
		instance_destroy();  
	} 
	
// This makese the Bat flip when it switches it's position // 
if (x < iPrevFrameX)
	{
	image_xscale = 1;
	}
else if (x > iPrevFrameX)
	{
	image_xscale = -1;
	}
iPrevFrameX = x;

// physics collision
if collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, objPlayerGrapple, false, true) != noone
{
	
	
	//damage logic
	if (objPlayerGrapple.bCanTakeDamage == 1 && bCanAttack == true)
		{
			audio_play_sound(sndBatAttack, 5, false);
			objPlayerGrapple.iCurrentHP -= iBatDamage;				
			objPlayerGrapple.bCanTakeDamage = 0;
			objPlayerGrapple.tDmgBuffer = 180;
			objPlayerGrapple.bGotHit = 1;
			effect_create_below(ef_firework, x, y-1, 0.1, c_red);
			bCanAttack = false;			
		}

}


//Debug messages
//show_debug_message(tAttackRefresh);