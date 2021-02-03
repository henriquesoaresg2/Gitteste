extends Node

export (PackedScene) var Mob
var score

func _ready():
	randomize()

func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	$HUD.show_game_over()
	get_tree().call_group("mobs", "queue_free")
	$Music.stop()
	$DeathSound.play()

func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()
	$HUD.update_score(score)
	$HUD.show_message("Get Ready")
	$Music.play()

func _on_StartTimer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()

func _on_ScoreTimer_timeout():
	score += 1
	$HUD.update_score(score)

func _on_MobTimer_timeout():
	$MobPath/MobSpawnLocation.offset = randi() #Escolhe um lugar aleatório dentro do Path2D para espawnar
	var mob = Mob.instance()  #Instancia um Mob.
	add_child(mob) #Add o Mob na cena.
	var direction = $MobPath/MobSpawnLocation.rotation + PI / 2 # Define direção do Mob no caminho dele
	mob.position = $MobPath/MobSpawnLocation.position # Define posição do Mob para um lugar aleatório
	direction += rand_range(-PI / 4, PI / 4) # Add algumas direções randomicas.
	mob.rotation = direction
	mob.linear_velocity = Vector2(rand_range(mob.min_speed, mob.max_speed), 0) # Seta a velocidade (rapidez e direcao).
	mob.linear_velocity = mob.linear_velocity.rotated(direction)
