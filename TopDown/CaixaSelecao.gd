extends Control

export (NodePath) var cameraPath

var posInicial
var posAtual
var camera
var objSelecionaveis = []

func _ready():
	if cameraPath != null:
		camera = get_node(cameraPath)
	set_process_input(true)

func _input(event):
	CriaCaixa()

func CriaCaixa():
	if Input.is_action_just_pressed("mouse_left"):
		posInicial = get_global_mouse_position()
		set_begin(posInicial)
	elif Input.is_action_pressed("mouse_left"):
		posAtual = get_global_mouse_position()
		set_begin(Vector2(min(posInicial.x, posAtual.x), min(posInicial.y, posAtual.y)))
		set_end(Vector2(max(posInicial.x, posAtual.x), max(posInicial.y, posAtual.y)))
	elif Input.is_action_just_released("mouse_left"):
		set_begin(Vector2(0,0))
		set_end(Vector2(0,0))

func SelecionaObjs():
	print("Entrou na funcao")
	var selfRect = get_rect()
	for objeto in objSelecionaveis:
		if objeto is Spatial:
			print("is Spatial")
			objeto.emit_signal("acendeLuz", selfRect.has_point(camera.unproject_position(objeto.transform().origin)))
		elif objeto is CanvasItem:
			print("is CanvasItem")
			objeto.get_
			#objeto.emit_signal("acendeLuz", selfRect.has_point()
		else:
			print("Nadaaaaa")
