// Increase player's oxygen, but cap at max_oxygen
other.oxygen += oxygen_restore;
if (other.oxygen > other.max_oxygen) {
    other.oxygen = other.max_oxygen;
}
instance_destroy(); // Remove bubble