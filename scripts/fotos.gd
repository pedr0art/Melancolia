extends Node2D
var sprite_texture: Texture2D
var player_in_area = false
@export var ID = "3"
var ja_foi = false
@onready var sfx_item = $sfx_item


# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.signal_event.connect(DialogicSignal)
	sprite_texture = load("res://Images/insight/" + ItemData.get_texture(ID))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		if player_in_area and !Globals.is_chatting:
			if Input.is_action_just_pressed("ui_interact"):
				run_dialogue("fotos")
				if !ja_foi:
					get_parent().find_child("Inventory").add_item(ID)
					sfx_item.play()
					ja_foi = true


func run_dialogue(dialogue_string):
	Globals.is_chatting = true
	Dialogic.start(dialogue_string)

func DialogicSignal(arg: String):
	if arg == "ande":
		Globals.is_chatting = false
	elif arg == "prim" and Globals.primeiro:
			run_dialogue("TAB")
			Globals.primeiro = false

func _on_chat_detection_body_entered(body):
	if body.has_method("player"): 
		player_in_area = true
		var animated_sprite = body.get_node("AnimatedSprite2D")
		if animated_sprite and !Globals.is_chatting:
			animated_sprite.visible = true # Torna a sprite visível


func _on_chat_detection_body_exited(body):
	if body.has_method("player"): 
		player_in_area = false
		var animated_sprite = body.get_node("AnimatedSprite2D")
		if animated_sprite:
			animated_sprite.visible = false
