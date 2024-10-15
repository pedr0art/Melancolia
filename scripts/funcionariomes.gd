extends Node2D

var player_in_area = false
var sprite_texture: Texture2D
@export var ID = "4"
var ja_foi = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	Dialogic.signal_event.connect(DialogicSignal)
	sprite_texture = load("res://Images/insight/" + ItemData.get_texture(ID))
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		if player_in_area and !Globals.is_chatting:
			if Input.is_action_just_pressed("ui_interact"):
				run_dialogue("funcionariomes")
				get_parent().find_child("Inventory").add_item(ID)
				ja_foi = true
			

func run_dialogue(dialogue_string):
	Globals.is_chatting = true
	Dialogic.start(dialogue_string)

func DialogicSignal(arg: String):
	if arg == "ande":
		Globals.is_chatting = false

func _on_chat_detection_body_entered(body):
	if body.has_method("player"): 
		player_in_area = true
		var animated_sprite = body.get_node("AnimatedSprite2D")
		if animated_sprite:
			animated_sprite.visible = true # Torna a sprite visível


func _on_chat_detection_body_exited(body):
	if body.has_method("player"): 
		player_in_area = false
		var animated_sprite = body.get_node("AnimatedSprite2D")
		if animated_sprite:
			animated_sprite.visible = false
