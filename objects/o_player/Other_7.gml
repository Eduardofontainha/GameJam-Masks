if (sprite_index == spr_player_mask_attack) {
    attack = false;
    sprite_index = spr_player_mask_idle;
}

if (sprite_index == spr_player_hurt) {
    sprite_index = spr_player_idle;
    image_speed = 1;
}
if(sprite_index == spr_player_walk){
	sprite_index = spr_player_idle;
    image_speed = 1;
}
if(sprite_index == spr_player_jump){
	sprite_index = spr_player_idle;
    image_speed = 1;
}

