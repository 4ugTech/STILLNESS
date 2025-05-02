if (global.show_hud) {
	// Draw stamina indicator
	var bar_width = 150;
	var bar_height = 15;
	var x_pos = 20;
	var y_pos = 20;

	// Background
	draw_set_color(c_gray);
	draw_rectangle(x_pos, y_pos, x_pos + bar_width, y_pos + bar_height, false);

	// Stamina level
	var stamina_percent = stamina / max_stamina;
	var bar_fill = bar_width * stamina_percent;

	// Choose color based on stamina level
	if (stamina_percent > 0.6) {
	    draw_set_color(c_lime);
	} else if (stamina_percent > 0.3) {
	    draw_set_color(c_yellow);
	} else {
	    draw_set_color(c_red);
	}

	draw_rectangle(x_pos, y_pos, x_pos + bar_fill, y_pos + bar_height, false);

	// Outline
	draw_set_color(c_white);
	draw_rectangle(x_pos, y_pos, x_pos + bar_width, y_pos + bar_height, true);

	// Label
	draw_set_font(font_buttons);
	draw_set_color(c_white);
	draw_text(x_pos, y_pos - 20, "STAMINA");

	// Draw exhausted indicator if player is exhausted
	if (exhausted) {
	    draw_set_color(c_red);
	    draw_text(x_pos + bar_width + 10, y_pos, "EXHAUSTED!");
	}

	// Draw battery indicator only if player has flashlight
	if (has_flashlight) {
	    y_pos = 60; // Position below stamina bar
    
	    // Background
	    draw_set_color(c_gray);
	    draw_rectangle(x_pos, y_pos, x_pos + bar_width, y_pos + bar_height, false);
    
	    // Battery level
	    var battery_percent = flashlight_battery / 100;
	    var bar_fill = bar_width * battery_percent;
    
	    // Choose color based on battery level
	    if (battery_percent > 0.6) {
	        draw_set_color(c_lime);
	    } else if (battery_percent > 0.3) {
	        draw_set_color(c_yellow);
	    } else {
	        draw_set_color(c_red);
	    }
    
	    draw_rectangle(x_pos, y_pos, x_pos + bar_fill, y_pos + bar_height, false);
    
	    // Outline
	    draw_set_color(c_white);
	    draw_rectangle(x_pos, y_pos, x_pos + bar_width, y_pos + bar_height, true);
    
	    // Label
	    draw_set_font(font_buttons);
	    draw_set_color(c_white);
	    draw_text(x_pos, y_pos - 20, "BATTERY");
    
	    // Show flashlight status
	    var status = flashlight_on ? "ON" : "OFF";
	    draw_text(x_pos + bar_width + 10, y_pos, "Flashlight: " + status);
	    draw_text(x_pos + bar_width + 10, y_pos + 20, "Press F to toggle");
	}
}

