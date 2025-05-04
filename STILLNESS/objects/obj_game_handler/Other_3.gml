// Cleanup global DS maps
if (variable_global_exists("collected_items")) {
    ds_map_destroy(global.collected_items);
}

if (variable_global_exists("opened_doors")) {
    ds_map_destroy(global.opened_doors);
}