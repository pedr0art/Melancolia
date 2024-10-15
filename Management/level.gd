extends Node2D

func _ready():
	pass


func _process(_delta: float) -> void:
	sair_do_jogo()
	if Globals.is_correct:
		print("DEU CERTO")

func sair_do_jogo() -> void:
	if Input.is_action_just_pressed("esc"):
		get_tree().quit()
