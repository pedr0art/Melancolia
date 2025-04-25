extends CanvasLayer

func _ready() -> void:
	visible = false

func _on_resume_btn_pressed() -> void:
	Globals.paused = false
	visible = false


func _on_quit_btn_pressed() -> void:
	get_tree().quit()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel") and not Globals.texto_psico:
		visible = not visible
		Globals.paused = visible


func _on_menu_btn_pressed() -> void:
	Globals.first_turorial = true
	Globals.reiniciar()
	get_tree().change_scene_to_file("res://cenas/main_menu.tscn")
