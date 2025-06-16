// Shark Create Event

hp = 8;
is_dead = false;
death_timer = 0;

// Knockback
knockback_speed = 0;
knockback_dir = 0;

// Health bar display control
show_healthbar = false;
healthbar_timer = 0;
HEALTHBAR_DISPLAY_TIME = room_speed * 1.5; // 1.5 seconds

// Set initial sprite (right-facing as default)
sprite_index = spr_shark_right;
image_blend = c_white;
image_alpha = 1;

