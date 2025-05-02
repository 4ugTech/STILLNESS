 // Check if this item was already collected
if (variable_global_exists("collected_items")) {
    var item_id = string(room_get_name(room)) + "_" + string(floor(x)) + "_" + string(floor(y));
    if (ds_map_exists(global.collected_items, item_id) && ds_map_find_value(global.collected_items, item_id) == true) {
        instance_destroy();
    }
}