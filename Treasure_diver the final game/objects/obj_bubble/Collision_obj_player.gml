var oxygen_gain = 20;

// Affect the player's oxygen (other = obj_player in collision)
other.oxygen += oxygen_gain;

// Clamp to max
if (other.oxygen > other.max_oxygen) {
    other.oxygen = other.max_oxygen;
}

// Destroy this bubble
instance_destroy();
