extends Node2D

@onready var transition = $Transition

var prox_level = preload("res://cenas/cutscene.tscn")
var fim_lev = preload("res://cenas/fim.tscn")
@onready var hud_contador = $HUDContador
var foi = false
func _ready():
	transition.play("fade_in_cuts")
	Dialogic.signal_event.connect(DialogicSignal)


func _process(_delta: float) -> void:
	sair_do_jogo()
	if Globals.is_wrong:
		get_tree().change_scene_to_packed(fim_lev)
	if Globals.is_correct:
		transition.play("fade_out_cuts")

	if Globals.all_in and !Globals.is_chatting:
		if !foi:
			run_dialogue("explicacao_insight")
			foi = true

func sair_do_jogo() -> void:
	if Input.is_action_just_pressed("esc"):
		get_tree().quit()


func _on_transition_animation_finished(anim_name):
	if anim_name == "fade_out_cuts":
		get_tree().change_scene_to_packed(prox_level)
	elif anim_name == "fade_in_cuts":
		hud_contador.visible = true

func run_dialogue(dialogue_string):
	Globals.is_chatting = true
	Dialogic.start(dialogue_string)

func DialogicSignal(arg: String):
	if arg == "ande":
		Globals.is_chatting = false
