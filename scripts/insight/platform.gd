extends StaticBody2D

@export var num_plataforma : int
var is_occupied: bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Globals.is_dragging:
		visible = true
	else:
		visible = false

func get_valor() -> int:
	return num_plataforma
