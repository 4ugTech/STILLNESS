if(instance_exists(obj_player))
{
	if(obj_player.vspeed == 0 && obj_player.hspeed == 0)
	{
		player_still = true	
	}
	else
	{
		player_still = false	
	}
}

// Handle screen shake
if (shake) {
    shake_time -= 1;
    
    var cam_x = camera_get_view_x(cam);
    var cam_y = camera_get_view_y(cam);
    
    // Apply random offset based on shake magnitude
    if (shake_time > 0) {
        var shake_x = random_range(-shake_magnitude, shake_magnitude);
        var shake_y = random_range(-shake_magnitude, shake_magnitude);
        camera_set_view_pos(cam, cam_x + shake_x, cam_y + shake_y);
    } else {
        // End shake
        shake = false;
    }
}

// win screen if all five enemies killed 
if (room == Room1 && !instance_exists(watcher)) {
	room_goto(rm_win_screen)
}

// switch to death screen on player death
// TO DO: Change Room1 name or room to a different one that will be the actual starting room
if (room == Room1 && !instance_exists(obj_player)) {
	room_goto(rm_death_screen)
}

//Trigger cutscene when player gets close to watcher
if(instance_exists(player) && instance_exists(watcher))
{
	
	var cam_w = camera_get_view_width(cam);
	var cam_h = camera_get_view_height(cam);
	
	if(camera_state == 0 && point_distance(player.x, player.y, watcher.x, watcher.y) < watcher.aggro_dist && watcher.cutscene_started == false)
	{
			watcher.cutscene_started = true
			camera_state = 1
			alarm[1] = 120
			alarm[0] = 600
	}
	
	switch(camera_state)
	{
		case 0: 
			break
			
		case 1:
			cam_w = camera_get_view_width(cam);
			cam_h = camera_get_view_height(cam);

			var target_x = watcher.x - cam_w / 2
			var target_y = watcher.y - cam_h / 2
			
			var new_x = lerp(camera_get_view_x(cam), target_x, 0.05)
			var new_y = lerp(camera_get_view_y(cam), target_y, 0.05)
			
			camera_set_view_pos(cam, new_x, new_y)
			break
		
		case 2:
			target_x = player.x - cam_w / 2
	        target_y = player.y - cam_h / 2
			
			new_x = lerp(camera_get_view_x(cam), target_x, 0.1)
			new_y = lerp(camera_get_view_y(cam), target_y, 0.1)
			
	        camera_set_view_pos(cam, new_x, new_y)
			
			if(abs(camera_get_view_x(cam) - target_x) < 1 && abs(camera_get_view_y(cam) - target_y) < 1)
            {
                camera_state = 0
                view_object[0] = player    // re-enable GM's built-in follow
            }
	}
}