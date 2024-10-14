extends Node2D

func _ready():
	pass
#class_name Level
#
#const _DIALOG_SCREEN: PackedScene = preload("res://Dialogue/dialogue_screen.tscn")
#var _dialog_data: Dictionary = {
	#0: {
		#"faceset": "res://Dialogue/assets/faceset-b.png",
		#"dialog": "Testandooo",
		#"title": "Junin"
		#
	#},
	#1: {
		#"faceset": "res://Dialogue/assets/faceset-b.png",
		#"dialog": "Teste Teste Teste Teste",
		#"title": "Junin"
		#
	#},
	#2: {
		#"faceset": "res://Dialogue/assets/faceset-w.png",
		#"dialog": "Mais testes",
		#"title": "Oswald"
		#
	#},
	#3: {
		#"faceset": "res://Dialogue/assets/faceset-b.png",
		#"dialog": "Ok chega",
		#"title": "Junin"
		#
	#}
	#
#}
#
#@export_category("Objects")
#@export var _hud: CanvasLayer = null
#
#
func _process(_delta: float) -> void:
	sair_do_jogo()
	#if Input.is_action_just_pressed("ui_interact"):
		#var _new_dialog: DialogScreen = _DIALOG_SCREEN.instantiate()
		#_new_dialog.data = _dialog_data
		#_hud.add_child(_new_dialog)
		
func sair_do_jogo() -> void:
	if Input.is_action_just_pressed("esc"):
		get_tree().quit()
