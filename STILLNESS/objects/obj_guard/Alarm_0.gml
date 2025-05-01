var off_x = 16;
var off_y = -9;

var spawn_x = x + lengthdir_x(off_x, image_angle) + lengthdir_x(off_y, image_angle + 90);
var spawn_y = y + lengthdir_y(off_x, image_angle) + lengthdir_y(off_y, image_angle + 90);

instance_create_layer(spawn_x, spawn_y, "Bullets", obj_bullet)