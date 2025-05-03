// Pause handling
if (instance_exists(obj_game_handler) && obj_game_handler.game_paused) {
    // Store current speed
    if (speed != 0) {
        prev_speed = speed;
        speed = 0;
    }
    return; // Skip the rest of the step event
} else {
    // Restore previous speed if we were paused
    if (variable_instance_exists(id, "prev_speed")) {
        speed = prev_speed;
        prev_speed = 0;
    }
}

// Original step event code
if(obj_game_handler.player_still == true)
{
	speed = 1
}
else
{
	speed = 15	
}