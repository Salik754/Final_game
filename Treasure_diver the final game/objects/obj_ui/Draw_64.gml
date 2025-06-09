// === obj_ui > Draw GUI Event ===

var bar_w = 100, bar_h = 10, bar_x = 10, bar_y = 10;

// === PAUSE DISPLAY ===
if (global.paused) {
    var oxy = global.last_oxygen;
    var max_oxy = global.last_max_oxygen;
    var oxy_ratio = clamp(oxy / max_oxy, 0, 1);

    draw_set_color(c_white);
    draw_rectangle(bar_x, bar_y, bar_x + bar_w, bar_y + bar_h, false);
    draw_set_color(c_aqua);
    draw_rectangle(bar_x, bar_y, bar_x + (bar_w * oxy_ratio), bar_y + bar_h, true);
    draw_set_color(c_white);
    draw_text(bar_x, bar_y + bar_h + 2, "Oxygen: " + string(floor(oxy)));
}
else if (global.in_submarine && instance_exists(obj_submarine)) {
    // === FUEL BAR ===
    var fuel_ratio = clamp(obj_submarine.my_fuel / obj_submarine.my_max_fuel, 0, 1);

    draw_set_color(c_white);
    draw_rectangle(bar_x, bar_y, bar_x + bar_w, bar_y + bar_h, false);
    draw_set_color(c_yellow);
    draw_rectangle(bar_x, bar_y, bar_x + (bar_w * fuel_ratio), bar_y + bar_h, true);
    draw_set_color(c_white);
    draw_text(bar_x, bar_y + bar_h + 2, "Fuel: " + string(floor(obj_submarine.my_fuel)));
}
else if (instance_exists(obj_player)) {
    // === OXYGEN BAR ===
    var oxy_ratio = clamp(obj_player.oxygen / obj_player.max_oxygen, 0, 1);

    draw_set_color(c_white);
    draw_rectangle(bar_x, bar_y, bar_x + bar_w, bar_y + bar_h, false);
    draw_set_color(c_aqua);
    draw_rectangle(bar_x, bar_y, bar_x + (bar_w * oxy_ratio), bar_y + bar_h, true);
    draw_set_color(c_white);
    draw_text(bar_x, bar_y + bar_h + 2, "Oxygen: " + string(floor(obj_player.oxygen)));
}
else {
    // === DEAD ===
    draw_set_color(c_red);
    draw_text(bar_x, bar_y, "Oxygen: -- (DEAD)");
}

// === COIN DISPLAY IN SHIPWRECK ===
if (room == room_shipwreck) {
    var icon_sprite = spr_coin_icon; // Your coin icon sprite
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
