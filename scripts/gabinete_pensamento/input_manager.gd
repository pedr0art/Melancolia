extends Node2D

signal left_mouse_button_clicked
signal left_mouse_button_released

const COLLISION_MASK_CARD = 8
const COLLISION_MASK_DECK = 32

var card_manager_reference
var deck_reference

func _ready() -> void:
	card_manager_reference = $"../CardManager"
	deck_reference = $"../Deck"
	set_process_unhandled_input(true)

func _unhandled_input(event):
	if Input.is_action_pressed("mb"):
		emit_signal("left_mouse_button_clicked")
		check_card_under_mouse()
	elif Input.is_action_just_released("mb"):
		emit_signal("left_mouse_button_released")

# Nova função para detectar cartas no CanvasLayer
func check_card_under_mouse():
	var mouse_pos = get_viewport().get_mouse_position()

	for card in card_manager_reference.get_children():
		var area = card.get_node("Area2D")
		var shape = area.get_node("CollisionShape2D")

		if not area.monitoring or shape.disabled:
			continue

		var global_transform = area.get_global_transform_with_canvas()
		var shape_pos = global_transform.origin
		var rect_size = shape.shape.get_rect().size
		var rect = Rect2(shape_pos - rect_size / 2, rect_size)

		if rect.has_point(mouse_pos):
			card_manager_reference.start_drag(card)
			Globals.is_dragging = true
			Globals.carta_atual = card
			return
