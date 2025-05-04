//if(instance_exists(obj_player))
//{

//	var player = obj_player
	
//	// Calculate direction from player to the target
//	var dir_to_target = point_direction(player.x, player.y, x, y);
    
//	// Calculate the difference between the flashlight direction and target direction
//	var angle_diff = angle_difference(player.image_angle, dir_to_target);
    
//	// Get the distance between player and target
//	var dist_to_target = point_distance(player.x, player.y, x, y);
    
//	// Check if target is within the flashlight's cone and range
//	if((abs(angle_diff) <= player.flashlight_angle && dist_to_target <= player.flashlight_radius + 20) && player.flashlight_on == true) 
//	{
//	    dark = false
//	}
//	else
//	{
//		dark = true	
//	}
	
//	if(dark)
//	{
//		sprite_index = sprite_dark
//	}
//	else
//	{
//		sprite_index = sprite_light	
//	}
//}