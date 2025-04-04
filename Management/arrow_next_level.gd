extends Node2D

@onready var baixo: Sprite2D = $baixo
@onready var direita: Sprite2D = $direita
@onready var esquerda: Sprite2D = $esquerda
@onready var cima: Sprite2D = $cima

@onready var anim_baixo: AnimationPlayer = $anim_baixo
@onready var anim_cima: AnimationPlayer = $anim_cima
@onready var anim_direita: AnimationPlayer = $anim_direita
@onready var anim_esquerda: AnimationPlayer = $anim_esquerda


@export_enum("cima", "baixo", "direita", "esquerda") var pos: String


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		if pos == "cima":
			cima.visible = true
			anim_cima.play("arrow_cima")
		elif pos == "baixo":
			baixo.visible = true
			anim_baixo.play("arrow")
		elif pos == "direita":
			direita.visible = true
			anim_direita.play("anim_dir")
		elif pos == "esquerda":
			esquerda.visible = true
			anim_esquerda.play("anim_esq")


func _on_body_exited(body: Node2D) -> void:
	cima.visible = false
	baixo.visible = false
	esquerda.visible = false
	direita.visible = false
