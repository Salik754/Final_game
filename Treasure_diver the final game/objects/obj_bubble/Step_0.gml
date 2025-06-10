
if (global.paused) exit;

// Player code goes here// Move up
y -= 0.5;

// Clamp position so bubble never goes out of the room (bottom and top)
if (y < 0) {
    y = 0;
}
// Optionally, destroy if at the very top (if you want them to disappear)
if (y <= 0) {
    instance_destroy();
}