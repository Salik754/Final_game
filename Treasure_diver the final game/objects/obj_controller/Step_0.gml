// Toggle pause with P
if (keyboard_check_pressed(ord("P"))) {
    global.paused = !global.paused;
}
// Restart with R
if (keyboard_check_pressed(ord("R"))) {
    room_restart();
}