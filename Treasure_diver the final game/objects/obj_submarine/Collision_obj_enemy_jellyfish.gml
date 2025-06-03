// === Submarine Collision Event with Jellyfish ===
if (active && damage_cooldown <= 0) {
    fuel -= 10; // Jellyfish deals 10 damage
    if (fuel < 0) fuel = 0;
    damage_cooldown = room_speed / 2; // 0.5 seconds cooldown
}