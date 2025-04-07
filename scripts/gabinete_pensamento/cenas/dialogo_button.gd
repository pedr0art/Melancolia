extends Button


func _process(delta: float) -> void:
	if Globals.is_chatting or Globals.gabinete or Globals.texto_psico:
		visible = false
	else:
		visible = true

func _on_pressed() -> void:
	Globals.texto_psico = true
