extends CanvasLayer

func _ready() -> void:
	visible = false

func _process(delta: float) -> void:
	if Globals.texto_psico:
		visible = true
	if DialogoTracker.juntetextos:
		$RichTextLabel.text = DialogoTracker.get_textofinal_formatado()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		if Globals.texto_psico:
			visible = false
			Globals.texto_psico = false
			get_viewport().set_input_as_handled()  # <- evita que o outro _unhandled_input veja este evento

func _on_botao_voltar_pressed() -> void:
	visible = false
	Globals.texto_psico = false
