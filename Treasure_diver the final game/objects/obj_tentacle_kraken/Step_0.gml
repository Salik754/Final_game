// obj_tentacle Step Event

// Move down
y += vspd;

// Destroy if off the bottom of the room
if (y > room_height) {
    instance_destroy();
}

// Check collision with submarine
if (instance_exists(obj_submarine)) {
    if (place_meeting(x, y, obj_submarine)) {
        // Set game over state instead of destroying sub
        global.game_over = true;

        // Optional: Play sound, animation, etc.
        // audio_play_sound(snd_explosion, 1, false);

        // Optionally, you can destroy the tentacle so it doesn't keep triggering
        instance_destroy();
    }
}