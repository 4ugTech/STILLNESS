// Pause handling
if (instance_exists(obj_game_handler) && obj_game_handler.game_paused) {
    // Remember current speed and image_speed
    if (speed != 0) {
        prev_speed = speed;
        prev_image_speed = image_speed;
        speed = 0;
        image_speed = 0;
    }
    return; // Skip the rest of the step event
} else {
    // Restore previous speed if we were paused
    if (variable_instance_exists(id, "prev_speed")) {
        speed = prev_speed;
        image_speed = prev_image_speed;
        prev_speed = 0;
        prev_image_speed = 0;
    }
}

// Original step event code
if(instance_exists(obj_player))
{

	var player = obj_player
	
	// Calculate direction from player to the target
	var dir_to_target = point_direction(player.x, player.y, x, y);
    
	// Calculate the difference between the flashlight direction and target direction
	var angle_diff = angle_difference(player.image_angle, dir_to_target);
    
	// Get the distance between player and target
	var dist_to_target = point_distance(player.x, player.y, x, y);
    
	// Check if target is within the flashlight's cone and range
	if((abs(angle_diff) <= player.flashlight_angle && dist_to_target <= player.flashlight_radius + 10) && player.flashlight_on == true) 
	{
	    in_darkness = false
	}
	else
	{
		in_darkness = true	
	}
	
	if(in_darkness)
	{
		speed = fast_speed
	}
	else
	{
		speed = 0	
	}
	direction = point_direction(x, y, player.x, player.y)
	
	if(obj_game_handler.player_still && in_darkness)
	{
		speed = slow_speed
	}
}