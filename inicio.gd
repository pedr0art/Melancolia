extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	Dialogic.start("conversapsico")
	Dialogic.signal_event.connect(Dialogic_Signal)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func Dialogic_Signal(arg: String):
	if arg == "avance":
		get_tree().change_scene_to_file("res://Management/level.tscn")
