if (show_controls) {
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_alpha(1);

    var message = 
        "Don't get close to the Jellyfish when you're in the Submarine or you will get stuck\n" +
        "Collect Bubbles to maintain the oxygen level\n" +
		"Collect coins to maintain the fuel level\n" +
        "Press P to see the pause menu\n" +
        "Get in the submarine as soon as possible(2nd level)\n" +
        "To shoot click left mouse, but you can only shoot when you're in the submarine\n" +
        "At the last level stay away from the tentacle because if you get touched by it, YOU DIE!!!\n" +
        "The sharks deal the most damage, so stay away\n" +
        "At last Happy Gaming!! Good Luck and don't forget the instructions because there's no way back";

    if (!can_continue) {
        var seconds_left = ceil(countdown_timer / room_speed);
        message += "\n\nGame starts in " + string(seconds_left) + " seconds...";
    } else {
        message += "\n\nPress any key to begin!";
    }

    draw_text(display_get_gui_width() / 2, display_get_gui_height() / 2, message);
}