extends Node2D

@export var dialogo: String = ""
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var exclamation: Sprite2D = $exclamation


func _on_area_2d_body_entered(body: Node2D) -> void:
	exclamation.visible = true
	animation_player.play("exclamation")


func _on_area_2d_body_exited(body: Node2D) -> void:
	animation_player.pause()
	exclamation.visible = false
