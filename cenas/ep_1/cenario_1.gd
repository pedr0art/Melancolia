extends Node2D


var resource = load("res://DialogueManager/tutorial.dialogue")
func _ready() -> void:
	if NavigationManager.spawn_door_tag != null:
		_on_level_spawn(NavigationManager.spawn_door_tag)
	if Globals.first_turorial:
		DialogueManager.show_dialogue_balloon(resource, "start")
		Globals.first_turorial = false
	else:
		pass

func _on_level_spawn(destination_tag: String):
	var door_path = "Doors/Door_" + destination_tag
	var door = get_node(door_path)  
	NavigationManager.trigger_player_spawn(door.spawn.global_position, door.spawn_direction)
