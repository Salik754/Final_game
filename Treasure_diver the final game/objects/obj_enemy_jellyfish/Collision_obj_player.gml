if (other.damage_cooldown <= 0) {
    other.oxygen -= 10;
    other.damage_cooldown = 60; // 1 second cooldown (assuming 60 FPS)
    // Optionally: audio_play_sound(snd_hurt, 1, false);
}