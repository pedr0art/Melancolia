extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("R"):
		$inventario.visible = not $inventario.visible

func add_item_inventory(sprite: Texture) -> bool:
	for slot in $inventario/container.get_children():
		if slot.get_node("sprite").texture == null:
			slot.get_node("sprite").texture = sprite
			return true
	return false
