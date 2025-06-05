// obj_controller > Draw GUI Event (Draw_64.gml)
// This is the "previous pause menu" with a large background and clear options
if (global.paused) {
    var menu_w = 300, menu_h = 150;
    var menu_x = display_get_gui_width()/2 - menu_w/2;
    var menu_y = display_get_gui_height()/2 - menu_h/2;

    draw_set_color(c_black);
    draw_set_alpha(0.85);
    draw_rectangle(menu_x, menu_y, menu_x + menu_w, menu_y + menu_h, false);
    draw_set_alpha(1);

    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    draw_text(menu_x + menu_w/2, menu_y + 24, "PAUSED");

    var opt_y = menu_y + 60, opt_gap = 40;
    var clr_resume = global.pause_selected == 0 ? c_yellow : c_white;
    var clr_restart = global.pause_selected == 1 ? c_yellow : c_white;

    draw_set_color(clr_resume);
    draw_text(menu_x + menu_w/2, opt_y, "Resume");
    draw_set_color(clr_restart);
    draw_text(menu_x + menu_w/2, opt_y + opt_gap, "Restart");

    draw_set_color(c_white);
    draw_set_valign(fa_bottom);
    draw_text(menu_x + menu_w/2, menu_y + menu_h - 10, "Use ↑/↓ or W/S, Enter to select");
}