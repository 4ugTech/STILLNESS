var dist = point_distance(x, y, obj_player.x, obj_player.y);
        
if (dist <= interaction_radius) {
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