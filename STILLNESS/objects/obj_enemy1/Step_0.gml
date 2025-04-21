// — Step Event —
if (instance_exists(obj_player)) 
{
    // 1) Aim at player
    image_angle = point_direction(x, y, obj_player.x, obj_player.y);

    // 2) If the player_still flag just flipped while counting down, rescale the remaining frames
    var curr_still = obj_game_handler.player_still;
    if (alarm[0] != -1 && curr_still != prev_still) {
        // figure out old vs. new rate
        var old_rate = prev_still ? slow_fire_rate : fast_fire_rate;
        var new_rate = curr_still  ? slow_fire_rate : fast_fire_rate;
        // scale remaining frames proportionally
        alarm[0] = alarm[0] * (new_rate / old_rate);
        // remember the new state
        prev_still = curr_still;
    }

    // 3) If out of aggro range and no timer is running, start one
    if (point_distance(x, y, obj_player.x, obj_player.y) <= aggro_dist) {
        if (alarm[0] == -1) {
            alarm[0]   = curr_still ? slow_fire_rate : fast_fire_rate;
            prev_still = curr_still;
        }
    }
}
