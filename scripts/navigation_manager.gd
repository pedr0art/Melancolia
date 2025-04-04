extends Node

const scene_principal = preload("res://cenas/ep_1/cenario1.tscn")
const scene_escritorio = preload("res://cenas/ep_1/escritorio_principal.tscn")
const scene_chefe = preload("res://cenas/ep_1/sala_chefe.tscn")
const scene_copa = preload("res://cenas/ep_1/copa.tscn")
const scene_banheiro = preload("res://cenas/ep_1/banheiro.tscn")
const scene_reuniao = preload("res://cenas/ep_1/sala_reuniao.tscn")

signal on_trigger_player_spawn

var spawn_door_tag
#"principal", "escritorio", "chefe", "reuniao", "copa", "banheiro fem", "banheiro masc"
func go_to_level(level_tag, destination_tag):
	var scene_to_load
	
	match level_tag:
		"principal":
			scene_to_load = scene_principal
		"escritorio":
			scene_to_load = scene_escritorio
		"chefe":
			scene_to_load = scene_chefe
		"reuniao":
			scene_to_load = scene_reuniao
		"copa":
			scene_to_load = scene_copa
		"banheiro fem":
			scene_to_load = scene_banheiro
	
	if scene_to_load != null:
		spawn_door_tag = destination_tag
		get_tree().change_scene_to_packed(scene_to_load)
		
func trigger_player_spawn(position: Vector2, direction: String):
	on_trigger_player_spawn.emit(position, direction)
