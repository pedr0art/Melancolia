extends Node2D

const DEFAULT_CARD_MOVE_SPEED = 0.1

var screen_size
var card_being_dragged 
var is_hovering_on_card
var player_hand_reference
var deck_reference
@onready var conteudo_item: RichTextLabel = $"../conteudo_item"
@onready var nome_item: RichTextLabel = $"../nome_item"
@onready var conteudo_database = preload("res://scripts/gabinete_pensamento/DIALOGOS_CARTAS_DATABASE.gd")
var current_hovered_card = null

func _ready() -> void:
	screen_size = get_viewport_rect().size
	player_hand_reference = $"../PlayerHand"
	deck_reference = $"../Deck"
	$"../InputManager".connect("left_mouse_button_released", on_left_click_released)
	if Globals.restart:
		resetar_slots()
		Globals.restart = false
func _process(delta: float) -> void:
	if card_being_dragged:
		var mouse_pos = get_global_mouse_position()
		card_being_dragged.position = Vector2(
			clamp(mouse_pos.x, 0, screen_size.x),
			clamp(mouse_pos.y, 0, screen_size.y)
		)
	
			

func start_drag(card):
	card_being_dragged = card
	card.scale = Vector2(1, 1)
	card.z_index = 12
	Globals.is_dragging = true
	Globals.carta_atual = card

func finish_drag():
	card_being_dragged.scale = Vector2(1.10, 1.10)

	var card_slot_found = get_slot_under_card(card_being_dragged)
	if card_slot_found and not card_slot_found.card_in_slot:
		if card_being_dragged.classe == card_slot_found.classe:
			player_hand_reference.remove_card_from_hand(card_being_dragged)
			card_being_dragged.position = card_slot_found.position
			card_being_dragged.get_node("Area2D/CollisionShape2D").disabled = true
			card_slot_found.card_armazenado = card_being_dragged
			card_slot_found.card_in_slot = true
			card_being_dragged.was_placed_in_slot = true
			card_being_dragged.current_card_slot = card_slot_found
			card_slot_found.certo = true
			GabinetePensamento.verificar_se_tudo_certo()
		else:
			player_hand_reference.add_card_to_hand(card_being_dragged, DEFAULT_CARD_MOVE_SPEED)
	else:
		player_hand_reference.add_card_to_hand(card_being_dragged, DEFAULT_CARD_MOVE_SPEED)

	Globals.is_dragging = false
	Globals.carta_atual = null
	card_being_dragged = null
	current_hovered_card = null

func connect_card_signals(card):
	card.connect("hovered", on_hovered_over_card)
	card.connect("hovered_off", on_hovered_off_card)

func on_left_click_released():
	if card_being_dragged:
		finish_drag()

func on_hovered_over_card(card):
	is_hovering_on_card = true
	highlight_card(card, true)
	current_hovered_card = card
	descricao()
func on_hovered_off_card(card):
	if !card_being_dragged:
		highlight_card(card, false)
		var new_card_hovered = raycast_check_for_card()
		if new_card_hovered:
			highlight_card(new_card_hovered, true)
			current_hovered_card = new_card_hovered
			descricao()
		else:
			is_hovering_on_card = false
			current_hovered_card = null

func highlight_card(card, hovered):
	if hovered:
		card.scale = Vector2(1.1, 1.1)
		card.z_index = 4
	else:
		card.scale = Vector2(1, 1)
		card.z_index = 2

func get_slot_under_card(card):
	var card_rect = get_card_rect(card)
	for slot in $"../CardSlots".get_children():
		var slot_rect = get_slot_rect(slot)
		if card_rect.intersects(slot_rect):
			return slot
	return null

func get_card_rect(card):
	var area = card.get_node("Area2D")
	var shape = area.get_node("CollisionShape2D").shape
	var size = shape.get_rect().size
	var pos = area.get_global_transform_with_canvas().origin
	return Rect2(pos - size / 2, size)

func get_slot_rect(slot):
	var area = slot.get_node("Area2D")
	var shape = area.get_node("CollisionShape2D").shape
	var size = shape.get_rect().size
	var pos = area.get_global_transform_with_canvas().origin
	return Rect2(pos - size / 2, size)

func raycast_check_for_card():
	var space_state = get_world_2d().direct_space_state
	var parameters = PhysicsPointQueryParameters2D.new()
	parameters.position = get_global_mouse_position()
	parameters.collide_with_areas = true
	parameters.collision_mask = 8  # COLLISION_MASK_CARD
	var result = space_state.intersect_point(parameters)
	if result.size() > 0:
		return get_card_with_highest_z_index(result)
		
	return null

func get_card_with_highest_z_index(cards):
	var highest_z_card = cards[0].collider.get_parent()
	var highest_z_index = highest_z_card.z_index

	for i in range(1, cards.size()):
		var current_card = cards[i].collider.get_parent()
		if current_card.z_index > highest_z_index:
			highest_z_card = current_card
			highest_z_index = current_card.z_index
	return highest_z_card

# Retorna uma cor a partir do nome da cor (usado no banco de dados)
func get_color_from_name(color_name: String) -> Color:
	match color_name.to_lower():
		"red": return Color(1, 0.2, 0.2)
		"blue": return Color(0.2, 0.4, 1)
		"yellow": return Color(1, 1, 0.3)
		"gray": return Color(0.6, 0.6, 0.6)
		"orange": return Color(1, 0.5, 0.1)
		_:
			return Color(1, 1, 1)  # branco padrão se não encontrar
func resetar_slots():
	for slot in get_tree().get_nodes_in_group("card_slots"):
		slot.card_in_slot = false
		slot.card_armazenado = null

func descricao():
	if current_hovered_card:
		var key = current_hovered_card.nome
		if key in conteudo_database.CONTEUDO:
			var data = conteudo_database.CONTEUDO[key]
			conteudo_item.text = data[2]
			
			# Atualiza os textos
			var cor_hex = get_color_from_name(data[1]).to_html()

			nome_item.bbcode_enabled = true

			nome_item.bbcode_text = "[color=" + cor_hex + "]" + data[0] + "[/color]"
