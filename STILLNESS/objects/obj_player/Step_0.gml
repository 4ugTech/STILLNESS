if(obj_game_handler.camera_state != 1)
{
	//Handle horizontal movement
	if(keyboard_check(ord("A")) && keyboard_check(ord("D")))
	{
		moving_right = false
		moving_left = false
		hspeed = 0
	}
	else if(keyboard_check(ord("D")) && !place_meeting(x + move_speed, y, [tilemap_lab1, tilemap_hopsital, tilemap_walls]))
	{	
		moving_right = true
		moving_left = false
		hspeed = move_speed	
	}
	else if(keyboard_check(ord("A")) && !place_meeting(x - move_speed, y, [tilemap_lab1, tilemap_hopsital, tilemap_walls]))
	{
		moving_left = true
		moving_right = false
		hspeed = -move_speed		
	}
	else
	{	
		hspeed = 0
	}

	//Handle vertical movement
	if(keyboard_check(ord("W")) && keyboard_check(ord("S")))
	{
		vspeed = 0
	}
	else if(keyboard_check(ord("W")) && !place_meeting(x, y - move_speed, [tilemap_lab1, tilemap_hopsital, tilemap_walls]))
	{
		vspeed = -move_speed
	}
	else if(keyboard_check(ord("S")) && !place_meeting(x, y + move_speed, [tilemap_lab1, tilemap_hopsital, tilemap_walls]))
	{
		vspeed = move_speed
	}
	else
	{
		vspeed = 0
	}

	if(distance_to_object(obj_enemy1) < melee_dist)
	{
		if(keyboard_check_pressed(vk_space))
		{
			instance_destroy(instance_nearest(x, y, obj_enemy1))
		}
	}

	//Normalize diagonal movement speed
	if (hspeed != 0 && vspeed != 0) 
	{
	    hspeed *= 0.707;
	    vspeed *= 0.707;
	}

	image_angle = point_direction(x, y, mouse_x, mouse_y)
	
	
}
else
{
	speed = 0	
}


