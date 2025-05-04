window_set_fullscreen(true)

player_still = false
game_paused = false;

camera_state = 0 //0 = auto follow; 1 = enemy cutscene; 2 = return 
cutscene_timer = 0

cam = view_camera[0]

// Screen shake
shake = false
shake_time = 0
shake_magnitude = 0
shake_fade = 0.25

// Clean up any existing data structures
if (variable_global_exists("collected_items") && ds_exists(global.collected_items, ds_type_map)) {
    ds_map_destroy(global.collected_items);
}
global.collected_items = ds_map_create();

if (variable_global_exists("opened_doors") && ds_exists(global.opened_doors, ds_type_map)) {
    ds_map_destroy(global.opened_doors);
}
global.opened_doors = ds_map_create();