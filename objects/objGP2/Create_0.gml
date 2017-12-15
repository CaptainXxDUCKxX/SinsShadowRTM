/// CREATE ///
// This will be an invisible Grapple Object that Amelia will draw a line to
// once Amelia draws a line to this, it will draw a line to the OG Grapple Point 

host = self; // this is almost here for no reason but I also see no reason to delete it 

// giving it PlayerGrapple's Grapple variable //
instNearestGP = objGrappleBlock;

// Variables creating it as a fixture //
fixtureGP2 = physics_fixture_create();
physics_fixture_set_circle_shape(fixtureGP2, 5);