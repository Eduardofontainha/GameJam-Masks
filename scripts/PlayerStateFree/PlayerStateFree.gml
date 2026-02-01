
function PlayerStateFree(){
	script_execute(get_input);
	#region MOVIMENTATION
	var move = key_right - key_left;
	hspd = move * spd;
	vspd += grv;
	x = clamp(x,8,room_width-8);

	if(hspd != 0) image_xscale = sign(hspd);
	
	//COLISION HORIZONTAL
	
	if (place_meeting(x+hspd, y, o_wall)) {
	    while (!place_meeting(x+sign(hspd), y, o_wall)) {
	        x += sign(hspd);
		}
		hspd = 0;
	}
	if (place_meeting(x+hspd, y, o_floor)) {
	    while (!place_meeting(x+sign(hspd), y, o_floor)) {
	        x += sign(hspd);
		}
		hspd = 0;
	}
	x += hspd;

	//COLISION VERTICAL


	if(place_meeting(x, y+vspd, o_floor))
	{
		while(!place_meeting(x, y +sign(vspd),o_floor))
		{
			y += sign(vspd);
		}
		
		vspd = 0;
	}

	y += vspd;

	//JUMP
	if (place_meeting(x, y+1, o_floor) && key_jump) { vspd = -7; }

	//next
	if(next)
	{
		room_goto(Room2);
	}
	
	

	

if (global.mask) {
    // ataque com mouse
    if (mouse_check_button_pressed(mb_left) && !attack) {
        attack = true;
        sprite_index = spr_player_mask_attack;
        image_index = 0;
        image_speed = 1;
		var offset = 16; 
		
		var hb = instance_create_layer(x + image_xscale * offset, y - 16, "Instances", o_hitbox);
		
    }
    else if (!attack) {
        // movimento normal com máscara
        if (vspd != 0) {
            sprite_index = spr_player_mask_jump;
        } else if (hspd != 0) {
            sprite_index = spr_player_mask_run;
        } else {
            sprite_index = spr_player_mask_idle;
        }
    }
} else {
    // movimento sem máscara
    if (vspd != 0) {
        sprite_index = spr_player_jump;
    } else if (hspd != 0) {
        sprite_index = spr_player_walk;
    } else {
        sprite_index = spr_player_idle;
    }
}

#endregion








 





	if (hp <= 0) {
    global.game_over = true;
    instance_destroy();
	room_restart()

	}
}

	
	
