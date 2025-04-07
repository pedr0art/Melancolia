extends Area2D

@export var prox_espaco: String = ""

@export_enum("principal", "escritorio", "chefe", "reuniao", "copa", "banheiro fem", "banheiro masc") var destination_level_tag: String
@export_enum("principal", "escritorio", "chefe", "reuniao", "copa", "banheiro fem") var destination_door_tag: String

@export var spawn_direction = "up"
@onready var spawn: Marker2D = $spawn
var resource = load("res://DialogueManager/banheiro_masc.dialogue")
func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		NavigationManager.go_to_level(destination_level_tag, destination_door_tag)
		if prox_espaco == "banheiro_masc":
			DialogueManager.show_dialogue_balloon(resource, "start")
			
		
		
