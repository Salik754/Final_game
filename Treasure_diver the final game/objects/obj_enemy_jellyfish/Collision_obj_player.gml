if (other.damage_cooldown <= 0) {  // other = obj_player
    other.oxygen -= 10;            // reduce oxygen
    other.damage_cooldown = 60;    // 1 second cooldown (assuming 60 FPS)

    // Optional: play hurt sound or effect
}
