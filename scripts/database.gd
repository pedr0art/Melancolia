extends Node

var content : Dictionary

func _ready():
	var file = FileAccess.open("res://scripts/database.json", FileAccess.READ)
	
	content = JSON.parse_string(file.get_as_text())
	
	file.close()
	
func get_texture(ID = "0"):
	return content[ID]["texture"]
