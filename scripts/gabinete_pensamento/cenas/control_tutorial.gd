extends Control

@onready var tutorial_1: Control = $tutorial1
@onready var tutorial_2: Control = $tutorial2
@onready var tutorial_3: Control = $tutorial3
@onready var tutorial_4: Control = $tutorial4
@onready var tutorial_5: Control = $tutorial5

var passo_atual := 0
var tutoriais: Array[Control]

func _ready():
	if Globals.primeiro_gabinete:
		tutoriais = [tutorial_1, tutorial_2, tutorial_3, tutorial_4, tutorial_5]
		# Esconde todos os tutoriais inicialmente
		for t in tutoriais:
			t.visible = false
		# Mostra o primeiro tutorial
		tutoriais[passo_atual].visible = true

func _unhandled_input(event: InputEvent) -> void:
	if Globals.primeiro_gabinete and Globals.gabinete and (event.is_action_pressed("ui_select") or (event.is_action_pressed("mb"))):
		avancar_tutorial()

func avancar_tutorial():
	if passo_atual < tutoriais.size() and Globals.primeiro_gabinete:
		tutoriais[passo_atual].queue_free()
		passo_atual += 1
		if passo_atual < tutoriais.size():
			tutoriais[passo_atual].visible = true
		else:
			# Último tutorial finalizado, remove o painel completo
			Globals.primeiro_gabinete = false
			queue_free()
