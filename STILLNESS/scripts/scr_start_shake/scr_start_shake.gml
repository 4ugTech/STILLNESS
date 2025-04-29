function start_shake(magnitude, frames) {
    with (obj_game_handler) {
        shake = true;
        shake_magnitude = magnitude;
        shake_time = frames;
    }
}