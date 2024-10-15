extends Control

@onready var texture_rect = $TextureRect
@export var num_slot : int
var filled : bool = false


func _get_drag_data(at_position):
	
	set_drag_preview(get_preview())
	
	return texture_rect
	
func _can_drop_data(at_position, data):
	if Globals.all_in:
		return data is TextureRect
	
func _drop_data(at_position, data):
	var temp = texture_rect.property
	texture_rect.property = data.property
	data.property = temp
	
func get_preview():
	var preview_texture = TextureRect.new()
	
	preview_texture.texture = texture_rect.texture
	preview_texture.expand_mode = 1
	preview_texture.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	preview_texture.size = Vector2(30,30)
	
	var preview = Control.new()
	preview.add_child(preview_texture)
	
	return preview

func get_pos():
	return texture_rect.pos

func set_property(data):
	texture_rect.property = data

	if data["TEXTURE"] == null:
		filled = false
	else: 
		filled = true
