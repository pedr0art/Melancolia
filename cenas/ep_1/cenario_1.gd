extends Node2D
@onready var transition: AnimationPlayer = $Control/transition
@onready var color_rect: ColorRect = $Control/transition/ColorRect


var resource = load("res://DialogueManager/tutorial.dialogue")
func _ready() -> void:
	if NavigationManager.spawn_door_tag != null:
		_on_level_spawn(NavigationManager.spawn_door_tag)
	if Globals.first_turorial:
		color_rect.visible = true
		transition.play("fade_in")
		DialogueManager.show_dialogue_balloon(resource, "start")
	else:
		color_rect.visible = false

func _on_level_spawn(destination_tag: String):
	var door_path = "Doors/Door_" + destination_tag
	var door = get_node(door_path)  
	NavigationManager.trigger_player_spawn(door.spawn.global_position, door.spawn_direction)


func _on_transition_animation_finished(anim_name: StringName) -> void:
	if anim_name == "fade_in":
		color_rect.visible = false
