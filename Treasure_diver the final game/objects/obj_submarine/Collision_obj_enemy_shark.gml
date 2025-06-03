// === Submarine Collision Event with Shark ===
if (active && damage_cooldown <= 0) {
    fuel -= 25 + irandom_range(0, 5); // Shark deals 25-30 damage
    if (fuel < 0) fuel = 0;
    damage_cooldown = room_speed / 2; // 0.5 seconds cooldown
}