if (keyboard_check_pressed(ord("E"))) {
    global.in_submarine = true;

    // Move submarine to player's current position
    obj_submarine.x = x;
    obj_submarine.y = y;

    // Destroy the player object
    instance_destroy();
}
