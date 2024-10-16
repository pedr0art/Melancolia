extends Node2D
@onready var cutscene = $cutscene
@onready var transition = $Transition
var prox_level = preload("res://cenas/main_menu.gd")
# Called when the node enters the scene tree for the first time.
var comeca = false
func _ready():
	transition.play("fade_in_cuts")
	cutscene.play("cutscene_1")
	comeca = true
	Globals.cuts = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Globals.segue:
		cutscene.play("cutscene_2")

func run_dialogue(dialogue_string):
	Globals.is_chatting = true
	Dialogic.start(dialogue_string)




func _on_cutscene_animation_finished(anim_name):
	if anim_name == "cutscene_2":
		get_tree().change_scene_to_packed(prox_level)
		Globals.cuts = false
