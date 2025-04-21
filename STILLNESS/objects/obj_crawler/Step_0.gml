if(instance_exists(obj_player))
{
	var dist_to_player = point_distance(x, y, obj_player.x, obj_player.y)
	if(dist_to_player < aggro_dist)
	{
		direction = point_direction(x, y, obj_player.x, obj_player.y)
		speed = move_speed
		sprite_index = aggro_sprite
		if (direction > 45 && direction < 270)
        {
			image_xscale = -1
        }
        else
		{
			image_xscale = 1	
		}
		
		if(dist_to_player < 5)
		{
			image_xscale = 1	
		}
	}
}