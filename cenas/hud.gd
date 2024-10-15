extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	$insight.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("tab"):
		$insight.visible = not $insight.visible

