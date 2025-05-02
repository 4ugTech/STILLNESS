var dist = point_distance(x, y, obj_player.x, obj_player.y)
	
	if (dist <= interaction_radius) {
	// draw interaction prompt
	draw_set_font(font_buttons);
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_halign(fa_left);
	draw_set_alpha(1);

	//if (((room == rm_spawn && next_room == rm_hallway) || (room == rm_hallway && next_room == rm_spawn)) && obj_player.has_spawn_key) {
	//	draw_text(x, y - 20, "Press E to open");
	//} else {
	//	draw_text(x, y - 20, "Door is locked!");
	//}
	
	if (room == rm_spawn) {
		if (obj_player.has_spawn_key) {
			draw_text(x, y - 20, "Press E to open");
		} else {
			draw_text(x, y - 20, "Door is locked!");
		}
	} else {
		draw_text(x, y - 20, "Press E to open");
	}
}


        

	