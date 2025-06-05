// Create the submarine at the player's position
instance_create_layer(x, y, "Instances", obj_submarine);

// Hide the oxygen bar
global.show_oxygen_bar = false;

// Destroy the player object
instance_destroy();