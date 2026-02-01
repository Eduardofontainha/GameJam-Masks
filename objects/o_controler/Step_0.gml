// Se o jogador já colocou a máscara e o boss ainda não foi criado
if (global.mask && !boss_spawned) {
    instance_create_layer(280, 150, "Instances", o_enemy_1); // posição e layer
    boss_spawned = true;
	image_speed = 0.2;
	
}


