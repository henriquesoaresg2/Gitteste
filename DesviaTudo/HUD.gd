extends CanvasLayer

signal start_game

onready var player = get_node("/root/Main/Player")

var tempo = Timer.new()

func _ready():
	tempo.connect("timeout", self, "_on_tempo_timeout")
	add_child(tempo)

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()

func show_game_over():
	show_message("Game Over")
	yield($MessageTimer, "timeout") # Espera ate terminar o contador do MessageTimer.
	$Message.text = "Desvia ou\nmorre!"
	$Message.show()
	$Credits.show()
	yield(get_tree().create_timer(1), "timeout") #Realiza mesmo efeito de one-shot no timer e espera terminar
	$StartButton.show()

func update_score(score):
	$ScoreLabel.text = str(score)

func _on_StartButton_pressed():
	$StartButton.hide()
	emit_signal("start_game")

func _on_MessageTimer_timeout():
	$Message.hide()
	$Credits.hide()

func _brilha_Message():
	if player.is_visible():
		tempo.start(1.5)
	else:
		tempo.paused
		$Hints.hide()

func _on_tempo_timeout():
	if $Hints.is_visible():
		$Hints.hide()
	else:
		$Hints.show()
	#falta fazer um if para se mostrar o player, chamar funcao abaixo.
	_brilha_Message()
