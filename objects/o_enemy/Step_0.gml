// reduzir cooldowns
if (cooldown_melee > 0) cooldown_melee--;
if (cooldown_shot > 0) cooldown_shot--;

// gravidade
vspd += grv;

// movimento horizontal (perseguir player)
if (instance_exists(o_player)) {
    var dir = sign(o_player.x - x);
    hspd = dir * spd;
}

// colisão horizontal
if (place_meeting(x+hspd, y, o_floor)) {
    while (!place_meeting(x+sign(hspd), y, o_floor)) {
        x += sign(hspd);
    }
    hspd = 0;
}
x += hspd;

// colisão vertical
if (place_meeting(x, y+vspd, o_floor)) {
    while (!place_meeting(x, y+sign(vspd), o_floor)) {
        y += sign(vspd);
    }
    vspd = 0;
}
y += vspd;

// ataques
if (instance_exists(o_player)) {
    var dist = point_distance(x, y, o_player.x, o_player.y);

    if (dist < range_melee && cooldown_melee <= 0) {
        sprite_index = spr_boss_attack;
        o_player.hp -= 5;
        cooldown_melee = room_speed / 2; // meio segundo
    }
	
    else if (dist < range_shot && cooldown_shot <= 0) {
        sprite_index = spr_boss_shoot;
        var bullet = instance_create_layer(x, y, "Instances", o_boss_bullet);
        bullet.direction = point_direction(x, y, o_player.x, o_player.y);
        bullet.speed = 6;
        cooldown_shot = room_speed; // 1 segundo
    }
    else {
        sprite_index = spr_enemy_idle;
    }
}

// morte
if (hp <= 0) {
    //sprite_index = spr_boss_die;
    instance_destroy();
}
