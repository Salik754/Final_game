// Move horizontally
x += hsp;
// Keep inside room horizontally (optional, prevents leaving room)
if (x < 0) {
    x = 0;
    hsp = -hsp;
}
if (x > room_width - sprite_width) {
    x = room_width - sprite_width;
    hsp = -hsp;
}