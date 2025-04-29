if (is_being_read) {
    draw_set_alpha(0.9);
    draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
    
    // Draw paper
    draw_set_alpha(1);
    var margin = 100;
    draw_rectangle_color(margin, margin, display_get_gui_width() - margin, display_get_gui_height() - margin, c_ltgray, c_ltgray, c_ltgray, c_ltgray, false);
    
    draw_set_alpha(1);
    
    draw_set_font(font_title);
    draw_set_color(c_maroon);
    draw_set_halign(fa_center);
    draw_text(display_get_gui_width() / 2, 150, note_title);
    
    draw_set_font(font_buttons);
    draw_set_color(c_maroon);
    draw_text_ext(display_get_gui_width() / 2, 250, note_content, 30, display_get_gui_width() * 0.7);
    
    draw_set_color(c_white);
    draw_text(display_get_gui_width() / 2, display_get_gui_height() - 50, "PRESS ESC OR E TO CLOSE");
    
    // Reset alignment
    draw_set_halign(fa_left);
}