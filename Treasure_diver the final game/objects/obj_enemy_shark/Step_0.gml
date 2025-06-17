// Shark Step Event

if (global.paused) exit;

// Handle knockback first
if (knockback_speed > 0) {
    x += lengthdir_x(knockback_speed, knockback_dir);
    y += lengthdir_y(knockback_speed, knockback_dir);
    knockback_speed *= 0.7; // Damping
    if (knockback_speed < 1) knockback_speed = 0;
}

// Health bar timer
if (show_healthbar) {
    healthbar_timer -= 1;
    if (healthbar_timer <= 0) show_healthbar = false;
}

if (is_dead) {
    // Fade out after death
    image_alpha -= 1 / (5 * room_speed);
    if (image_alpha < 0) image_alpha = 0;
    death_timer -= 1;
    if (death_timer <= 0) instance_destroy();
} 
else {
    // Follow submarine in ANY room where shark is placed
    var target = instance_nearest(x, y, obj_submarine);
    if (target != noone) {
        var dir = point_direction(x, y, target.x, target.y);
        var spd = 2;
        var dx = lengthdir_x(spd, dir);
        var dy = lengthdir_y(spd, dir);
        x += dx;
        y += dy;

        // Sprite facing
        if (dx < 0) {
            sprite_index = spr_shark_left;
        } else {
            sprite_index = spr_shark_right;
        }
    }
}