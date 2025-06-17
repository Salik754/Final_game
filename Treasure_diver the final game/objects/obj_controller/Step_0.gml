// obj_controller > Step Event

// --- PAUSE TOGGLE SOUND ---
if (keyboard_check_pressed(ord("P"))) {
    global.paused = !global.paused;
    global.pause_selected = 0;
    audio_play_sound(snd_pause, 1, false); // Play pause/unpause sound
}

// Pause menu navigation and UI sounds
if (global.paused) {
    if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))) {
        global.pause_selected = max(0, global.pause_selected - 1);
        audio_play_sound(snd_select, 1, false); // Play menu move sound
    }
    if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))) {
        global.pause_selected = min(1, global.pause_selected + 1);
        audio_play_sound(snd_select, 1, false); // Play menu move sound
    }
    if (keyboard_check_pressed(vk_enter)) {
        audio_play_sound(snd_select, 1, false); // Play select/confirm sound
        if (global.pause_selected == 0) global.paused = false; // Resume
        if (global.pause_selected == 1) {
            global.paused = false;
            room_restart();
        }
    }
    exit;
}

// Store last oxygen for UI
if (instance_exists(obj_player)) {
    global.last_oxygen = obj_player.oxygen;
    global.last_max_oxygen = obj_player.max_oxygen;
}