extends TextureRect
@export var pos = 0:
	set(value):
		pos = value
		%ordem.text = str(pos)

@onready var property: Dictionary = {"TEXTURE":  texture,
									"POS": pos}:

	set(value):
		property = value
		
		texture = property["TEXTURE"]
		pos = property["POS"] 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
