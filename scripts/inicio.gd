extends Node2D

@onready var transition = $Transition
var prox_level = preload("res://Management/level.tscn")
@onready var hud_contador = $HUDContador
@onready var color_rect = $Transition/ColorRect

# Called when the node enters the scene tree for the first time.
func _ready():
	color_rect.visible = true
	transition.play("fade_in_cuts")
	Dialogic.start("conversapsico")
	Dialogic.signal_event.connect(Dialogic_Signal)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func Dialogic_Signal(arg: String):
	if arg == "avance":
		transition.play("fade_out_cuts")
		hud_contador.visible = false
		


func _on_transition_animation_finished(anim_name):
	if anim_name == "fade_out_cuts":
		get_tree().change_scene_to_packed(prox_level)
	elif anim_name == "fade_in_cuts":
		hud_contador.visible
