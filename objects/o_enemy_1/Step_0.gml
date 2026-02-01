

switch(state)
{
case EnemyState.IDLE: EnemyStateIdle(); break;
case EnemyState.CHASE: EnemyStateChase(); break;
case EnemyState.ATTACK: EnemyStateAttack(); break;
}

if state = EnemyState.ATTACK
{
	hspd = 0;
	sprite_index = spr_boss_attack_1;
}
if state = EnemyState.IDLE
{
	hspd = 0;
	sprite_index = spr_enemy1_run;
}
if (hp_boss <= 0) {
    global.victory = true;
    instance_destroy();
	room_goto(Room3)
}


