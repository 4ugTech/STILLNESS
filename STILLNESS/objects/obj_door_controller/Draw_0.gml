var dist = point_distance(x, y, obj_player.x, obj_player.y);
	
if (dist <= interaction_radius) {
    // Draw interaction prompt
    draw_set_font(font_buttons);
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    
    // Determine what message to display
    var can_open = false;
    var keycard_needed = "";
    
    // Check which keycard is needed for this door
    if (room == rm_spawn && next_room == rm_hallway) {
        can_open = obj_player.has_spawn_key || (instance_exists(obj_inventory) && obj_inventory.has_item(ItemType.KEY));
        keycard_needed = "Keycard";
    } 
    else if (room == rm_hallway && next_room == rm_spawn) {
        can_open = true;
    }
    else if (room == rm_hallway && next_room == rm_room1) {
        can_open = instance_exists(obj_inventory) && obj_inventory.has_item(ItemType.KEY_GREEN);
        keycard_needed = "Green Keycard";
    }
    else if (room == rm_room1 && next_room == rm_hallway) {
        can_open = true;
    }
    else if (room == rm_hallway && next_room == rm_room3) {
        can_open = instance_exists(obj_inventory) && obj_inventory.has_item(ItemType.KEY_RED);
        keycard_needed = "Red Keycard";
    }
    else if (room == rm_room3 && next_room == rm_hallway) {
        can_open = true;
    }
    else if (room == rm_hallway && next_room == rm_room4) {
        can_open = instance_exists(obj_inventory) && obj_inventory.has_item(ItemType.KEY_YELLOW);
        keycard_needed = "Yellow Keycard";
    }
    else if (room == rm_room4 && next_room == rm_hallway) {
        can_open = true;
    }
    else if (room == rm_hallway && next_room == rm_win_screen) {
        can_open = instance_exists(obj_inventory) && obj_inventory.has_item(ItemType.KEY_BLACK);
        keycard_needed = "Black Keycard";
    }
    
    // Display appropriate message
    if (can_open) {
        draw_text(x, y - 20, "Press E to open");
    } else {
        draw_text(x, y - 20, "Locked! Needs " + keycard_needed);
    }
    
    draw_set_halign(fa_left);
}