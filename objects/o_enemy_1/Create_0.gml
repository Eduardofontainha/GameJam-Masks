hp_boss = 100;
spd = 2;
range_melee = 40;

cooldown_melee = 0;
distance = 300;

hspd = 0;
vspd = 0;
grv = 0.4;

image_speed = 0.6;


enum EnemyState
{
	IDLE,
	CHASE,
	ATTACK
}

state = EnemyState.IDLE;