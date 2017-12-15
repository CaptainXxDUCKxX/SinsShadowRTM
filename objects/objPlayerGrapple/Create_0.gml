 ///////CREATE\\\\\\\\

// GRAPPLE VARIABLES 
bGrappling = false;
iGrappleRadius = 150;
instNearestGP = objGrappleBlock; 

// PHYSICS VARIABLES
fixtureAmelia = physics_fixture_create();
jointGrapple = pointer_null;
physics_fixture_set_circle_shape(fixtureAmelia, 5);

phy_rotation = 0;
phy_fixed_rotation = true;

// ATTACK VARIABLES
bAttacking = false;
iAttackTimer = 2;
alarm[2] = iAttackTimer;

iPrevFrameX = 0;

// HP
iCurrentHP = 100;
iMaxHP = 100;

//Stamina
iCurrentStamina = 100;
iMaxStamina = 100;

// TAKE DAMAGE
tDmgBuffer = 180;
bCanTakeDamage = false;
iDamageBuffer = 60;
alarm[0] = iDamageBuffer;
bGotHit = 0;


// DEATH BUFFER 
tDeathBuffer = 180;

// JUMPING PHYSICS VARIABLES 
bUnspaced = true; //is the spacebar being held down
bOnGround = false; //is Amelia on the ground
bJumpImpulseSwitch = true; //"true" meaning "can jump"
bJumping = false;
bAtJumpApex = false;

//physics collision
phys_x = phy_position_x
phys_y = phy_position_y

//Facing right
bFacingRight = true;
