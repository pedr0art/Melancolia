extends Node2D

const CARD_SCENE_PATH = "res://scripts/gabinete_pensamento/cenas/card.tscn"
var card_database_reference
const CARD_DRAW_SPEED = 0.5

func _ready() -> void:
	card_database_reference = preload("res://scripts/gabinete_pensamento/card_database.gd")

	if GabinetePensamento.mao_string.size() > 0:
		draw_cards_from_mao_string()

func _process(delta: float) -> void:
	if GabinetePensamento.compra and GabinetePensamento.player_deck.size() > 0:
		draw_card()

func draw_card():
	var card_drawn_name = GabinetePensamento.item_atual
	if not GabinetePensamento.player_deck.has(card_drawn_name):
		return

	GabinetePensamento.player_deck.erase(card_drawn_name)

	if GabinetePensamento.player_deck.size() == 0:
		$Area2D/CollisionShape2D.disabled = true

	var card_scene = preload(CARD_SCENE_PATH)
	var new_card = card_scene.instantiate()
	var card_image_path = str("res://Images/Cards/" + card_drawn_name + ".png")
	new_card.get_node("CardImage").texture = load(card_image_path)

	new_card.classe = card_database_reference.CARDS[card_drawn_name][0]
	new_card.certo_errado = card_database_reference.CARDS[card_drawn_name][1]
	new_card.nome = card_drawn_name

	$"../CardManager".add_child(new_card)
	new_card.name = "Card"
	$"../PlayerHand".add_card_to_hand(new_card, CARD_DRAW_SPEED)
	new_card.get_node("CardImage").scale = Vector2(0.05, 0.05)
	new_card.get_node("CardImage").z_index = 2

	GabinetePensamento.compra = false

func draw_cards_from_mao_string():
	var mao = GabinetePensamento.mao_string
	for i in range(mao.size() - 1, -1, -1):  # do último ao primeiro
		var card_name = mao[i]

		# 🛑 Pula a carta se ela já estiver nos slots restaurados
		if GabinetePensamento.slots_salvos.values().has(card_name):
			continue

		var card_scene = preload(CARD_SCENE_PATH)
		var new_card = card_scene.instantiate()

		var card_image_path = "res://Images/Cards/" + card_name + ".png"
		new_card.get_node("CardImage").texture = load(card_image_path)

		new_card.classe = card_database_reference.CARDS[card_name][0]
		new_card.certo_errado = card_database_reference.CARDS[card_name][1]
		new_card.nome = card_name

		$"../CardManager".add_child(new_card)
		new_card.name = "Card"
		$"../PlayerHand".add_card_to_hand(new_card, CARD_DRAW_SPEED)

		new_card.get_node("CardImage").scale = Vector2(0.05, 0.05)
		new_card.get_node("CardImage").z_index = 2
