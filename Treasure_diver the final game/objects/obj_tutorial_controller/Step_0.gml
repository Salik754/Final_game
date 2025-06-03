if (show_controls) {
    if (!can_continue) {
        countdown_timer--;
        if (countdown_timer <= 0) {
            can_continue = true;
        }
    }

    if (can_continue && keyboard_check_pressed(vk_anykey)) {
        show_controls = false;
        room_goto_next(); // or room_goto(rm_level1); etc.
    }

    exit; // Block any other logic until message is gone
}
