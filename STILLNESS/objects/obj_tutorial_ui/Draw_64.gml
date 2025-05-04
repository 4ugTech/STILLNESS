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
draw_text(x_offset, y_offset + 75, "E - Interact with objects/doors")
draw_text(x_offset, y_offset + 100, "F - Toggle flashlight (when found)")
draw_text(x_offset, y_offset + 125, "1-5 - Select inventory items")
draw_text(x_offset, y_offset + 150, "Q - Use selected item")
draw_text(x_offset, y_offset + 175, "Enemies move slower when you're still")
draw_text(x_offset, y_offset + 200, "Find keycards to unlock doors")
draw_text(x_offset, y_offset + 225, "Low on stamina? Find syringes")
draw_text(x_offset, y_offset + 250, "Low on battery? Find batteries")