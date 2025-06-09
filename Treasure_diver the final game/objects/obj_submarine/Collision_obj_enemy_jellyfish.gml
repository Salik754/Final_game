if (sub_damage_cooldown <= 0) {
    // Sub takes damage by losing fuel
    my_fuel -= 10;
    if (my_fuel < 0) my_fuel = 0;

    // Set damage cooldown
    sub_damage_cooldown = 60; // 1 second

    // Optional knockback
    var knockback_dir = point_direction(other.x, other.y, x, y);
    var knockback_dist = 10;
    x += lengthdir_x(knockback_dist, knockback_dir);
    y += lengthdir_y(knockback_dist, knockback_dir);
}
