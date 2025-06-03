if (keyboard_check_pressed(ord("E"))) {
    with (other) {
        active = true;
    }
    instance_destroy(); // or visible = false if you want to hide the player
}