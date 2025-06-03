// Reverse movement direction (180 degrees)
move_dir += 180;
move_dir = move_dir mod 360; // Keep angle in valid range

// Move away slightly so it doesn't get stuck
x += lengthdir_x(4, move_dir);
y += lengthdir_y(4, move_dir);