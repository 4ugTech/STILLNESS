if(instance_exists(obj_player))
{
	draw_self();

	if (glow_alpha > 0) {
	    draw_set_alpha(glow_alpha);
	    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, glow_color, glow_alpha);
    
	    // draw interaction prompt
	    draw_set_font(font_buttons);
	    draw_set_color(c_white);
	    draw_set_halign(fa_center);
	    draw_text(x, y - 20, "Press E to pick up");
	    draw_set_halign(fa_left);
	    draw_set_alpha(1);
	}

	// Additionally show prompt when close enough, regardless of flashlight
	var dist = point_distance(x, y, obj_player.x, obj_player.y);
	if (dist <= interaction_radius && glow_alpha == 0) {
	    // draw interaction prompt
	    draw_set_font(font_buttons);
	    draw_set_color(c_white);
	    draw_set_halign(fa_center);
	    draw_text(x, y - 20, "Press E to pick up");
	    draw_set_halign(fa_left);
	}
}

