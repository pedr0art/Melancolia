extends Sprite2D
func _ready() -> void:
	visible = false
func _process(delta: float) -> void:
	if Globals.mostra != "":
		texture = load(Globals.mostra)
		$AnimationPlayer.play("item_novo")
		visible = true
	else:
		visible = false
		$AnimationPlayer.stop
