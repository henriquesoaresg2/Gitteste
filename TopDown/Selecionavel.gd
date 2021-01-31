extends StaticBody2D

signal acendeLuz(estaSelecionado)
onready var luzSelecao = get_node("Light2D")

func _on_Selecionavel_acendeLuz(estaSelecionado):
	luzSelecao.set_enabled(estaSelecionado)
