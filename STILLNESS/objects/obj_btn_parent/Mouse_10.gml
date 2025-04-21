// highlight button that is being hovered by showing a skull next to it
with (obj_btn_parent) {
    skull.image_alpha = (object_index == other.object_index) ? 1 : 0;
}

audio_play_sound(snd_btn_hover, 1, 0)