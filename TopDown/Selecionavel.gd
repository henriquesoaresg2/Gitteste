extends Node2D

onready var luzSelecao = get_node("Light2D")

var selecionado:bool

signal acendeLuz(estaSelecionado)
signal deletaObjeto()


func _on_Selecionavel_acendeLuz(estaSelecionado):
	luzSelecao.set_enabled(estaSelecionado)
	selecionado = luzSelecao.is_enabled()

func _on_Selecionavel_deletaObjeto():
	print("entrou na funcao ", selecionado)
	if selecionado:
		print(selecionado)
		self.queue_free()
