extends Node2D

@onready var transition = $Transition
@export var prox_level : PackedScene

# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _fade_out():
	transition.play("fade_out")
	

func _on_transition_animation_finished(anim_name):
	get_tree().change_scene_to_packed(prox_level)
