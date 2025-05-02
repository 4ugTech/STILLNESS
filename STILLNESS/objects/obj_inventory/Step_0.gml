// Handle keyboard input for inventory

// Cycle through inventory slots with number keys 1-5
for (var i = 0; i < array_length(inventory); i++) {
    if (keyboard_check_pressed(ord("1") + i)) {
        selected_slot = i;
    }
}


// Use selected item with Q key
if (keyboard_check_pressed(ord("Q"))) {
    use_selected_item();
}