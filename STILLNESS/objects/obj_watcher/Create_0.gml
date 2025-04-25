idle = true
chasing = false
still = false

state = 0 //0 = idle; 1 = aggro; 2 = chasing

cutscene_started = false
cutscene_done = false
has_aggroed = false

idle_anim_done = false

dist_to_player = point_distance(player.x, player.y, x, y)