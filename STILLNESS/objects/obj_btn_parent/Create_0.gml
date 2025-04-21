// All hover skulls invisible by default
skull = instance_create_layer(x + 69, y, "Skulls", obj_skull);
skull.image_alpha = 0;


// If this is the play button, make neighboring skull visible
if (object_index == obj_btn_play) {
    skull.image_alpha = 1;
}