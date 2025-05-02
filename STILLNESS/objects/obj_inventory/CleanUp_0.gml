// Clean up the ds_maps to prevent memory leaks
if (variable_instance_exists(id, "item_properties") && ds_exists(item_properties, ds_type_map)) {
    ds_map_destroy(item_properties);
}

if (variable_instance_exists(id, "item_quantities") && ds_exists(item_quantities, ds_type_map)) {
    ds_map_destroy(item_quantities);
}
