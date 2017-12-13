/// Collision with the player
// Damage Logic 
if (objPlayerGrapple.bCanTakeDamage == 1 && bCanAttack && bAttacking)
{
	bCanAttack = false;
	tAttackRefresh = 180;
	objPlayerGrapple.iCurrentHP -= iUrsaDamage;
	objPlayerGrapple.bCanTakeDamage = 0;
	objPlayerGrapple.bGotHit = 1;
}