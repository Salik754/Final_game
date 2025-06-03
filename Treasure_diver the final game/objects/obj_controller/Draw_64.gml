// === HUD DISPLAY ===

var bar_width = 100;
var bar_height = 10;

// === OXYGEN BAR (WHEN SWIMMING) ===
if (!global.in_submarine && instance_exists(obj_player)) {
    var oxy_ratio = obj_player.oxygen / obj_player.max_oxygen;
    draw_set_color(c_white);
    draw_rectangle(10, 10, 10 + bar_width, 10 + bar_height, false); // Outline
    draw_set_color(c_aqua);
    draw_rectangle(10, 10, 10 + (bar_width * oxy_ratio), 10 + bar_height, true); // Fill
    draw_set_color(c_white);
    draw_text(10, 25, "Oxygen: " + string(floor(obj_player.oxygen)));
}

// === FUEL BAR (WHEN IN SUBMARINE) ===
else if (global.in_submarine && instance_exists(obj_submarine)) {
    var fuel_ratio = obj_submarine.fuel / obj_submarine.max_fuel;
    draw_set_color(c_white);
    draw_rectangle(10, 10, 10 + bar_width, 10 + bar_height, false); // Outline
    draw_set_color(c_yellow);
    draw_rectangle(10, 10, 10 + (bar_width * fuel_ratio), 10 + bar_height, true); // Fill
    draw_set_color(c_white);
    draw_text(10, 25, "Fuel: " + string(floor(obj_submarine.fuel)));
}

// === PAUSE OVERLAY ===
if (global.paused) {
    draw_set_alpha(0.5);
    draw_set_color(c_black);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), true);
    draw_set_alpha(1);
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(display_get_gui_width() / 2, display_get_gui_height() / 2, "PAUSED");
}

// === COIN ICON + COUNT (ONLY IN SHIPWRECK ROOM) ===
if (room == room_shipwreck) {
    var icon_sprite = spr_coin_icon;
    var icon_index = 0;
    var icon_width = sprite_get_width(icon_sprite);
    var icon_height = sprite_get_height(icon_sprite);
    var margin = 10;
    var icon_x = display_get_gui_width() - icon_width - margin;
    var icon_y = margin;

    draw_sprite(icon_sprite, icon_index, icon_x, icon_y);

    // Show coin count
    var coin_count = (variable_global_exists("coins")) ? global.coins : 0;
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(icon_x + icon_width / 2, icon_y + icon_height / 2, "x " + string(coin_count));
}

// === Reset draw state (always good practice) ===
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_set_alpha(1);