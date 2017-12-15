 /// DRAW SELF AND GRAPPLE LINE 

draw_self(); 

if(bGrappling)
{
	instance_create_layer(x, y, "Player", objRope);
	//draw_line_width_color(x, y, instNearestGP.x, instNearestGP.y, 5, c_teal, c_teal);
}
