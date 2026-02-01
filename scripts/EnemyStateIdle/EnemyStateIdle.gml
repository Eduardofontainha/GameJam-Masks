function EnemyStateIdle(){
	script_execute(get_input);
	#region MOVIMENTAÇÂO
	
	vspd += grv;
	x = clamp(x,8,room_width-8);

	
	
	//COLISÃO HORIZONTAL
	
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

	//COLISÂO VERTICAL
	if(place_meeting(x, y+vspd, o_floor))
	{
		while(!place_meeting(x, y +sign(vspd),o_floor))
		{
			y += sign(vspd);
		}
		
		vspd = 0;
	}

	y += vspd;
	
	
	
	
	
	
	
if (hspd != 0) {
    // está andando
    sprite_index = spr_enemy1_run;
    image_speed = 1;
}

#endregion
	if(hspd != 0) image_xscale = sign(hspd);
		if (distance_to_object(o_player) < distance) {
	    state = EnemyState.CHASE;
	   
		}
}