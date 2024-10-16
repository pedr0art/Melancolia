extends Control


var prox_level = preload("res://cenas/inicio.tscn")

@onready var transition = $Transition

# Called when the node enters the scene tree for the first time.
func _ready():
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	if Globals.restart:
		get_tree().reload_current_scene()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_pressed():
	transition.play("fade_out_cuts")
	


func _on_sair_pressed():
	get_tree().quit()








func _on_transition_animation_finished(anim_name):
	if anim_name == "fade_out_cuts":
		get_tree().change_scene_to_packed(prox_level)
