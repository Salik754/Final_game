// Destroy all existing coins
with (obj_coin) {
    instance_destroy();
}

// Now spawn the new coins
for (var i = 0; i < 15; i++) {
    var rand_x = random_range(32, room_width - 32);
    var rand_y = random_range(32, room_height - 32);
    instance_create_layer(rand_x, rand_y, "Instances", obj_coin);
}

// Only spawn tentacles if limit not reached
if (tentacle_count < max_tentacle) {
    // Spawn tentacle1
    var tx1 = random_range(64, room_width - 64);
    var ty1 = 0; // Top of the room
    var tentacle1 = instance_create_layer(tx1, ty1, "Instances", obj_tentacle_kraken);
    tentacle1.sprite_index = spr_tentacle1;

    // Spawn tentacle2 (optional: comment out if you only want one per cycle)
    var tx2 = random_range(64, room_width - 64);
    var ty2 = 0;
    var tentacle2 = instance_create_layer(tx2, ty2, "Instances", obj_tentacle_kraken);
    tentacle2.sprite_index = spr_tentacle2;

    tentacle_count += 2; // Count both tentacles

    // Set the alarm again only if not at max
    if (tentacle_count < max_tentacle) {
        alarm[0] = room_speed * 5; // Repeat every 5 seconds
    }
    // No more repeats, alarm is not reset
}