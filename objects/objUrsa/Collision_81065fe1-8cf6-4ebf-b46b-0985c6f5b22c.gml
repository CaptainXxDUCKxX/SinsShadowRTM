/// Collision with the player



// Damage Logic 
if (objPlayerGrapple.bCanTakeDamage == 1 && bCanAttack == true)
	{
	objPlayerGrapple.iCurrentHP -= iUrsaDamage;
	objPlayerGrapple.bCanTakeDamage = 0;
	objPlayerGrapple.bGotHit = 1;
}
bCanAttack = false;
