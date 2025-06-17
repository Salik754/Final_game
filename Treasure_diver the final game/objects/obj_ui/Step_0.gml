// === obj_ui > Step Event ===

if (global.game_over) {
    if (mouse_check_button_pressed(mb_left)) {
        var mx = device_mouse_x_to_gui(0);
        var my = device_mouse_y_to_gui(0);
        if (mx > global.restart_btn_x1 && mx < global.restart_btn_x2 &&
            my > global.restart_btn_y1 && my < global.restart_btn_y2)
        {
            // Reset any global variables here if needed!
            room_goto(level_1); // Replace room_start with your actual first room
            global.game_over = false; // Reset game over flag
        }
    }
}
