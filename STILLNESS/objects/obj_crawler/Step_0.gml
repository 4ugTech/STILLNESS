/// — Step Event —

// A)  —— Generic alarm rescaling ——  
var curr_flag = obj_game_handler.player_still;

// Loop every possible alarm slot
for (var i = 0; i < max_alarms; i++) {
    var cfg = alarm_configs[i];
    // if this slot is used, running, and the mode just flipped…
    if (cfg != undefined 
     && alarm[i] != -1 
     && curr_flag != cfg.prev_flag) 
    {
        // compute old vs new rates
        var old_rate = cfg.prev_flag ? cfg.rate_true  : cfg.rate_false;
        var new_rate = curr_flag    ? cfg.rate_true  : cfg.rate_false;
        // rescale the remaining time
        alarm[i] *= (new_rate / old_rate);
        // remember the new mode
        cfg.prev_flag = curr_flag;
    }
}

// B)  —— Your chase logic ——  
still = curr_flag;  
if (instance_exists(obj_player)) {
    var dist_to_player = point_distance(x, y, obj_player.x, obj_player.y);
    if (dist_to_player < aggro_dist) {
        // face them
        direction = point_direction(x, y, obj_player.x, obj_player.y);

        if (idle) {
            idle        = false;
            sprite_index = aggro_sprite;
            // schedule Alarm[0] using the config we set up
            var cfg0 = alarm_configs[0];
            alarm[0]   = curr_flag ? cfg0.rate_true : cfg0.rate_false;
            cfg0.prev_flag = curr_flag;
        }
        else if (chasing) {
            scr_slow_down()
            if (curr_flag) {
                speed       = slow_speed;
                image_speed = 1/10;
            } else {
                speed       = fast_speed;
                image_speed = 1;
            }
        }

        // flip sprite
        if (dist_to_player > 5) {
            image_xscale = (direction > 45 && direction < 270) ? -1 : 1;
        } else {
            speed = 0;
        }
    }
}
