extends Control


# Called when the node enters the scene tree for the first time.
func _can_drop_data(at_position, data):
	return true
	return false
	
func _drop_data(at_position, data):
	data.get_parent().remove_child(data)
	add_child(data)
