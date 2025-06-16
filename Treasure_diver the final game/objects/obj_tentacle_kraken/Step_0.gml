// obj_tentacle Step Event

// Move down
y += vspd;

// Destroy if off the bottom of the room
if (y > room_height) {
    instance_destroy();
}

// Destroy the submarine if it touches the tentacle
if (instance_exists(obj_submarine)) {
    if (place_meeting(x, y, obj_submarine)) {
        with (instance_place(x, y, obj_submarine)) {
            instance_destroy(); // Destroy the submarine
            // Optionally, you can add an explosion, sound, or trigger game over here
        }
    }
}