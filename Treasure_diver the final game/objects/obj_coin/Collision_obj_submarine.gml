// obj_coin: Collision Event with obj_submarine

// Play a coin sound (if you have one)
audio_play_sound(snd_coin, 1, false);

// Add one coin to the global count
global.coins += 1;

// Refuel the submarine by 20 (up to 100 max)
other.my_fuel += 20;
if (other.my_fuel > other.my_max_fuel) other.my_fuel = other.my_max_fuel;

// Destroy the coin instance
instance_destroy();