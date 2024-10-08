extends Node2D

var player_in_area = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	Dialogic.signal_event.connect(DialogicSignal)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		if player_in_area:
			if Input.is_action_just_pressed("ui_interact"):
				run_dialogue("alice")
			

func run_dialogue(dialogue_string):
	Globals.is_chatting = true
	Dialogic.start(dialogue_string)

func DialogicSignal(arg: String):
	if arg == "ande":
		Globals.is_chatting = false

func _on_chat_detection_body_entered(body):
	if body.has_method("player"): 
		player_in_area = true


func _on_chat_detection_body_exited(body):
	if body.has_method("player"): 
		player_in_area = false
