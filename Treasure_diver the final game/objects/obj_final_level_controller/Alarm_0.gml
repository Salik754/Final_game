// Destroy all existing coins
with (obj_coin) {
    instance_destroy();
}
// Now spawn the new coins
for (var i = 0; i < 15; i++) {
    var rand_x = random_range(32, room_width - 32);
    var rand_y = random_range(32, room_height - 32);
    instance_create_layer(rand_x, rand_y, "Final", obj_coin);
}

    // Spawn tentacle (drops from ceiling)
    var tx = random_range(64, room_width - 64);
    var ty = 0; // Top of the room
    instance_create_layer(tx, ty, "Final", obj_tentacle_kraken);

alarm[0] = room_speed * 5; // Repeat every 5 seconds