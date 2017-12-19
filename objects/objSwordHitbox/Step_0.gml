//HIT THAT BAT

hit = instance_place(x, y, objBat && objUrsa);

if (hit != noone)
	{
	hit.batHP -= 1;
	hit.ursaHP -=5;
	//instance_destroy ();
	}
	
 image_xscale = other.image_xscale; 
 
 
 /*
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
*/
