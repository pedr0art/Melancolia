extends Node2D

@onready var transition = $Transition
var prox_level = preload("res://cenas/ep_1/cenario1.tscn")
@onready var color_rect = $Transition/ColorRect
var avanco = false
var resource = load("res://DialogueManager/psico.dialogue")
# Called when the node enters the scene tree for the first time.
func _ready():
	color_rect.visible = true
	transition.play("fade_in_cuts")
	DialogueManager.show_dialogue_balloon(resource, "start")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if avanco: transition.play("fade_out_cuts")
		
func _on_transition_animation_finished(anim_name):
	if anim_name == "fade_out_cuts":
		get_tree().change_scene_to_packed(prox_level)
		avanco = false
	elif anim_name == "fade_in_cuts":
		color_rect.visible = false
