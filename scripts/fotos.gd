extends Node2D
var sprite_texture: Texture2D
var player_in_area = false
@export var ID = "0"



# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.signal_event.connect(DialogicSignal)
	sprite_texture = load("res://Images/insight/" + ItemData.get_texture(ID))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		if player_in_area and !Globals.is_chatting:
			if Input.is_action_just_pressed("ui_interact"):
				run_dialogue("fotos")
			elif Input.is_action_just_pressed("F"):
				get_parent().find_child("Inventory").add_item(ID)


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
		

