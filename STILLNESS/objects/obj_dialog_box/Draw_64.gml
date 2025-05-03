if (is_being_read) {
    draw_set_alpha(0.9);
    draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
    
    // Draw dialog box background
    draw_set_alpha(1);
    var margin = 50;
    draw_rectangle_color(margin, margin, display_get_gui_width() - margin, display_get_gui_height() - margin, c_dkgray, c_dkgray, c_dkgray, c_dkgray, false);
    draw_rectangle_color(margin + 5, margin + 5, display_get_gui_width() - margin - 5, display_get_gui_height() - margin - 5, c_gray, c_gray, c_gray, c_gray, false);
    
    draw_set_alpha(1);
    
    // Draw title
    draw_set_font(font_title);
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_text(display_get_gui_width() / 2, 150, dialog_title);
    
    // Draw dialog content
    draw_set_font(font_buttons);
    draw_set_color(c_white);
    draw_text_ext(display_get_gui_width() / 2, 250, dialog_text, 30, display_get_gui_width() * 0.7);
    
    // Draw close instruction
    draw_set_color(c_yellow);
    draw_text(display_get_gui_width() / 2, display_get_gui_height() - 50, "PRESS ESC OR E TO CLOSE");
    
    // Reset alignment
    draw_set_halign(fa_left);
}