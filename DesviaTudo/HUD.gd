extends CanvasLayer

signal start_game

func _ready():
	pass # Replace with function body.

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()

func show_game_over():
	show_message("Game Over")
	yield($MessageTimer, "timeout") # Espera ate terminar o contador do MessageTimer.
	$Message.text = "Desvia ou\nmorre!"
	$Message.show()
	yield(get_tree().create_timer(1), "timeout") #Realiza mesmo efeito de one-shot no timer e espera terminar
	$StartButton.show()

func update_score(score):
	$ScoreLabel.text = str(score)

func _on_StartButton_pressed():
	$StartButton.hide()
	emit_signal("start_game")

func _on_MessageTimer_timeout():
	$Message.hide()
