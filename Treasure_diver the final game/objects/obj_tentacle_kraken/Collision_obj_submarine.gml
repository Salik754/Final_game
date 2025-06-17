// obj_tentacle Collision Event with obj_submarine
if (!global.game_over) {
    other.hp = 0; // Reduce submarine HP to 0, if you want to be consistent
    other.sprite_index = spr_broken_sub; // Show broken sub sprite
    audio_play_sound(Sound7, 1, false); // Play explosion/death sound
    global.game_over = true; // Trigger YOU DIED menu/UI
    // DO NOT call instance_destroy(other) here!
}