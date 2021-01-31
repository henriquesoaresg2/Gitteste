extends Node

export (NodePath) var objetoPath
onready var objeto = get_node(objetoPath)

func _ready():
	var caixaSelecao = get_tree().get_root().get_child(0).find_node("CaixaSelecao")
	caixaSelecao.objSelecionaveis.append(objeto)
	print(caixaSelecao)
	print(caixaSelecao.objSelecionaveis)
	print(objeto)
