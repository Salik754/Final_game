if (is_dead) {
    // ... your death logic ...
} else {
    if (room == room_shipwreck) {
        // Follow submarine as before
        var target = instance_nearest(x, y, obj_submarine);
        if (target != noone) {
            var dir = point_direction(x, y, target.x, target.y);
            var spd = move_speed;
            var dx = lengthdir_x(spd, dir);
            var dy = lengthdir_y(spd, dir);
            x += dx;
            y += dy;
        }
    } else {
        // Move in current direction
        x += lengthdir_x(move_speed, move_dir);
        y += lengthdir_y(move_speed, move_dir);
    }
}