var dist = point_distance(x, y, obj_player.x, obj_player.y)
	
if (dist <= interaction_radius && keyboard_check_pressed(ord("E"))) {
	if (room == rm_spawn && next_room == rm_hallway && obj_player.has_spawn_key) {
		obj_player.x = 1030
		obj_player.y = 100
		room_goto(next_room)
	}
	
	if (room == rm_hallway && next_room == rm_spawn) {
		obj_player.x = 680
		obj_player.y = 700
		room_goto(next_room)
	}
	
	if (room == rm_hallway && next_room == rm_room1) {
		obj_player.x = 930
		obj_player.y = 1030
		room_goto(next_room)
	}
	
	if (room == rm_room1 && next_room == rm_hallway) {
		obj_player.x = 135
		obj_player.y = 100
		room_goto(next_room)
	}
	
	
	if (room == rm_hallway && next_room == rm_room3) {
		obj_player.x = 120
		obj_player.y = 670
		room_goto(next_room)
	}
	
	if (room == rm_room3 && next_room == rm_hallway) {
		obj_player.x = 135
		obj_player.y = 1032
		room_goto(next_room)
	}
	
	if (room == rm_hallway && next_room == rm_room4) {
		obj_player.x = 260
		obj_player.y = 1040
		room_goto(next_room)
	}
	
	if (room == rm_room4 && next_room == rm_hallway) {
		obj_player.x = 1030
		obj_player.y = 915
		room_goto(next_room)
	}
	
	if (room == rm_hallway && next_room == rm_win_screen) {
		global.show_hud = false
		global.should_destroy_player = true;
		
		room_goto(next_room)
	}
} 
        
