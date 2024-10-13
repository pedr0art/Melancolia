extends Node2D

@export var num_obj : int
@export var sprite_texture: Texture2D
var draggable = false
var is_inside_dropable = false
var body_ref
var offset: Vector2
var initialPos: Vector2
var aligned: bool = false

func _ready():
	var sprite = $Sprite2D
	if sprite_texture:
		sprite.texture = sprite_texture
	initialPos = global_position


func _process(delta):
	if draggable:
		if Input.is_action_just_pressed("mb"):
			offset = get_global_mouse_position() - global_position
			Globals.is_dragging = true
		if Input.is_action_pressed("mb"):
			global_position = get_global_mouse_position() - offset
		elif Input.is_action_just_released("mb"):
			Globals.is_dragging = false
			var tween = get_tree().create_tween()
			if is_inside_dropable and !body_ref.is_occupied:
				body_ref.is_occupied = true
				tween.tween_property(self, "position", body_ref.position, 0.2).set_ease(Tween.EASE_OUT)
			else:
				tween.tween_property(self, "global_position", initialPos, 0.2).set_ease(Tween.EASE_OUT)
			
		


func _on_area_2d_body_entered(body):
	if body.is_in_group('dropable'):
		is_inside_dropable = true
		body.modulate = Color(Color.REBECCA_PURPLE,1)
		body_ref = body
		if body.has_method("get_valor"):
			var valor_b = body.get_valor()
			if num_obj == valor_b:
				print("Os valores são iguais: %s" % num_obj)
				aligned = true
			else:
				print("Os valores são diferentes. A: %s, B: %s" % [num_obj, valor_b])
				aligned = false


func _on_area_2d_body_exited(body):
	if body.is_in_group('dropable'):
		is_inside_dropable = false
		body.modulate = Color(Color.MEDIUM_PURPLE, 0.7)
		
	if body_ref == body:  # Verifica se o corpo que saiu é o mesmo que estava referenciado
		body_ref.is_occupied = false  # Marca o slot como não ocupado
		body_ref = null  # Limpa a referência ao corpo


func _on_area_2d_mouse_entered():
	if not Globals.is_dragging:
		draggable = true
		scale = Vector2(1.05,1.05)


func _on_area_2d_mouse_exited():
	if not Globals.is_dragging:
		draggable = false
		scale = Vector2(1,1)
		
func is_aligned() -> bool:
	return aligned
