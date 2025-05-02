// Set font and alignment
draw_set_font(font_buttons)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_white)

// Set position
var x_offset = 400
var y_offset = 32

draw_text(x_offset, y_offset, "WASD - Movement")
draw_text(x_offset, y_offset + 25, "Space - Kill Enemy")
draw_text(x_offset, y_offset + 50, "Standing still slows time")


