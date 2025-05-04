if(instance_exists(obj_player))
{
	draw_self()
	if(point_distance(x, y, obj_player.x, obj_player.y) < 30)
	{
		// draw interaction prompt
		draw_set_alpha(1);	
		draw_set_font(font_buttons);
		draw_set_color(c_white);
		draw_set_halign(fa_center);
		draw_text(x, y - 20, "Press E to pick up");
		draw_set_halign(fa_left);

	}
}