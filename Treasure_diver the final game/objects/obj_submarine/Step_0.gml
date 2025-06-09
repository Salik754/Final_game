if (global.in_submarine) {
    var move_speed = 4;  // Movement speed

    if (keyboard_check(vk_up)) y -= move_speed;
    if (keyboard_check(vk_down)) y += move_speed;

    if (keyboard_check(vk_right)) {
        x += move_speed;
        sprite_index = spr_sub_right;  // right-facing sub sprite
        image_xscale = 1;
    }
    else if (keyboard_check(vk_left)) {
        x -= move_speed;
        sprite_index = spr_sub_left;   // left-facing sub sprite
        image_xscale = 1;
    }

    // Consume fuel
    my_fuel -= 0.1;
    if (my_fuel <= 0) {
        my_fuel = 0;
        // TODO: handle submarine out of fuel / death here
    }

    // Left-click shooting
    if (mouse_check_button_pressed(mb_left)) {
        var b = instance_create_layer(x, y, "Instances", obj_bullet);
        b.direction = image_xscale == 1 ? 0 : 180;
        b.speed = 10;
    }
}
