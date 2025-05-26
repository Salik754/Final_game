// Only update if not paused and not dead
if (!global.paused && !is_dead) {

    // Movement variables
    var hsp = 0;
    var vsp = 0;

    // Movement input
    if (keyboard_check(vk_left))  hsp = -move_speed;
    else if (keyboard_check(vk_right)) hsp = move_speed;

    if (keyboard_check(vk_up))    vsp = -move_speed;
    else if (keyboard_check(vk_down)) vsp = move_speed;

    // Move player
    x += hsp;
    y += vsp;

    // Keep inside room
    x = clamp(x, 0, room_width);
    y = clamp(y, 0, room_height);

    // Change sprite based on horizontal movement
    if (hsp < 0) {
        sprite_index = spr_player_left;
    } else if (hsp > 0) {
        sprite_index = spr_player_right;
    }

    // Damage cooldown countdown
    if (damage_cooldown > 0) {
        damage_cooldown -= 1;
    }

    // Oxygen depletion over time (optional)
    oxygen -= 0.05;  // slow oxygen drain

    // Clamp oxygen so it never goes below 0 or above max
    oxygen = clamp(oxygen, 0, max_oxygen);

    // Check if oxygen ran out — trigger death
    if (oxygen <= 0) {
        is_dead = true;
        // You can add death animation or restart logic here
    }

} else if (is_dead) {
    // Player is dead - you can put death logic here (freeze movement, play animation, etc.)
}
