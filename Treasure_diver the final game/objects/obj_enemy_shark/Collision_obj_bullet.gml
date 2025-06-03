if (!is_dead) {
    hp -= 1;
    if (hp <= 0) {
        is_dead = true;
        death_timer = room_speed * 5; // 5 seconds
        image_blend = c_gray;         // Turn gray
        image_alpha = 1;
        // Optionally: audio_play_sound(snd_shark_death, 1, false);
    } else {
        // Knockback away from bullet's position
        knockback_dir = point_direction(other.x, other.y, x, y);
        knockback_speed = 8; // Adjust for knockback strength

        // Show health bar
        show_healthbar = true;
        healthbar_timer = HEALTHBAR_DISPLAY_TIME;
    }
    with (other) instance_destroy();
}