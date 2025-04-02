extends Control


var prox_level = preload("res://cenas/inicio.tscn")

@onready var transition = $Transition


# Called when the node enters the scene tree for the first tim


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	sair_do_jogo()
	if Input.is_action_just_pressed("ENTER"):
		get_tree().change_scene_to_packed(prox_level)


func _on_start_pressed():
	transition.play("fade_out_cuts")
	


func _on_sair_pressed():
	get_tree().quit()


func sair_do_jogo() -> void:
	if Input.is_action_just_pressed("esc"):
		get_tree().quit()





func _on_transition_animation_finished(anim_name):
	if anim_name == "fade_out_cuts":
		get_tree().change_scene_to_packed(prox_level)
