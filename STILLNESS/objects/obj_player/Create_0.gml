moving_right = false
moving_left = false
moving_up = false
moving_down = false

player_still = false

flashlight_on = false;
flashlight_battery = 100; // Battery percentage
flashlight_drain_rate = 0.05; // How quickly battery drains
flashlight_radius = 150; // How far the light reaches
flashlight_angle = 30; // Width of the light cone

max_stamina = 100;
stamina = max_stamina;
stamina_drain_rate = 0.5;  // How quickly stamina drains while moving
stamina_regen_rate = 0.3;  // How quickly stamina regenerates while still
exhausted = false;         // Flag for when player is out of stamina
exhausted_speed_multiplier = 0.3; // Movement speed multiplier when exhausted

if (room == rm_spawn) {
	has_spawn_key = false;
} else {
	has_spawn_key = true;
}

// referenced in step event to prevent phasing
tilemap_lab1 = layer_tilemap_get_id("Tiles_lab1")
tilemap_hopsital = layer_tilemap_get_id("Tiles_hospital")
tilemap_hopsital_alt = layer_tilemap_get_id("Tiles_hospital_alt")
tilemap_wall1 = layer_tilemap_get_id("Tiles_wall1")

