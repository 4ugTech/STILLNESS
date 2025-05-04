if(instance_exists(obj_player))
{
	var dist = point_distance(x, y, obj_player.x, obj_player.y);
	
	if (dist <= interaction_radius) {
	    // Draw interaction prompt
	    draw_set_font(font_buttons);
	    draw_set_color(c_white);
	    draw_set_halign(fa_center);
    
	    
	  
	    draw_text(x, y - 20, "Press E to open");
	  
    
	    draw_set_halign(fa_left);
	}
}

