// Submarine Step Event

if (active) {
    // Horizontal movement and sprite
    if (keyboard_check(vk_right)) {
        x += move_speed;
        sprite_index = spr_sub_right;
    } else if (keyboard_check(vk_left)) {
        x -= move_speed;
        sprite_index = spr_sub_left;
    }

    // Vertical movement
    if (keyboard_check(vk_up)) {
        y -= move_speed;
    } else if (keyboard_check(vk_down)) {
        y += move_speed;
    }

    // Clamp position to stay inside the room
    x = clamp(x, 0, room_width - sprite_width);
    y = clamp(y, 0, room_height - sprite_height);
}