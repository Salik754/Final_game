// At the top of Create Event for your persistent controller object:
if (!variable_global_exists("bg_music_id")) {
    global.bg_music_id = -1;
}

if (!audio_is_playing(global.bg_music_id)) {
    global.bg_music_id = audio_play_sound(snd_bg_music, 1, true);
}