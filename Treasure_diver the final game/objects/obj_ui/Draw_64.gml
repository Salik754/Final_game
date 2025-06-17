// === obj_ui > Draw GUI Event ===

var bar_w = 120, bar_h = 12, bar_x = 60, bar_y = 40;
var label_padding = 4;
var font_height = 12;

draw_set_font(-1);

// === GAME OVER SCREEN ===
if (global.game_over) {
    // Draw dark overlay
    draw_set_color(c_black);
    draw_set_alpha(0.8);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    draw_set_alpha(1);

    // Draw "YOU DIED" text
    draw_set_color(c_red);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(display_get_gui_width()/2, display_get_gui_height()/2 - 60, "YOU DIED");

    // Draw Restart Button (white outline, black text)
    var bx = display_get_gui_width()/2;
    var by = display_get_gui_height()/2 + 30;
    var bw = 120;
    var bh = 40;
    // Draw button outline
    draw_set_color(c_white);
    draw_rectangle(bx-bw/2, by-bh/2, bx+bw/2, by+bh/2, false);
    // Draw button text in black
    draw_set_color(c_black);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(bx, by, "RESTART");

    // Store button bounds for click detection in Step event
    global.restart_btn_x1 = bx-bw/2;
    global.restart_btn_y1 = by-bh/2;
    global.restart_btn_x2 = bx+bw/2;
    global.restart_btn_y2 = by+bh/2;
    exit; // Don't draw the regular UI if game over
}

// === PAUSE DISPLAY ===
if (global.paused) {
    var oxy = global.last_oxygen;
    var max_oxy = global.last_max_oxygen;
    var oxy_ratio = clamp(oxy / max_oxy, 0, 1);

    draw_set_color(c_white);
    draw_text(bar_x, bar_y - font_height - label_padding, "Oxygen: " + string(floor(oxy)));
    draw_set_color(c_white);
    draw_rectangle(bar_x, bar_y, bar_x + bar_w, bar_y + bar_h, false);
    draw_set_color(c_aqua);
    draw_rectangle(bar_x, bar_y, bar_x + (bar_w * oxy_ratio), bar_y + bar_h, true);
}
else if (global.in_submarine && instance_exists(obj_submarine)) {
    var fuel_ratio = clamp(obj_submarine.my_fuel / obj_submarine.my_max_fuel, 0, 1);

    draw_set_color(c_white);
    draw_text(bar_x, bar_y - font_height - label_padding, "Fuel: " + string(floor(obj_submarine.my_fuel)));
    draw_set_color(c_white);
    draw_rectangle(bar_x, bar_y, bar_x + bar_w, bar_y + bar_h, false);
    draw_set_color(c_yellow);
    draw_rectangle(bar_x, bar_y, bar_x + (bar_w * fuel_ratio), bar_y + bar_h, true);
}
else if (instance_exists(obj_player)) {
    var oxy_ratio = clamp(obj_player.oxygen / obj_player.max_oxygen, 0, 1);

    draw_set_color(c_white);
    draw_text(bar_x, bar_y - font_height - label_padding, "Oxygen: " + string(floor(obj_player.oxygen)));
    draw_set_color(c_white);
    draw_rectangle(bar_x, bar_y, bar_x + bar_w, bar_y + bar_h, false);
    draw_set_color(c_aqua);
    draw_rectangle(bar_x, bar_y, bar_x + (bar_w * oxy_ratio), bar_y + bar_h, true);
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