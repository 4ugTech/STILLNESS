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
    SYRINGE,
    KEY_GREEN,
    KEY_RED,
    KEY_YELLOW,
    KEY_BLACK
}

// Initialize inventory slots (5 slots)
inventory = array_create(5, ItemType.NONE);

// Track item quantities (how many of each item type we have)
item_quantities = ds_map_create();
ds_map_add(item_quantities, ItemType.KEY, 0);
ds_map_add(item_quantities, ItemType.FLASHLIGHT, 0);
ds_map_add(item_quantities, ItemType.BATTERY, 0);
ds_map_add(item_quantities, ItemType.SYRINGE, 0);
ds_map_add(item_quantities, ItemType.KEY_GREEN, 0);
ds_map_add(item_quantities, ItemType.KEY_RED, 0);
ds_map_add(item_quantities, ItemType.KEY_YELLOW, 0);
ds_map_add(item_quantities, ItemType.KEY_BLACK, 0);

// Item properties (display names, sprite index, etc.)
item_properties = ds_map_create();

// Define item properties
// Format: [display_name, sprite_index, description]
item_properties[? ItemType.NONE] = ["Empty", -1, "Empty slot"];
item_properties[? ItemType.KEY] = ["Key", spr_key, "A key that opens the hallway door"];
item_properties[? ItemType.FLASHLIGHT] = ["Flashlight", spr_flashlight, "Helps you see in the dark"];
item_properties[? ItemType.BATTERY] = ["Battery", spr_battery, "Recharges your flashlight (Press Q to use)"];
item_properties[? ItemType.SYRINGE] = ["Adrenaline", spr_syringe, "Instantly restores stamina (Press Q to use)"];
item_properties[? ItemType.KEY_GREEN] = ["Green Keycard", spr_keycard_green, "Access to North West Wing"];
item_properties[? ItemType.KEY_RED] = ["Red Keycard", spr_keycard_red, "Access to South West Wing"];
item_properties[? ItemType.KEY_YELLOW] = ["Yellow Keycard", spr_keycard_yellow, "Access to South East Wing "];
item_properties[? ItemType.KEY_BLACK] = ["Black Keycard", spr_keycard_black, "Access to Exit Door"];

// Currently selected slot
selected_slot = 0;

// UI properties
slot_width = 64;
slot_height = 64;
slot_padding = 10;
// CHANGED: Position in the top right of the screen
var margin = 20;
slot_start_x = display_get_gui_width() - ((slot_width + slot_padding) * array_length(inventory)) - margin;
slot_y = margin;

// Add item to inventory
// Returns true if added successfully, false if inventory is full
add_item = function(item_type) {
    // If item is already in inventory, just increase quantity
    for (var i = 0; i < array_length(inventory); i++) {
        if (inventory[i] == item_type) {
            ds_map_set(item_quantities, item_type, ds_map_find_value(item_quantities, item_type) + 1);
            return true;
        }
    }
    
    // If item is not in inventory yet, look for an empty slot
    for (var i = 0; i < array_length(inventory); i++) {
        if (inventory[i] == ItemType.NONE) {
            inventory[i] = item_type;
            ds_map_set(item_quantities, item_type, 1); // First one of this item type
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
            var quantity = ds_map_find_value(item_quantities, item_type);
            if (quantity > 1) {
                // Reduce quantity
                ds_map_set(item_quantities, item_type, quantity - 1);
                return true;
            } else {
                // Remove the item entirely
                inventory[i] = ItemType.NONE;
                ds_map_set(item_quantities, item_type, 0);
                return true;
            }
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
    return ds_map_find_value(item_quantities, item_type);
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
                remove_item(ItemType.BATTERY); // Use the remove_item function
            }
            break;
            
        case ItemType.SYRINGE:
            // Use syringe to restore stamina
            if (obj_player.stamina < obj_player.max_stamina) {
                obj_player.stamina = obj_player.max_stamina;
                obj_player.exhausted = false;
                remove_item(ItemType.SYRINGE); // Use the remove_item function
            }
            break;
            
        // Note: Keycards are used automatically when interacting with doors
    }
}