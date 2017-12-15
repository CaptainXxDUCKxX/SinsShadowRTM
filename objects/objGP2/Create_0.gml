/// GRAPPLE POINT VARIABLES ///

fixtureGP2 = physics_fixture_create();
physics_fixture_set_circle_shape(fixtureGP2, 5);
link1to2 = physics_joint_rope_create(objGP2, objGP, objGP.x, objGP.y, objGP2.x, objGP2.y, 8, false);