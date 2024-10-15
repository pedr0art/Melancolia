extends Node2D

@onready var transition = $Transition
var prox_level = preload("res://Management/level.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	transition.play("fade_in")
	Dialogic.start("conversapsico")
	Dialogic.signal_event.connect(Dialogic_Signal)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func Dialogic_Signal(arg: String):
	if arg == "avance":
		transition.play("fade_out")
		


func _on_transition_animation_finished(anim_name):
	if anim_name == "fade_out":
		get_tree().change_scene_to_packed(prox_level)
