extends TextureRect
@onready var property: Dictionary = {"TEXTURE":  texture}:

	set(value):
		property = value
		
		texture = property["TEXTURE"]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
