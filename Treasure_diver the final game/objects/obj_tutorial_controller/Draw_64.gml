if (show_controls) {
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_alpha(1);

    var message = 
        "Welcome to Treasure Diver!\n\n" +
        "- Arrow Keys to Move\n" +
        "- R to Restart\n" +
        "- P to Pause\n" +
        "- E to Enter the Submarine\n" +
        "- Right Click to Shoot (in Submarine)\n" +
        "- Collect Bubbles to Maintain Oxygen\n" +
        "- Collect Coins to Maintain Fuel\n\n";

    if (!can_continue) {
        var seconds_left = ceil(countdown_timer / room_speed);
        message += "Game starts in " + string(seconds_left) + " seconds...";
    } else {
        message += "Press any key to begin!";
    }

    draw_text(display_get_gui_width() / 2, display_get_gui_height() / 2, message);
}
