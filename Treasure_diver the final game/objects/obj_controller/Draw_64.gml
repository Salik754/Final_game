var bar_width = 100;
var oxy_ratio = oxygen / max_oxygen;
draw_set_color(c_white);
draw_rectangle(10, 10, 10 + bar_width, 20, false);
draw_set_color(c_aqua);
draw_rectangle(10, 10, 10 + (bar_width * oxy_ratio), 20, true);
draw_set_color(c_white);
draw_text(10, 25, "Oxygen: " + string(floor(oxygen)));
