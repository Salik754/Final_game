// Movement Input
hsp = (keyboard_check(vk_right) - keyboard_check(vk_left)) * move_speed;
vsp = (keyboard_check(vk_down) - keyboard_check(vk_up)) * move_speed;

x += hsp;
y += vsp;

// Oxygen Drain
oxygen -= oxygen_deplete_rate;
if (oxygen <= 0) {
    instance_destroy(); // Will replace with death handler
}

// Damage Cooldown Timer
if (damage_cooldown > 0) {
    damage_cooldown--;
}

// Flip Sprite Based on Direction
if (hsp != 0) {
    sprite_index = hsp > 0 ? spr_player_right : spr_player_left;
}
