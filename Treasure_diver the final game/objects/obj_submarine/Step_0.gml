if (global.paused) exit;

if (global.in_submarine) {
    var move_speed = 4;

    // Movement
    if (keyboard_check(vk_up)) y -= move_speed;
    if (keyboard_check(vk_down)) y += move_speed;

    if (keyboard_check(vk_right)) {
        x += move_speed;
        sprite_index = spr_sub_right;
    }
    else if (keyboard_check(vk_left)) {
        x -= move_speed;
        sprite_index = spr_sub_left;
    }

    // --- CLAMP HERE! ---
    var spr_w = sprite_get_width(sprite_index);
    var spr_h = sprite_get_height(sprite_index);
    x = clamp(x, spr_w / 10, room_width  - spr_w / 10);
    y = clamp(y, spr_h / 8, room_height - spr_h / 8);

    // Fuel consumption
    my_fuel -= 0.1;
    if (my_fuel <= 0) {
        my_fuel = 0;
        // TODO: handle submarine out of fuel
    }

    // Shoot towards mouse
    if (mouse_check_button_pressed(mb_left)) {
        var b = instance_create_layer(x, y, "Instances", obj_bullet);
        var dir = point_direction(x, y, mouse_x, mouse_y);
        b.direction = dir;
        b.speed = 10;
    }
    if (sub_damage_cooldown > 0) {
        sub_damage_cooldown -= 1;
    }
    if (my_fuel <= 0 && !out_of_fuel) {
        out_of_fuel = true;
        my_fuel = 0; // Clamp to zero
    }
}