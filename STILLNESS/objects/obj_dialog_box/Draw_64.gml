if (is_being_read) {
    // Darken the background
    draw_set_alpha(0.9);
    draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
    
    // Calculate dialog box position
    var screen_width = display_get_gui_width();
    var screen_height = display_get_gui_height();
    
    var box_x1 = (screen_width - dialog_width) / 2;
    var box_y1 = (screen_height - dialog_height) / 2;
    var box_x2 = box_x1 + dialog_width;
    var box_y2 = box_y1 + dialog_height;
    
    // Draw dialog box background
    draw_set_alpha(1);
    draw_rectangle_color(box_x1, box_y1, box_x2, box_y2, c_dkgray, c_dkgray, c_dkgray, c_dkgray, false);
    draw_rectangle_color(box_x1 + 5, box_y1 + 5, box_x2 - 5, box_y2 - 5, c_gray, c_gray, c_gray, c_gray, false);
    
    // Draw title
    draw_set_font(font_title);
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    draw_text(screen_width / 2, box_y1 + content_padding, dialog_title);
    
    // Draw dialog content
    draw_set_font(font_buttons);
    draw_set_color(c_white);
    draw_set_valign(fa_top);
    draw_text_ext(screen_width / 2, box_y1 + content_padding * 3 + string_height(dialog_title), dialog_text, 30, dialog_width - content_padding * 2);
    
    // Draw close instruction
    draw_set_color(c_yellow);
    draw_text(screen_width / 2, box_y2 - content_padding - string_height("PRESS ESC OR E TO CLOSE"), "PRESS ESC OR E TO CLOSE");
    
    // Reset alignment
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}