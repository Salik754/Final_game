// === HUD DISPLAY ===

var bar_width = 100;
var bar_height = 10;

// === OXYGEN BAR ===
if (instance_exists(obj_player)) {
    var oxy_ratio = obj_player.oxygen / obj_player.max_oxygen;

    draw_set_color(c_white);
    draw_rectangle(10, 10, 10 + bar_width, 10 + bar_height, false); // Outline

    draw_set_color(c_aqua);
    draw_rectangle(10, 10, 10 + (bar_width * oxy_ratio), 10 + bar_height, false); // Fill

    draw_set_color(c_white);
    draw_text(10, 25, "Oxygen: " + string(floor(obj_player.oxygen)));
}

// === FUEL BAR (for submarine) ===
if (instance_exists(obj_submarine)) {
    var fuel_ratio = obj_submarine.fuel / obj_submarine.max_fuel;

    draw_set_color(c_white);
    draw_rectangle(10, 10, 10 + bar_width, 10 + bar_height, false); // Outline

    draw_set_color(c_yellow);
    draw_rectangle(10, 10, 10 + (bar_width * fuel_ratio), 10 + bar_height, false); // Fill

    draw_set_color(c_white);
    draw_text(10, 25, "Fuel: " + string(floor(obj_submarine.fuel)));
}

// === PAUSE OVERLAY ===
if (global.paused) {
    draw_set_alpha(0.5);
    draw_set_color(c_black);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    draw_set_alpha(1);

    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(display_get_gui_width() / 2, display_get_gui_height() / 2, "PAUSED");
}

// === RESET ===
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_set_alpha(1);
