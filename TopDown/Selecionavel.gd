extends Node2D

onready var luzSelecao = get_node("Light2D")

signal acendeLuz(estaSelecionado)


func _on_Selecionavel_acendeLuz(estaSelecionado):
	luzSelecao.set_enabled(estaSelecionado)
