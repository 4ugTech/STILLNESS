if (instance_exists(obj_player)) {
    // handle flashlight toggle
    if (keyboard_check_pressed(ord("F"))) {
        obj_player.flashlight_on = !obj_player.flashlight_on;
    }
    
    // battery drain when on
    if (obj_player.flashlight_on) {
        obj_player.flashlight_battery -= obj_player.flashlight_drain_rate;
        if (obj_player.flashlight_battery <= 0) {
            obj_player.flashlight_battery = 0;
            obj_player.flashlight_on = false;
        }
    }
}