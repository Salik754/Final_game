if (global.in_submarine) {
    var h = keyboard_check(ord("D")) - keyboard_check(ord("A"));
    var v = keyboard_check(ord("S")) - keyboard_check(ord("W"));
    h += keyboard_check(vk_right) - keyboard_check(vk_left);
    v += keyboard_check(vk_down) - keyboard_check(vk_up);

    if (h != 0 || v != 0) {
        x += h * move_speed;
        y += v * move_speed;

        // Sprite facing logic
        if (h < 0) {
            sprite_index = spr_sub_left;
            facing = -1;
        } else if (h > 0) {
            sprite_index = spr_sub_right;
            facing = 1;
        }
    }
}