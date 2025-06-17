// obj_bubble: Collision Event with obj_submarine

// Optionally, play a bubble collect sound
audio_play_sound(snd_bubble, 1, false); // Only if you have a sound named snd_bubble

// Increase player's oxygen by the bubble's restore value
other.oxygen += oxygen_restore;

// Cap oxygen at maximum
if (other.oxygen > other.max_oxygen) {
    other.oxygen = other.max_oxygen;
}

// Destroy the bubble after collection
instance_destroy();