// Place this in: obj_ui > Draw GUI Event (Draw event, set it to "Draw GUI")
var bar_w = 100, bar_h = 10, bar_x = 10, bar_y = 10;

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
} else if (instance_exists(obj_player)) {
    var oxy_ratio = clamp(obj_player.oxygen / obj_player.max_oxygen, 0, 1);

    draw_set_color(c_white);
    draw_rectangle(bar_x, bar_y, bar_x + bar_w, bar_y + bar_h, false);
    draw_set_color(c_aqua);
    draw_rectangle(bar_x, bar_y, bar_x + (bar_w * oxy_ratio), bar_y + bar_h, true);
    draw_set_color(c_white);
    draw_text(bar_x, bar_y + bar_h + 2, "Oxygen: " + string(floor(obj_player.oxygen)));
} else {
    draw_set_color(c_red);
    draw_text(bar_x, bar_y, "Oxygen: -- (DEAD)");
}
