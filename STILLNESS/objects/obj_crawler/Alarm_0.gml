/// — Alarm[0] Event —  
var cfg = alarm_configs[0];
if (cfg != undefined) {
    // run your custom callback
    script_execute(cfg.callback);
}
// reset so it can be re‑scheduled later
alarm[0] = -1;
