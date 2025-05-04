var dist = point_distance(x, y, obj_player.x, obj_player.y);

// Create a global map to track opened doors if it doesn't exist yet
if (!variable_global_exists("opened_doors")) {
    global.opened_doors = ds_map_create();
}

// Create a unique ID for this door based on room and door location
var door_id = string(room) + "_to_" + string(next_room);

if (dist <= interaction_radius && keyboard_check_pressed(ord("E"))) {
    var can_open = false;
    var keycard_used = ItemType.NONE;
    
    // Check if door was previously opened first
    if (ds_map_exists(global.opened_doors, door_id) && ds_map_find_value(global.opened_doors, door_id) == true) {
        can_open = true;
    }
    // Otherwise check access requirements
    else {
        // Check which keycard is needed for this door
        if (room == rm_spawn && next_room == rm_hallway) {
            // Exit from spawn room - requires basic keycard
            can_open = obj_player.has_spawn_key || (instance_exists(obj_inventory) && obj_inventory.has_item(ItemType.KEY));
            if (can_open && instance_exists(obj_inventory) && obj_inventory.has_item(ItemType.KEY)) {
                keycard_used = ItemType.KEY;
            }
        } 
        else if (room == rm_hallway && next_room == rm_spawn) {
            // No keycard needed to return to spawn room
            can_open = true;
        }
        else if (room == rm_hallway && next_room == rm_room1) {
            // Green keycard needed for Research Room
            can_open = instance_exists(obj_inventory) && obj_inventory.has_item(ItemType.KEY_GREEN);
            if (can_open) keycard_used = ItemType.KEY_GREEN;
        }
        else if (room == rm_room1 && next_room == rm_hallway) {
            // No keycard needed to return to hallway
            can_open = true;
        }
        else if (room == rm_hallway && next_room == rm_room3) {
            // Red keycard needed for Storage Room
            can_open = instance_exists(obj_inventory) && obj_inventory.has_item(ItemType.KEY_RED);
            if (can_open) keycard_used = ItemType.KEY_RED;
        }
        else if (room == rm_room3 && next_room == rm_hallway) {
            // No keycard needed to return to hallway
            can_open = true;
        }
        else if (room == rm_hallway && next_room == rm_room4) {
            // Yellow keycard needed for Patient Records
            can_open = instance_exists(obj_inventory) && obj_inventory.has_item(ItemType.KEY_YELLOW);
            if (can_open) keycard_used = ItemType.KEY_YELLOW;
        }
        else if (room == rm_room4 && next_room == rm_hallway) {
            // No keycard needed to return to hallway
            can_open = true;
        }
        else if (room == rm_hallway && next_room == rm_win_screen) {
            // Black keycard needed for final exit
            can_open = instance_exists(obj_inventory) && obj_inventory.has_item(ItemType.KEY_BLACK);
            if (can_open) keycard_used = ItemType.KEY_BLACK;
        }
    }
    
    // If door can be opened, consume the keycard if needed and proceed
    if (can_open) {
        // Mark this door as opened for future use
        ds_map_set(global.opened_doors, door_id, true);
        
        // Use up the keycard if one was required
        if (keycard_used != ItemType.NONE && instance_exists(obj_inventory)) {
            obj_inventory.remove_item(keycard_used);
            // Play sound effect for using keycard
            if (audio_exists(snd_keycard)) {
                audio_play_sound(snd_keycard, 1, 0);
            }
        }
        
        // Handle room transitions based on where the player is going
        if (room == rm_spawn && next_room == rm_hallway) {
            obj_player.x = 1030;
            obj_player.y = 100;
            room_goto(next_room);
        }
        
        else if (room == rm_hallway && next_room == rm_spawn) {
            obj_player.x = 680;
            obj_player.y = 700;
            room_goto(next_room);
        }
        
        else if (room == rm_hallway && next_room == rm_room1) {
            obj_player.x = 930;
            obj_player.y = 1030;
            room_goto(next_room);
        }
        
        else if (room == rm_room1 && next_room == rm_hallway) {
            obj_player.x = 135;
            obj_player.y = 100;
            room_goto(next_room);
        }
        
        else if (room == rm_hallway && next_room == rm_room3) {
            obj_player.x = 120;
            obj_player.y = 670;
            room_goto(next_room);
        }
        
        else if (room == rm_room3 && next_room == rm_hallway) {
            obj_player.x = 135;
            obj_player.y = 1032;
            room_goto(next_room);
        }
        
        else if (room == rm_hallway && next_room == rm_room4) {
            obj_player.x = 260;
            obj_player.y = 1040;
            room_goto(next_room);
        }
        
        else if (room == rm_room4 && next_room == rm_hallway) {
            obj_player.x = 1030;
            obj_player.y = 915;
            room_goto(next_room);
        }
        
        else if (room == rm_hallway && next_room == rm_win_screen) {
            global.show_hud = false;
            global.should_destroy_player = true;
            
            room_goto(next_room);
        }
    } else {
        // Door is locked, play locked sound effect
        if (audio_exists(snd_door_locked)) {
            audio_play_sound(snd_door_locked, 1, 0);
        }
    }
}

// Add text prompt to guide the player
if (dist <= interaction_radius) {
    // Default text
    var door_text = "Press E to open";
    
    // If the door was previously opened, it's always "Press E to open"
    if (!ds_map_exists(global.opened_doors, door_id) || ds_map_find_value(global.opened_doors, door_id) != true) {
        // Only check for locks if the door hasn't been opened before
        if (room == rm_spawn && next_room == rm_hallway) {
            if (!obj_player.has_spawn_key && !(instance_exists(obj_inventory) && obj_inventory.has_item(ItemType.KEY))) {
                door_text = "Locked! Needs Key";
            }
        }
        else if (room == rm_hallway && next_room == rm_room1) {
            if (!(instance_exists(obj_inventory) && obj_inventory.has_item(ItemType.KEY_GREEN))) {
                door_text = "Locked! Needs Green Keycard";
            }
        }
        else if (room == rm_hallway && next_room == rm_room3) {
            if (!(instance_exists(obj_inventory) && obj_inventory.has_item(ItemType.KEY_RED))) {
                door_text = "Locked! Needs Red Keycard";
            }
        }
        else if (room == rm_hallway && next_room == rm_room4) {
            if (!(instance_exists(obj_inventory) && obj_inventory.has_item(ItemType.KEY_YELLOW))) {
                door_text = "Locked! Needs Yellow Keycard";
            }
        }
        else if (room == rm_hallway && next_room == rm_win_screen) {
            if (!(instance_exists(obj_inventory) && obj_inventory.has_item(ItemType.KEY_BLACK))) {
                door_text = "Locked! Needs Black Keycard";
            }
        }
    }
    
    // Draw the prompt
    draw_set_font(font_buttons);
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_text(x, y - 20, door_text);
    draw_set_halign(fa_left);
}