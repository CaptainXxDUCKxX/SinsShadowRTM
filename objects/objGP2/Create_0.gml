host = self;

fixtureGP2 = physics_fixture_create();
physics_fixture_set_circle_shape(fixtureGP2, 5);
link1to2 = physics_joint_rope_create(host, objGP, host.x, host.y, objGP.x, objGP.y, 8, false);