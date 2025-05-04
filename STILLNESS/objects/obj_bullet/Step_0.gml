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
    speed = 10    
}

// Check for collision with walls/tiles
// Use the same tilemap references that the player uses to avoid phasing through walls
if (instance_exists(obj_player)) {
    var tilemap_lab1 = obj_player.tilemap_lab1;
    var tilemap_hopsital = obj_player.tilemap_hopsital;
    var tilemap_hopsital_alt = obj_player.tilemap_hopsital_alt;
    var tilemap_wall1 = obj_player.tilemap_wall1;
    
    // Check if bullet is colliding with any tile
    if (place_meeting(x, y, [tilemap_lab1, tilemap_hopsital, tilemap_hopsital_alt, tilemap_wall1])) {
        instance_destroy();
    }
}