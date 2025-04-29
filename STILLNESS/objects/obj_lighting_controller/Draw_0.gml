if (!surface_exists(darkness_surface)) {
    darkness_surface = surface_create(room_width, room_height);
}

var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

surface_set_target(darkness_surface);
draw_clear_alpha(c_black, darkness_alpha);

gpu_set_blendmode(bm_subtract);

if (instance_exists(obj_player)) {
    draw_circle(obj_player.x - cam_x, obj_player.y - cam_y, 30, false);
    
    if (obj_player.flashlight_on && obj_player.flashlight_battery > 0) {
        var dir = obj_player.image_angle;
        var light_radius = obj_player.flashlight_radius;
        var cone_width = obj_player.flashlight_angle;
        
        draw_set_color(c_white);
        draw_primitive_begin(pr_trianglefan);
        draw_vertex(obj_player.x - cam_x, obj_player.y - cam_y);
        
        for(var i = -cone_width; i <= cone_width; i += 5) {
            var angle = dir + i;
            var xx = obj_player.x - cam_x + lengthdir_x(light_radius, angle);
            var yy = obj_player.y - cam_y + lengthdir_y(light_radius, angle);
            draw_vertex(xx, yy);
        }
        draw_primitive_end();
    }
}

gpu_set_blendmode(bm_normal);
surface_reset_target();

draw_surface(darkness_surface, cam_x, cam_y);