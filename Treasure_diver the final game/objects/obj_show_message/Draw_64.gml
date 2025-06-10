if (instance_exists(obj_submarine) && obj_submarine.out_of_fuel) {
    // Animation variables
    var t = current_time / 300; // Animation time
    var w = display_get_gui_width();
    var h = display_get_gui_height();

    // Animated color
    var hue = (t * 120) mod 255;
    var color1 = make_color_hsv(hue, 240, 255);
    var color2 = make_color_hsv((hue+80) mod 255, 240, 255);

    // Message text
    var msg = choose("OOPS! NO FUEL!", "You ran out of fuel!", "Submarine is EMPTY!", "Game Over: Out of Fuel!");

    // Font settings: use a large font, or set a big default size
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    // Fancy shadow
    draw_set_color(c_black);
    for (var i=1; i<=8; i++) {
        var angle = i * pi/4;
        draw_text(w/2 + lengthdir_x(5, angle), h/2-20 + lengthdir_y(5, angle), msg);
    }

    // Animated gradient text
    var interp = 0.5 + 0.5 * sin(t);
    draw_set_color(merge_color(color1, color2, interp));
    draw_text(w/2, h/2-20, msg);

    // Press R to Restart (with pulse effect)
    var alpha = 0.6 + 0.4 * sin(t*2);
    draw_set_color(c_white);
    draw_set_alpha(alpha);
    draw_text(w/2, h/2+40, ">> Press R to Restart <<");
    draw_set_alpha(1);

    // Optional: Add sparkles or icon
    // draw_sprite(spr_fuel_icon, 0, w/2, h/2-80);
}