extends Control

@onready var transition = $Transition
var prox_level = preload("res://cenas/inicio.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_pressed():
	transition.play("fade_out")
	


func _on_sair_pressed():
	get_tree().quit()


func _on_transition_animation_finished(anim_name):
	get_tree().change_scene_to_packed(prox_level)
