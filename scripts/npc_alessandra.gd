extends Node2D

var resource = load("res://DialogueManager/chefe_chat.dialogue")
var falando = false
var player_in_area = false
@onready var sprite_2d: Sprite2D = $Sprite2D

func _ready():
	sprite_2d.visible = false
	# Se o item ainda não foi coletado, o NPC não aparece


func _process(_delta):
	if "placeholder_blue" in GabinetePensamento.itens_coletados:
		if player_in_area and not Globals.is_chatting and not falando:
			sprite_2d.visible = true
			if Input.is_action_just_pressed("ui_interact"):
				falando = true
				sprite_2d.visible=false
				DialogueManager.show_dialogue_balloon(resource, "start")
	if not Globals.is_chatting:
		falando = false
func _on_chat_detection_body_entered(body):
	if body.has_method("player"): 
		player_in_area = true


func _on_chat_detection_body_exited(body):
	if body.has_method("player"): 
		player_in_area = false
		sprite_2d.visible = false
