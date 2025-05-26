if (global.in_submarine) {
    // Movement
    var hsp = 0;
    var vsp = 0;

    if (keyboard_check(vk_left)) hsp = -4;
    if (keyboard_check(vk_right)) hsp = 4;
    if (keyboard_check(vk_up)) vsp = -4;
    if (keyboard_check(vk_down)) vsp = 4;

    x += hsp;
    y += vsp;

    // Clamp position inside room
    x = clamp(x, 0, room_width);
    y = clamp(y, 0, room_height);

    // Set sprite direction
    if (hsp < 0) {
        sprite_index = spr_submarine_left;
    } else if (hsp > 0) {
        sprite_index = spr_submarine_right;
    }

    // Shooting towards mouse
    if (mouse_check_button_pressed(mb_left)) {
        var bullet = instance_create_layer(x, y, "Instances", obj_bullet);
        var dir = point_direction(x, y, mouse_x, mouse_y);
        bullet.direction = dir;
        bullet.speed = 8;
    }
}
if (controlled && !global.paused) {
    var hsp = 0;
    var vsp = 0;

    if (keyboard_check(vk_left)) hsp = -4;
    if (keyboard_check(vk_right)) hsp = 4;
    if (keyboard_check(vk_up)) vsp = -4;
    if (keyboard_check(vk_down)) vsp = 4;

    x += hsp;
    y += vsp;

    // Clamp inside room
    x = clamp(x, 0, room_width);
    y = clamp(y, 0, room_height);

    // Optional: reduce fuel while moving
    if (hsp != 0 || vsp != 0) {
        fuel -= 0.05;
        fuel = clamp(fuel, 0, max_fuel);
    }
}
	

