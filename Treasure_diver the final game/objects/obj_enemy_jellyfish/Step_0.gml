// Jellyfish Step Event
if (global.paused) exit;

// Handle knockback
if (knockback_speed > 0) {
    x += lengthdir_x(knockback_speed, knockback_dir);
    y += lengthdir_y(knockback_speed, knockback_dir);
    knockback_speed *= 0.7; // Dampen
    if (knockback_speed < 1) knockback_speed = 0;
}

// Health bar timer (only in shipwreck room)
if (show_healthbar && room == room_shipwreck) {
    healthbar_timer -= 1;
    if (healthbar_timer <= 0) show_healthbar = false;
}

if (is_dead) {
    // Fade out after death
    image_alpha -= 1 / (5 * room_speed);
    if (image_alpha < 0) image_alpha = 0;
    death_timer -= 1;
    if (death_timer <= 0) instance_destroy();
} else if (room == room_shipwreck || room == final_level) {
    // Follow submarine in shipwreck and final_level rooms
    var target = instance_nearest(x, y, obj_submarine);
    if (target != noone) {
        var dir = point_direction(x, y, target.x, target.y);
        var dx = lengthdir_x(follow_speed, dir);
        var dy = lengthdir_y(follow_speed, dir);
        x += dx;
        y += dy;
    }
} else {
    // In other rooms (e.g., first room), patrol right/left as before
    x += hsp;
    if (place_meeting(x, y, obj_collision)) {
        x -= hsp;
        hsp = -hsp;
    }
    // Healthbar never shown in first room
    show_healthbar = false;
}