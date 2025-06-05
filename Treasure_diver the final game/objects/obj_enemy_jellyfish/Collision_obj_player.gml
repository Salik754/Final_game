if (other.damage_cooldown <= 0) {
    other.oxygen -= 20;
    if (other.oxygen < 0) other.oxygen = 0;
    other.damage_cooldown = room_speed; // 1 second cooldown (room_speed is steps per second)
}