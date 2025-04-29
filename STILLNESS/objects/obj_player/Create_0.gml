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

tilemap_lab1 = layer_tilemap_get_id("Tiles_lab1")
tilemap_hopsital = layer_tilemap_get_id("Tiles_hospital")
tilemap_walls = layer_tilemap_get_id("Tiles_walls")