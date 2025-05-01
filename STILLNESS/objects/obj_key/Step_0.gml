var dist = point_distance(x, y, obj_player.x, obj_player.y);
        
if (dist <= interaction_radius && keyboard_check_pressed(ord("E"))) {
	obj_player.has_spawn_key = true;
	instance_destroy(obj_key);
}