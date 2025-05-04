// Instantly snap the camera to the player
var cam = view_camera[0];
camera_set_view_pos(cam, obj_player.x - camera_get_view_width(cam) / 2, obj_player.y - camera_get_view_height(cam) / 2);

// get the current room's tile layers to prevent phasing
tilemap_lab1 = layer_tilemap_get_id("Tiles_lab1")
tilemap_hopsital = layer_tilemap_get_id("Tiles_hospital")
tilemap_hopsital_alt = layer_tilemap_get_id("Tiles_hospital_alt")
tilemap_wall1 = layer_tilemap_get_id("Tiles_wall1")