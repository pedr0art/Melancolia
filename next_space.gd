extends Area2D

@export var prox_espaco: String = ""

func _on_body_entered(body: Node2D) -> void:
		if prox_espaco != "":
			get_tree().change_scene_to_file(prox_espaco)
