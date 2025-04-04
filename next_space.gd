extends Area2D

@export var prox_espaco: String = ""

@export_enum("principal", "escritorio", "chefe", "reuniao", "copa", "banheiro fem") var saindo_de: String
@export_enum("principal", "escritorio", "chefe", "reuniao", "copa", "banheiro fem", "banheiro masc") var indo_para: String
@export var spawn_direction = "up"
@onready var spawn: Marker2D = $spawn

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		NavigationManager.go_to_level(indo_para, saindo_de)
		
