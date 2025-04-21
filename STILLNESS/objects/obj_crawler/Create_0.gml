/// — Create Event —

// 1. How many alarms you might ever need (GM defaults to 12: alarm[0]…alarm[11])
max_alarms    = 12;

// 2. Array to hold each alarm’s configuration (or undefined if unused)
alarm_configs = array_create(max_alarms);

// 3. Your “mode” flag and helper to register alarms
mode_flag = obj_game_handler.player_still;

// 4. Register your Alarm[0] as your “start chasing” timer:
//    - waits 60 frames in slow‐time, 30 frames in fast‐time
scr_setup_alarm(0, 600, 60, scr_start_chase);

// 5. Your other gameplay variables:
idle       = true;
chasing    = false;

