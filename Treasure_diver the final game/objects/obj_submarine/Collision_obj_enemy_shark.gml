if (sub_damage_cooldown <= 0) {
    my_fuel -= 25;
    if (my_fuel < 0) my_fuel = 0;
    sub_damage_cooldown = room_speed; // 1 second cooldown (adjust as needed)
    // You can add knockback or effects here if desired
}