extends Button

func _process(delta: float) -> void:
	if Globals.gabinete or Globals.is_chatting or Globals.texto_psico:
		visible = false
	else:
		visible = true
	if Globals.novo:
		$Sprite2D.visible = true
	else:
		$Sprite2D.visible = false


func _on_pressed() -> void:
	Globals.apertou = true
	
