// Shark Draw Event

draw_self();

if (show_healthbar && !is_dead) {
    var bar_width = 50;
    var bar_height = 10;
    var bar_x = x - bar_width/2;
    // This places the bar above the sprite, regardless of origin or bbox
    var bar_y = y - sprite_get_yoffset(sprite_index) + sprite_get_bbox_top(sprite_index) - 18;

    // Draw background
    draw_set_color(c_black);
    draw_rectangle(bar_x-1, bar_y-1, bar_x + bar_width + 1, bar_y + bar_height + 1, false);

    // Health fill (green to red)
    var hp_frac = hp / 8; // or hp / max_hp if you have max_hp
    var bar_col = merge_color(c_red, c_lime, hp_frac);
    draw_set_color(bar_col);
    draw_rectangle(bar_x, bar_y, bar_x + bar_width * hp_frac, bar_y + bar_height, false);

    // Outline
    draw_set_color(c_white);
    draw_rectangle(bar_x-1, bar_y-1, bar_x + bar_width + 1, bar_y + bar_height + 1, true);

    // Reset color
    draw_set_color(c_white);
}