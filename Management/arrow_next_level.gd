extends Node2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

@onready var sprite_2d_2: Sprite2D = $Sprite2D2
@onready var animation_player_2: AnimationPlayer = $AnimationPlayer2

@export var pos = ""


func _on_body_entered(body: Node2D) -> void:
	if pos == "cima":
		sprite_2d_2.visible = true
		animation_player_2.play("arrow_cima")
	elif pos == "baixo":
		sprite_2d.visible = true
		animation_player.play("arrow")


func _on_body_exited(body: Node2D) -> void:
	sprite_2d_2.visible = false
	sprite_2d.visible = false
