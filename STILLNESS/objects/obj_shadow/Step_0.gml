if(instance_exists(obj_player))
{
	var player = obj_player
	if(in_darkness)
	{
		direction = point_direction(x, y, player.x, player.y)
		speed = move_speed
	}
}
