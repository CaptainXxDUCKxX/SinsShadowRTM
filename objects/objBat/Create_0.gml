randomize();

//variables 


hit = 0;
hspeed = 0;
vspeed = 0; 

batHP = 5; 

// Bat's Pathing && Speed
bBatDebugMode = 1;
bContinuePath = 1;
iBatDetectionRadius = 150;
iBatSpeed = 2.25;
iBatXRetreatLeft = 0;
iBatYRetreat = 0;
iBatXRetreatRight = 0;
iDirToRetreat = 0;
bRetreatPointPicked = false;
iBatRetreatChosenX = 0;
iBatRetreatChosenY = 0;


// Bat's Damage Variables and Timer
iBatDamage = 10;
bCanAttack = true;
tAttackRefresh = 180;

// Bat's Direction...?
dirToPlayer = 0;
iPrevFrameX = 0;
path_start(pathEnemyBat, iBatSpeed, path_action_restart, 0);
 

// Bat's sound effects
tBatNoise = random_range(180, 420);
iBatNoiseRadius = 256;

lootDrop = 0;
