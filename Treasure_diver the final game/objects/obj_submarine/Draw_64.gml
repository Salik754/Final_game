// Show message if out of fuel
if (out_of_fuel) {
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_red);
    draw_text(room_width/2, room_height/2 + 48, "You ran out of fuel!");
    draw_set_color(c_white);
}