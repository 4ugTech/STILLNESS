if (visible) {
    draw_self();

    var dist = point_distance(x, y, obj_player.x, obj_player.y);
            
    if (dist <= interaction_radius) {
        // draw interaction prompt
        draw_set_font(font_buttons);
        draw_set_color(c_white);
        draw_set_halign(fa_center);
        draw_text(x, y - 20, "Press E to pickup");
        draw_set_halign(fa_left);
        draw_set_alpha(1);
    }
}