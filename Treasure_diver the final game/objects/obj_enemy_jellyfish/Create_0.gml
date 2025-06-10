// Jellyfish Create Event

hp = 4;
is_dead = false;
death_timer = 0;

// Knockback
knockback_speed = 0;
knockback_dir = 0;

// Health bar display
show_healthbar = false;
healthbar_timer = 0;
HEALTHBAR_DISPLAY_TIME = room_speed * 1.5; // 1.5 seconds

sprite_index = spr_enemy_jelly;

// Patrol (for other rooms)
move_speed = 2;
hsp = move_speed;

// Follow speed (shipwreck room)
follow_speed = 1.5;
