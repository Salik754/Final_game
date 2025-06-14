// === obj_ui > Draw GUI Event ===

// Bar settings
var bar_w = 120, bar_h = 12, bar_x = 60, bar_y = 40;
var label_padding = 4; // space between label and bar above
var font_height = 12;  // adjust if your font is bigger/smaller

// Set font (use built-in, or replace with your font)
draw_set_font(-1);

// === PAUSE DISPLAY ===
if (global.paused) {
    var oxy = global.last_oxygen;
    var max_oxy = global.last_max_oxygen;
    var oxy_ratio = clamp(oxy / max_oxy, 0, 1);

    // Draw label above bar
    draw_set_color(c_white);
    draw_text(bar_x, bar_y - font_height - label_padding, "Oxygen: " + string(floor(oxy)));

    // Draw bar
    draw_set_color(c_white);
    draw_rectangle(bar_x, bar_y, bar_x + bar_w, bar_y + bar_h, false);
    draw_set_color(c_aqua);
    draw_rectangle(bar_x, bar_y, bar_x + (bar_w * oxy_ratio), bar_y + bar_h, true);
}
else if (global.in_submarine && instance_exists(obj_submarine)) {
    var fuel_ratio = clamp(obj_submarine.my_fuel / obj_submarine.my_max_fuel, 0, 1);

    // Draw label above bar
    draw_set_color(c_white);
    draw_text(bar_x, bar_y - font_height - label_padding, "Fuel: " + string(floor(obj_submarine.my_fuel)));

    // Draw bar
    draw_set_color(c_white);
    draw_rectangle(bar_x, bar_y, bar_x + bar_w, bar_y + bar_h, false);
    draw_set_color(c_yellow);
    draw_rectangle(bar_x, bar_y, bar_x + (bar_w * fuel_ratio), bar_y + bar_h, true);
}
else if (instance_exists(obj_player)) {
    var oxy_ratio = clamp(obj_player.oxygen / obj_player.max_oxygen, 0, 1);

    // Draw label above bar
    draw_set_color(c_white);
    draw_text(bar_x, bar_y - font_height - label_padding, "Oxygen: " + string(floor(obj_player.oxygen)));

    // Draw bar
    draw_set_color(c_white);
    draw_rectangle(bar_x, bar_y, bar_x + bar_w, bar_y + bar_h, false);
    draw_set_color(c_aqua);
    draw_rectangle(bar_x, bar_y, bar_x + (bar_w * oxy_ratio), bar_y + bar_h, true);
}
else {
    draw_set_color(c_red);
    draw_text(bar_x, bar_y, "Oxygen: -- (DEAD)");
}

// === COIN DISPLAY IN SHIPWRECK ===
if (room == room_shipwreck) {
    var icon_sprite = spr_coin_icon;
    var icon_index = 0;
    var icon_w = sprite_get_width(icon_sprite);
    var icon_h = sprite_get_height(icon_sprite);
    var margin = 10;
    var icon_x = display_get_gui_width() - icon_w - margin;
    var icon_y = margin;

    draw_sprite(icon_sprite, icon_index, icon_x, icon_y);
    draw_set_color(c_white);
    draw_text(icon_x - 5, icon_y + icon_h / 2, "x " + string(global.coins));
}