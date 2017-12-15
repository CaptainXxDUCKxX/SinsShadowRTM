 /// DRAW SELF AND GRAPPLE LINE 

draw_self(); 


if(bGrappling)
{
	/// Maybe this doesn't work in the draw event... 
	// instance_create_layer(x+10, y-25, "Player", objLink); /// Had a feeling this would be too easy /// 
	draw_line_width_color(x, y, instNearestGP.x, instNearestGP.y, 3, c_navy, c_teal);
}