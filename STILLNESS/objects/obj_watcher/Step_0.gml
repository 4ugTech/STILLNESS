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
if(image_index == 7 && sprite_index == spr_watcher_idle)
{
	idle_anim_done = true	
}

dist_to_player = point_distance(x, y, player.x, player.y)

switch(state)
{
	case 0:
		break
	
	case 1: 
		if(has_aggroed == false && idle_anim_done)
		{
			has_aggroed = true
			alarm[0] = 120
		}
		break
	case 2:
		if(instance_exists(obj_player))
		{	
			
			direction = point_direction(x, y, obj_player.x, obj_player.y)
			//change move speed depending on time slow
			if(cutscene_done)
			{
				if(obj_game_handler.player_still == true)
				{
					speed = slow_speed
					image_speed = 1/10
				}	
				else
				{
					speed = fast_speed
					image_speed = 1
				}
			}
			
		
			//Face the player
			if(dist_to_player > 5) //So that the image doesn't constantly flip back and forth when on top of player
			{
				if (direction > 45 && direction < 270)
			    {
					image_xscale = -1
			    }
			    else
				{
					image_xscale = 1	
				}
			}
			else
			{
				speed = 0
			}
		}
		
}