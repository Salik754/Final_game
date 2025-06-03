if (!global.in_submarine) {
    // Move player
    var h = keyboard_check(ord("D")) - keyboard_check(ord("A"));
    var v = keyboard_check(ord("S")) - keyboard_check(ord("W"));
    h += keyboard_check(vk_right) - keyboard_check(vk_left);
    v += keyboard_check(vk_down) - keyboard_check(vk_up);
    x += h * 3;
    y += v * 3;

    // Enter submarine if close and E pressed
    if (instance_exists(obj_submarine) && point_distance(x, y, obj_submarine.x, obj_submarine.y) < 32 && keyboard_check_pressed(ord("E"))) {
        global.in_submarine = true;
        instance_destroy(); // player is destroyed, only sub is controlled now
    }
}