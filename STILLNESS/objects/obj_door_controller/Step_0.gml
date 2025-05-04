var dist = point_distance(x, y, obj_player.x, obj_player.y)
	
if (dist <= interaction_radius && keyboard_check_pressed(ord("E"))) {
    var can_open = false;
    var keycard_used = ItemType.NONE;
    
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
    
    // If door can be opened, consume the keycard if needed and proceed
    if (can_open) {
        // Use up the keycard if one was required
        if (keycard_used != ItemType.NONE && instance_exists(obj_inventory)) {
            obj_inventory.remove_item(keycard_used);
            // Play sound effect for using keycard (create this sound asset)
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