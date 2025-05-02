var dist = point_distance(x, y, obj_player.x, obj_player.y);
        
if (dist <= interaction_radius) {
    glow_alpha = 0.5 + sin(current_time * 0.003) * 0.3;
    
    if (keyboard_check_pressed(ord("E"))) {
        // Give flashlight to player
        if (instance_exists(obj_inventory)) {
            if (obj_inventory.add_item(ItemType.FLASHLIGHT)) {
                obj_player.has_flashlight = true;
                instance_destroy();
            }
        } else {
            // Fallback if inventory doesn't exist
            obj_player.has_flashlight = true;
            instance_destroy();
        }
    }
} else {
    glow_alpha = 0;
}
