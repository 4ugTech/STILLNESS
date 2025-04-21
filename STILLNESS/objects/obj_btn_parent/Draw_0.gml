draw_self()

draw_set_font(font_buttons)

// center align text around x and y 
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

// x and y will be wherever you place an instance in the room
draw_text(x, y, btn_text)

// done drawing, reset alignment to default
draw_set_halign(fa_left)
draw_set_valign(fa_top)
