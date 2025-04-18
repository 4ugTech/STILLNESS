
//Handle horizontal movement
if(keyboard_check(ord("A")) && keyboard_check(ord("D")))
{
	moving_right = false
	moving_left = false
	hspeed = 0
}
else if(keyboard_check(ord("D")))
{	
	moving_right = true
	moving_left = false
	hspeed = move_speed	
}
else if(keyboard_check(ord("A")))
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
if(keyboard_check(ord("W")) && keyboard_check(ord("S")))
{
	vspeed = 0
}
else if(keyboard_check(ord("W")))
{
	vspeed = -move_speed
}
else if(keyboard_check(ord("S")))
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

image_angle = point_direction(x, y, mouse_x, mouse_y)
