if(obj_game_handler.camera_state != 1)
{
	// Stamina management
	var was_exhausted = exhausted;
	
	if(hspeed != 0 || vspeed != 0) {
		// Player is moving, drain stamina
		stamina -= stamina_drain_rate;
		if(stamina <= 0) {
			stamina = 0;
			exhausted = true;
			
			// Trigger screen shake when player first becomes exhausted
			if (!was_exhausted && exhausted) {
				start_shake(3, 15);
			}
		}
	} else {
		// Player is still, regenerate stamina
		stamina += stamina_regen_rate;
		if(stamina >= max_stamina) {
			stamina = max_stamina;
			exhausted = false;
		}
	}
	
	// Calculate current move speed based on stamina status
	var current_move_speed = move_speed;
	if(exhausted) {
		current_move_speed = move_speed * exhausted_speed_multiplier;
	}
	
	//Handle horizontal movement
	if(keyboard_check(ord("A")) && keyboard_check(ord("D")))
	{
		moving_right = false
		moving_left = false
		hspeed = 0
	}
	else if(keyboard_check(ord("D")) && !place_meeting(x + current_move_speed, y, [tilemap_lab1, tilemap_hopsital, tilemap_hopsital_alt, tilemap_wall1]))
	{	
		moving_right = true
		moving_left = false
		hspeed = current_move_speed	
	}
	else if(keyboard_check(ord("A")) && !place_meeting(x - current_move_speed, y, [tilemap_lab1, tilemap_hopsital, tilemap_hopsital_alt, tilemap_wall1]))
	{
		moving_left = true
		moving_right = false
		hspeed = -current_move_speed		
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
	else if(keyboard_check(ord("W")) && !place_meeting(x, y - current_move_speed, [tilemap_lab1, tilemap_hopsital, tilemap_hopsital_alt, tilemap_wall1]))
	{
		vspeed = -current_move_speed
	}
	else if(keyboard_check(ord("S")) && !place_meeting(x, y + current_move_speed, [tilemap_lab1, tilemap_hopsital, tilemap_hopsital_alt, tilemap_wall1]))
	{
		vspeed = current_move_speed
	}
	else
	{
		vspeed = 0
	}
	
	if(distance_to_object(obj_guard) < melee_dist)
	{
		if(keyboard_check_pressed(vk_space))
		{
			instance_destroy(instance_nearest(x, y, obj_guard))
		}
	}
	
	//Normalize diagonal movement speed
	if (hspeed != 0 && vspeed != 0) 
	{
	    hspeed *= 0.707;
	    vspeed *= 0.707;
	}
	
	image_angle = point_direction(x, y, mouse_x, mouse_y)
	
	if(flashlight_on)
	{
		sprite_index = spr_player_holding
		image_xscale = 2/3
		image_yscale = 2/3
	}
	else
	{
		sprite_index = spr_player	
		image_xscale = 1
		image_yscale = 1
	}
	
	// handle flashlight toggle
    if(keyboard_check_pressed(ord("F"))) 
	{
        flashlight_on = !flashlight_on;
		audio_play_sound(snd_flashlight, 1, 0)
    }
    // battery drain when on
    if(flashlight_on) 
	{
        flashlight_battery -= flashlight_drain_rate;
        if (flashlight_battery <= 0) 
		{
            flashlight_battery = 0;
            flashlight_on = false;
        }
    }
}
else
{
	speed = 0	
}