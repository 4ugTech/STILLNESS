// Draw the inventory UI at the bottom of the screen

// Draw background for all slots
for (var i = 0; i < array_length(inventory); i++) {
    var slot_x = slot_start_x + (i * (slot_width + slot_padding));
    
    // Draw slot background (darker if selected)
    if (i == selected_slot) {
        draw_set_color(c_gray);
    } else {
        draw_set_color(c_dkgray);
    }
    
    draw_rectangle(slot_x, slot_y, slot_x + slot_width, slot_y + slot_height, false);
    
    // Draw slot border
    draw_set_color(c_white);
    draw_rectangle(slot_x, slot_y, slot_x + slot_width, slot_y + slot_height, true);
    
    // Draw slot number
    draw_set_font(font_buttons);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_text(slot_x + 5, slot_y + 5, string(i + 1));
    
    // Draw item if slot isn't empty
    if (inventory[i] != ItemType.NONE) {
        var item_info = item_properties[? inventory[i]];
        var item_sprite = item_info[1];
        
        if (sprite_exists(item_sprite)) {
            // Draw item sprite centered in slot
            var scale = min(
                (slot_width - 10) / sprite_get_width(item_sprite),
                (slot_height - 10) / sprite_get_height(item_sprite)
            );
            
            draw_sprite_ext(
                item_sprite, 
                0, 
                slot_x + slot_width/2, 
                slot_y + slot_height/2, 
                scale, scale, 
                0, 
                c_white, 
                1
            );
        }
        
        // If item is battery or syringe, draw a small number indicating quantity
        if (inventory[i] == ItemType.BATTERY || inventory[i] == ItemType.SYRINGE) {
            var count = count_item(inventory[i]);
            if (count > 1) {
                draw_set_color(c_white);
                draw_text(slot_x + slot_width - 15, slot_y + slot_height - 15, string(count));
            }
        }
    }
}

// Draw item description for selected slot
var selected_item = inventory[selected_slot];
if (selected_item != ItemType.NONE) {
    var item_info = item_properties[? selected_item];
    var item_name = item_info[0];
    var item_desc = item_info[2];
    
    // Draw name and description above the inventory bar
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_text(room_width/2, slot_y - 40, item_name);
    draw_set_halign(fa_center);
    draw_text(room_width/2, slot_y - 20, item_desc);
}