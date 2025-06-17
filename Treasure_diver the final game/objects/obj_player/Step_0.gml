// =======================
// obj_player STEP EVENT
// =======================

if (global.paused) exit;

// Damage cooldown timer
if (damage_cooldown > 0) {
    damage_cooldown -= 1;
}

// Movement
var hsp = (keyboard_check(vk_right) - keyboard_check(vk_left)) * move_speed;
var vsp = (keyboard_check(vk_down) - keyboard_check(vk_up)) * move_speed;
x += hsp;
y += vsp;

// Clamp the player within the room boundaries
x = clamp(x, 0, room_width - sprite_width);
y = clamp(y, 0, room_height - sprite_height);

// Sprite switching
if (hsp > 0) {
    sprite_index = spr_player_right;
} else if (hsp < 0) {
    sprite_index = spr_player_left;
}

// Oxygen drain
oxygen -= oxygen_deplete_rate;
if (oxygen < 0) oxygen = 0;

// Oxygen depletion (death and sound logic)
if (oxygen <= 0 && !oxygen_death) {
    oxygen_death = true; // set the flag ONLY here
    global.game_over = true; // Trigger UI overlay

    // Only play the sound ONCE on death
    audio_play_sound(Sound7, 1, false);
    // Do NOT call instance_destroy() here! Let the UI/game over handle restart logic.
}