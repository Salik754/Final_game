if (!is_dead) {
    hp -= 1;
    if (hp <= 0) {
        is_dead = true;
        death_timer = room_speed * 5; // 5 seconds
        image_blend = c_gray;         // Turn gray
        image_alpha = 1;              // Start fully opaque
    } else {
        // Show health bar ONLY in second room
        if (room == room_shipwreck) {
            show_healthbar = true;
            healthbar_timer = HEALTHBAR_DISPLAY_TIME;
        }
    }
    with (other) instance_destroy();
}