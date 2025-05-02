var dist = point_distance(x, y, obj_player.x, obj_player.y);
        
if (dist <= interaction_radius && keyboard_check_pressed(ord("E"))) {
    // Add to inventory instead of setting the flag directly
    if (instance_exists(obj_inventory)) {
        if (obj_inventory.add_item(ItemType.KEY)) {
            obj_player.has_spawn_key = true;
            
            // Create or update a global DS map to track collected items
            if (!variable_global_exists("collected_items")) {
                global.collected_items = ds_map_create();
            }
            
            // Store the item as collected using a unique identifier (room + x + y position)
            var item_id = string(room_get_name(room)) + "_" + string(floor(x)) + "_" + string(floor(y));
            ds_map_add(global.collected_items, item_id, true);
            
            instance_destroy();
        }
    } else {
        // Fallback if inventory doesn't exist
        obj_player.has_spawn_key = true;
        
        // Add to collected items tracking
        if (!variable_global_exists("collected_items")) {
            global.collected_items = ds_map_create();
        }
        var item_id = string(room_get_name(room)) + "_" + string(floor(x)) + "_" + string(floor(y));
        ds_map_add(global.collected_items, item_id, true);
        
        instance_destroy();
    }
}