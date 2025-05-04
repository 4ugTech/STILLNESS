if(instance_exists(obj_player))
{
	if(point_distance(x, y, obj_player.x, obj_player.y) < interaction_radius)
	{
		if(keyboard_check(ord("E")))
		{
			game_restart()
		}
	}
}