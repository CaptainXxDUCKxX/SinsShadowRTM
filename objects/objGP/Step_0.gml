/// Get this to work without the "repeat" function below first
// get the Rope to connect to APH, and THEN we add in the chain links

if(keyboard_check_pressed(vk_up))
{

	offset_y = 0;
	host = self;
	next_rope = instance_create_layer(x, y+offset_y, "Instances", objRope);

	attach = physics_joint_distance_create(host, next_rope, host.x, host.y, next_rope.x, next_rope.y, false);
	physics_joint_set_value(attach, phy_joint_damping_ratio, 1);
	physics_joint_set_value(attach, phy_joint_frequency, 10);

	with(next_rope)
	{
		parent = other.id;
	}

	repeat (5)
	{
		offset_y += 100;
		last_rope = next_rope; 
		next_rope = instance_create_layer(x, y + offset_y, "Instances", objRope);
		link = physics_joint_distance_create(last_rope, next_rope, last_rope.x, last_rope.y, next_rope.x, next_rope.y, false);
		physics_joint_set_value(link, phy_joint_damping_ratio, 1);
		physics_joint_set_value(link, phy_joint_frequency, 10);
	
		with(next_rope)
		{
			parent = other.last_rope;
		}
	}
	offset_y += 100;
//	last_rope = next_rope;
//	next_rope = instance_create_layer(x, y + offset_y, "Instances", objRope);
	link = physics_joint_distance_create(objRope, objAPH, objRope.x, objRope.y, objAPH.x, objAPH.y, false);
	physics_joint_set_value(link, phy_joint_damping_ratio, 1);
	physics_joint_set_value(link, phy_joint_frequency, 10);
	
	with(objAPH)
	{
		parent = objRope;
	}
}

if(keyboard_check_released(vk_up))
{
	instance_destroy(objRope);
}