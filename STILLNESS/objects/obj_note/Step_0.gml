if (!is_being_read) {
    // Hide by default
    visible = false;
    
    // Only show if within flashlight cone
    if (instance_exists(obj_player) && obj_player.flashlight_on) {
        // Calculate direction from player to this item
        var dir_to_item = point_direction(obj_player.x, obj_player.y, x, y);
        
        // Calculate the difference between the flashlight direction and item direction
        var angle_diff = angle_difference(obj_player.image_angle, dir_to_item);
        
        // Get the distance between player and item
        var dist = point_distance(x, y, obj_player.x, obj_player.y);
        
        // Check if item is within the flashlight's cone and range
        if (abs(angle_diff) <= obj_player.flashlight_angle && dist <= obj_player.flashlight_radius + 10) {
            visible = true;
        }
    }
    
    // check distance to player
    if (instance_exists(obj_player) && visible) {
        var dist = point_distance(x, y, obj_player.x, obj_player.y);
        
        if (dist <= interaction_radius) {
            glow_alpha = 0.5 + sin(current_time * 0.003) * 0.3;
            
            if (keyboard_check_pressed(ord("E"))) {
                is_being_read = true;
                
                // Pause the game globally
                if (instance_exists(obj_game_handler)) {
                    obj_game_handler.game_paused = true;
                }
                
                // Ensure player is stopped
                with (obj_player) {
                    hspeed = 0;
                    vspeed = 0;
                }
            }
        } else {
            glow_alpha = 0;
        }
    } else {
        glow_alpha = 0;
    }
} else {
    visible = true; // Always show when being read
    
    // note is being read - check for exit key
    if (keyboard_check_pressed(vk_escape) || keyboard_check_pressed(ord("E"))) {
        is_being_read = false;
        
        // Unpause the game
        if (instance_exists(obj_game_handler)) {
            obj_game_handler.game_paused = false;
        }
    }
}