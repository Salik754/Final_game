// =======================
// obj_submarine STEP EVENT
// =======================
if (global.paused) exit;

// Handle out-of-fuel state
if (my_fuel <= 0) {
    my_fuel = 0;
    if (!out_of_fuel) {
        out_of_fuel = true;
        sprite_index = spr_broken_sub; // Show broken sub sprite
    }
	global.show_restart_button = true;
	global.in_submarine = true; // This helps distinguish the death message
}

// Only allow controls if NOT out of fuel
if (global.in_submarine && !out_of_fuel) {
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

    // Clamp position to room
    var spr_w = sprite_get_width(sprite_index);
    var spr_h = sprite_get_height(sprite_index);
    x = clamp(x, spr_w / 10, room_width  - spr_w / 10);
    y = clamp(y, spr_h / 8, room_height - spr_h / 8);

    // Fuel consumption
    my_fuel -= 0.1;
    if (my_fuel < 0) my_fuel = 0;

    // Shooting
    if (mouse_check_button_pressed(mb_left)) {
        var b = instance_create_layer(x, y, "Instances", obj_bullet);
        var dir = point_direction(x, y, mouse_x, mouse_y);
        b.direction = dir;
        b.speed = 10;
    }
}

// Damage cooldown
if (sub_damage_cooldown > 0) {
    sub_damage_cooldown -= 1;
}

// Clamp fuel to max if refueled
if (my_fuel > my_max_fuel) {
    my_fuel = my_max_fuel;
}

// OPTIONAL: If you want to restore the normal sprite if refueled (after being broken)
if (out_of_fuel && my_fuel > 0) {
    out_of_fuel = false;
    sprite_index = spr_sub_right; // Or whatever your default sub sprite is!
}