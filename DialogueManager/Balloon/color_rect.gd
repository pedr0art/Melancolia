extends ColorRect

func _process(delta: float) -> void:
	if Globals.alternat:
		visible = true
	else: 
		visible = false
