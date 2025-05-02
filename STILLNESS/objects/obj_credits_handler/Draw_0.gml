draw_set_font(font_title);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Draw CREDITS title at the top
draw_set_color(title_color);
draw_text(room_width/2, 100, title);
draw_set_color(c_white);

// Draw production company
draw_set_font(font_buttons);
draw_text(room_width/2, 170, "An AugTech Production");

// Draw credits for different roles
var y_pos = 240;
var role_spacing = 80;

// Design & Direction
draw_set_font(font_buttons);
draw_text(room_width/2, y_pos, "Designed & Directed by");
draw_set_font(font_buttons);
draw_text(room_width/2, y_pos + 30, "Kevin Arellano");

// Programming
y_pos += role_spacing;
draw_set_font(font_buttons);
draw_text(room_width/2, y_pos, "Programmed by");
draw_set_font(font_buttons);
draw_text(room_width/2, y_pos + 30, "Gavin Sacek-Brooks");

// Art & Music
y_pos += role_spacing;
draw_set_font(font_buttons);
draw_text(room_width/2, y_pos, "Art & Music by");
draw_set_font(font_buttons);
draw_text(room_width/2, y_pos + 30, "Tejas Kotla");

// Production
y_pos += role_spacing;
draw_set_font(font_buttons);
draw_text(room_width/2, y_pos, "Produced by");
draw_set_font(font_buttons);
draw_text(room_width/2, y_pos + 30, "Akshar Sharma");

// Reset alignment
draw_set_halign(fa_left);
draw_set_valign(fa_top);