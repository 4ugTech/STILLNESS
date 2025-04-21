if(instance_exists(obj_player))
{
	if(obj_player.vspeed == 0 && obj_player.hspeed == 0)
	{
		player_still = true	
	}
	else
	{
		player_still = false	
	}
}

if(!instance_exists(obj_player))
{
	if(keyboard_check_pressed(vk_space))
	{
		room_restart()	
	}
}