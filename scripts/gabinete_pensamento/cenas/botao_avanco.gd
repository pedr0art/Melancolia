extends Button

func _ready() -> void:
	disabled = true
	
func _process(delta: float) -> void:
	if GabinetePensamento.avanco:
		disabled = false
	else:
		disabled = true
