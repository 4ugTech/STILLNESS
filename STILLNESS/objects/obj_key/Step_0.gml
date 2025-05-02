var dist = point_distance(x, y, obj_player.x, obj_player.y);
        
if (dist <= interaction_radius && keyboard_check_pressed(ord("E"))) {
	// Add to inventory instead of setting the flag directly
	if (instance_exists(obj_inventory)) {
		if (obj_inventory.add_item(ItemType.KEY)) {
			obj_player.has_spawn_key = true;
			instance_destroy();
		}
	} else {
		// Fallback if inventory doesn't exist
		obj_player.has_spawn_key = true;
		instance_destroy();
	}
}