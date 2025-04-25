extends Control

var prox_level = preload("res://cenas/main_menu.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_rejogar_pressed():
	Globals.reiniciar()
	get_tree().change_scene_to_packed(prox_level)

func _on_sair_pressed():
	get_tree().quit()
