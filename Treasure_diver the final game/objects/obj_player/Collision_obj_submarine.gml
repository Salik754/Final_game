if (!global.in_submarine) {
    global.in_submarine = true;
	obj_submarine.my_fuel = obj_submarine.my_max_fuel; // refuel submarine on entering
    instance_destroy(); // destroy the player
}
