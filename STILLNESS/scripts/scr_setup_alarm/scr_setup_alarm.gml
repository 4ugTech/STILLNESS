function scr_setup_alarm(idx, rate_false, rate_true, callback_script) {
    alarm_configs[idx] = {
        rate_false: rate_false,    // frames when mode_flag == false
        rate_true:  rate_true,     // frames when mode_flag == true
        prev_flag:  mode_flag,     // remember which state we were in
        callback:   callback_script// script to run in Alarm[idx]
    };
}
