var dist = point_distance(x, y, obj_player.x, obj_player.y);
visible = false; // Hide by default

// Only show if within flashlight cone
if (instance_exists(obj_player) && obj_player.flashlight_on) {
    // Calculate direction from player to this item
    var dir_to_item = point_direction(obj_player.x, obj_player.y, x, y);
    
    // Calculate the difference between the flashlight direction and item direction
    var angle_diff = angle_difference(obj_player.image_angle, dir_to_item);
    
    // Check if item is within the flashlight's cone and range
    if (abs(angle_diff) <= obj_player.flashlight_angle && dist <= obj_player.flashlight_radius + 10) {
        visible = true;
    }
}
        
if (dist <= interaction_radius && visible) {
    glow_alpha = 0.5 + sin(current_time * 0.003) * 0.3;
    
    if (keyboard_check_pressed(ord("E"))) {
        // Add battery to inventory
        if (instance_exists(obj_inventory)) {
            if (obj_inventory.add_item(ItemType.BATTERY)) {
                // Mark as collected in global map
                if (!variable_global_exists("collected_items")) {
                    global.collected_items = ds_map_create();
                }
                
                var item_id = string(room_get_name(room)) + "_" + string(floor(x)) + "_" + string(floor(y));
                ds_map_set(global.collected_items, item_id, true);
                
                instance_destroy();
            }
        }
    }
} else {
    glow_alpha = 0;
}