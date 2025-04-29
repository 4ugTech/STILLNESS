if (!is_being_read) {
    // check distance to player
    if (instance_exists(obj_player)) {
        var dist = point_distance(x, y, obj_player.x, obj_player.y);
        
        if (dist <= interaction_radius) {
            glow_alpha = 0.5 + sin(current_time * 0.003) * 0.3;
            
            if (keyboard_check_pressed(ord("E"))) {
                is_being_read = true;
                
                // pause game elements while reading
                with (obj_player) {
                    hspeed = 0;
                    vspeed = 0;
                };
            }
        } else {
            glow_alpha = 0;
        }
    }
} else {
    // note is being read - check for exit key
    if (keyboard_check_pressed(vk_escape) || keyboard_check_pressed(ord("E"))) {
        is_being_read = false;
    }
}