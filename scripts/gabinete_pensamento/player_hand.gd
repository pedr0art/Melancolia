extends Node2D

const CARD_WIDTH = 60
const HAND_Y_POSITION = 320
const DEFAULT_CARD_MOVE_SPEED = 0.1
const MAX_VISIBLE_CARDS = 7
const LEFT_SCROLL_LIMIT = 100  # Não ultrapassar x = 100
const LEFT_LIMIT_X = 100       # Novo limite fixo

var player_hand = []
var scroll_offset := 0.0

func add_card_to_hand(card, speed):
	if card not in player_hand:
		player_hand.insert(0, card)
		update_hand_positions(speed)
	else:
		animate_card_to_position(card, card.starting_position, DEFAULT_CARD_MOVE_SPEED)

func update_hand_positions(speed):
	var total_width = (player_hand.size() - 1) * CARD_WIDTH
	var base_x = max(LEFT_LIMIT_X, 640 / 2 - total_width / 2)

	for i in range(player_hand.size()):
		var new_position = Vector2(base_x + i * CARD_WIDTH + scroll_offset, HAND_Y_POSITION)
		var card = player_hand[i]
		card.starting_position = new_position
		animate_card_to_position(card, new_position, speed)

func animate_card_to_position(card, new_position, speed):
	var tween = get_tree().create_tween()
	tween.tween_property(card, "position", new_position, speed)

func remove_card_from_hand(card):
	if card in player_hand:
		player_hand.erase(card)
		update_hand_positions(DEFAULT_CARD_MOVE_SPEED)

func _unhandled_input(event: InputEvent) -> void:
	if player_hand.size() > MAX_VISIBLE_CARDS and event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP and event.pressed:
			scroll_offset = min(scroll_offset + CARD_WIDTH, LEFT_SCROLL_LIMIT)
			update_hand_positions(DEFAULT_CARD_MOVE_SPEED)
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN and event.pressed:
			var max_scroll = -((player_hand.size() - MAX_VISIBLE_CARDS) * CARD_WIDTH)
			scroll_offset = max(scroll_offset - CARD_WIDTH, max_scroll)
			update_hand_positions(DEFAULT_CARD_MOVE_SPEED)
