extends CanvasLayer


func _process(delta: float) -> void:
	if Globals.is_chatting or Globals.gabinete or Globals.texto_psico or Globals.first_turorial:
		visible = false
	else:
		visible = true
