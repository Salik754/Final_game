if (keyboard_check_pressed(ord("E"))) {
    var sub = instance_create_layer(x, y, "Instances", obj_submarine);
    sub.active = true; // Activate movement
    global.show_oxygen_bar = false;
    instance_destroy();
}