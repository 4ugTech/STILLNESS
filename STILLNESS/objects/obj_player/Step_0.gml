
//Handle horizontal movement
if(keyboard_check(vk_left) && keyboard_check(vk_right))
{
	moving_right = false
	moving_left = false
	hspeed = 0
}
else if(keyboard_check(vk_right))
{	
	moving_right = true
	moving_left = false
	hspeed = move_speed	
}
else if(keyboard_check(vk_left))
{
	moving_left = true
	moving_right = false
	hspeed = -move_speed		
}
else
{	
	hspeed = 0
}

//Handle vertical movement
if(keyboard_check(vk_up) && keyboard_check(vk_down))
{
	vspeed = 0
}
else if(keyboard_check(vk_up))
{
	vspeed = -move_speed
}
else if(keyboard_check(vk_down))
{
	vspeed = move_speed
}
else
{
	vspeed = 0
}


//Normalize diagonal movement speed
if (hspeed != 0 && vspeed != 0) 
{
    hspeed *= 0.707;
    vspeed *= 0.707;
}

//image_angle = point_direction(x, y, mouse_x, mouse_y)