extends Node2D
@onready var cutscene = $cutscene
@onready var transition = $Transition
var resource = load("res://DialogueManager/cutscene.dialogue")
var prox_level = preload("res://sounds/musics/fim.tscn")
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var player_cutscene: Sprite2D = $player_cutscene
@onready var color_rect: ColorRect = $Transition/ColorRect

# Called when the node enters the scene tree for the first time.
var comeca = false
func _ready():
	transition.play("fade_in_cuts")
	cutscene.play("cutscene_1")
	comeca = true
	Globals.cuts = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Globals.segue and Globals.cuts:
		cutscene.play("cutscene_2")

func dialogue():
	DialogueManager.show_dialogue_balloon(resource, "start")


func play_anim(animation_name) -> void:
	animation_player.play(animation_name)

func _on_cutscene_animation_finished(anim_name):
	if anim_name == "cutscene_2":
		transition.play("fade_out_cuts")
		Globals.cuts = false


func _on_transition_animation_finished(anim_name: StringName) -> void:
	if anim_name == "fade_out_cuts":
		get_tree().change_scene_to_packed(prox_level)
	elif anim_name == "fade_in_cuts":
		color_rect.visible = false
