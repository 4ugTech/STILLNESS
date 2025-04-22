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

//if(!instance_exists(obj_player))
//{
//	if(keyboard_check_pressed(vk_space))
//	{
//		room_restart()	
//	}
//}

// win screen if all five enemies killed 
if (room == Room1 && !instance_exists(obj_enemy1)) {
	room_goto(rm_win_screen)
}

// switch to death screen on player death
// TO DO: Change Room1 name or room to a different one that will be the actual starting room
if (room == Room1 && !instance_exists(obj_player)) {
	room_goto(rm_death_screen)
}