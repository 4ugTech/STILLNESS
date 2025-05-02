// Check if an instance already exists
if (instance_number(obj_inventory) > 1) {
    // If there's already an instance, destroy this one
    instance_destroy();
    exit;
}

// Initialize the inventory array
enum ItemType {
    NONE,
    KEY,
    FLASHLIGHT,
    BATTERY,
    SYRINGE
}

// Initialize inventory slots (5 slots)
inventory = array_create(5, ItemType.NONE);

// Item properties (display names, sprite index, etc.)
item_properties = ds_map_create();

// Define item properties
// Format: [display_name, sprite_index, description]
item_properties[? ItemType.NONE] = ["Empty", -1, "Empty slot"];
item_properties[? ItemType.KEY] = ["Keycard", spr_key, "A keycard that opens doors"];
item_properties[? ItemType.FLASHLIGHT] = ["Flashlight", spr_flashlight, "Helps you see in the dark"];
item_properties[? ItemType.BATTERY] = ["Battery", spr_battery, "Recharges your flashlight"];
item_properties[? ItemType.SYRINGE] = ["Adrenaline", spr_syringe, "Instantly restores stamina"];

// Currently selected slot
selected_slot = 0;

// UI properties
slot_width = 64;
slot_height = 64;
slot_padding = 10;
// Bottom left positioning (actual position set in Draw GUI event)
var margin = 20;
slot_start_x = margin;
slot_y = room_height - slot_height - margin;

// Add item to inventory
// Returns true if added successfully, false if inventory is full
add_item = function(item_type) {
    // Look for an empty slot
    for (var i = 0; i < array_length(inventory); i++) {
        if (inventory[i] == ItemType.NONE) {
            inventory[i] = item_type;
            // If this is the first item, select it
            if (i == 0 && selected_slot == 0) {
                selected_slot = i;
            }
            return true;
        }
    }
    return false; // Inventory full
}

// Remove item from inventory
remove_item = function(item_type) {
    for (var i = 0; i < array_length(inventory); i++) {
        if (inventory[i] == item_type) {
            inventory[i] = ItemType.NONE;
            return true;
        }
    }
    return false; // Item not found
}

// Check if inventory contains specific item
has_item = function(item_type) {
    for (var i = 0; i < array_length(inventory); i++) {
        if (inventory[i] == item_type) {
            return true;
        }
    }
    return false; // Item not found
}

// Get the number of a specific item in inventory
count_item = function(item_type) {
    var count = 0;
    for (var i = 0; i < array_length(inventory); i++) {
        if (inventory[i] == item_type) {
            count++;
        }
    }
    return count;
}

// Use selected item
use_selected_item = function() {
    var item_type = inventory[selected_slot];
    
    switch(item_type) {
        case ItemType.FLASHLIGHT:
            // Toggle flashlight
            obj_player.flashlight_on = !obj_player.flashlight_on;
            audio_play_sound(snd_flashlight, 1, 0);
            break;
            
        case ItemType.BATTERY:
            // Use battery to recharge flashlight
            if (obj_player.flashlight_battery < 100) {
                obj_player.flashlight_battery = 100;
                inventory[selected_slot] = ItemType.NONE; // Remove the battery after use
            }
            break;
            
        case ItemType.SYRINGE:
            // Use syringe to restore stamina
            if (obj_player.stamina < obj_player.max_stamina) {
                obj_player.stamina = obj_player.max_stamina;
                obj_player.exhausted = false;
                inventory[selected_slot] = ItemType.NONE; // Remove the syringe after use
            }
            break;
    }
}