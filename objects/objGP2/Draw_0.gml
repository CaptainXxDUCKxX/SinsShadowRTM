/// DRAWING A LINE BETWEEN POINTS ///

draw_self();

// Draw a line from itself to the OG Grapple Point when Amelia initiates grappling 
if(objPlayerGrapple.bGrappling == true)
{
	draw_line_width_color(x, y, instNearestGP.x, instNearestGP.y, 3, c_navy, c_teal);
}