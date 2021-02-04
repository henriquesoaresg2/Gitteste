extends Area2D

signal hit

export var speed = 400 #(pixels/sec)
var character = ["man", "salsicha"]#:String setget definePersonagem, pegaPersonagem # Para futuras implementacoes de alteracao de personagens...
var characterSelected = "man"
var screen_size
var character_shape 
var n= 0

func _ready():
	character_shape = get_node("Collision_"+characterSelected)
	screen_size = get_viewport_rect().size # Acha qual o tamanho da tela de jogo
	hide()

func _process(delta):
	

	if Input.is_action_just_pressed("ui_page_down"):# and character_shape.disabled == false: # Troca personagens
		if n < (character.size()-1):
			print(n, " < ", (character.size()-1))
			characterSelected = character[n]
			n += 1
		elif n == (character.size()-1):
			print(n, " < ", (character.size()-1))
			characterSelected = character[n]
			n=0			
		character_shape.set_deferred("disabled", true)
		character_shape = get_node("Collision_"+characterSelected)
		character_shape.set_deferred("disabled", false)
			
			

	var velocity = Vector2() # Seria a direcao para onde o player vai
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		#$AnimatedSprite.stop()
		$AnimatedSprite.play()
		$AnimatedSprite.animation = characterSelected+"_idle"
		
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
	if velocity.x != 0:
		$AnimatedSprite.animation = characterSelected+"_side"
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = velocity.x < 0
	elif velocity.y != 0:
		if velocity.y < 0:
			$AnimatedSprite.animation = characterSelected+"_up"
		else:
			$AnimatedSprite.animation = characterSelected+"_down"
		#$AnimatedSprite.flip_v = velocity.y > 0
		

func _on_Player_body_entered(_body):
	hide()  # Player some quando tocado.
	emit_signal("hit")
	#$CollisionShape2D.set_deferred("disabled", true)
	character_shape.set_deferred("disabled", true)

func start(pos):
	position = pos
	show()
	#$CollisionShape2D.disabled = false
	character_shape.disabled = false

#func definePersonagem(sprite_personagem):
#	character = sprite_personagem
#
#func pegaPersonagem():
#	return character
