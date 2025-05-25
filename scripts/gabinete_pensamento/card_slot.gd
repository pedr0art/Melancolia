extends Node2D

@export var classe : String

var card_in_slot = false
var card_armazenado
var card_manager_reference
var nome_carta_atual
var certo = false
var slot_id

func _ready() -> void:
	card_manager_reference = $"../../CardManager"
	slot_id = get_index()

	if GabinetePensamento.slots_salvos.has(slot_id):
		var nome_carta = GabinetePensamento.slots_salvos[slot_id]

		if nome_carta != null and nome_carta != "":
			var card_scene = preload("res://scripts/gabinete_pensamento/cenas/card.tscn")
			var carta_restaurada = card_scene.instantiate()

			# Garante que a carta armazenará o nome corretamente
			carta_restaurada.nome = nome_carta

			# Caminho da imagem
			var card_image_path = "res://Images/Cards/%s.png" % nome_carta
			if ResourceLoader.exists(card_image_path):
				carta_restaurada.get_node("CardImage").texture = load(card_image_path)
			else:
				push_error("⚠️ Imagem não encontrada: %s" % card_image_path)

			# Configurações da carta
			carta_restaurada.classe = GabinetePensamento.card_database[nome_carta][0]
			carta_restaurada.certo_errado = GabinetePensamento.card_database[nome_carta][1]
			carta_restaurada.name = "Card"

			# Adiciona a carta ao jogo
			card_manager_reference.add_child(carta_restaurada)
			carta_restaurada.position = position
			carta_restaurada.get_node("Area2D/CollisionShape2D").disabled = true
			card_armazenado = carta_restaurada
			card_in_slot = true
			carta_restaurada.was_placed_in_slot = true
			carta_restaurada.current_card_slot = self
			carta_restaurada.scale = Vector2(0.05, 0.05)
			carta_restaurada.z_index = 100

			GabinetePensamento.verificar_se_tudo_certo()
		else:
			pass

func _process(delta: float) -> void:
	if card_in_slot:
		$ReturnButton.visible = true
		GabinetePensamento.slots_salvos[slot_id] = card_armazenado.nome
	else:
		$ReturnButton.visible = false

	if card_armazenado != null and certo == true:
		if card_armazenado.certo_errado == "certo":
			GabinetePensamento.slots_certos += 1
			certo = false

func _on_return_button_pressed() -> void:
	if card_armazenado.was_placed_in_slot:
		if card_armazenado.current_card_slot:
			card_armazenado.current_card_slot.card_in_slot = false
			GabinetePensamento.slots_salvos.erase(slot_id)
			GabinetePensamento.verificar_se_tudo_certo()
			if card_armazenado.certo_errado == "certo":
				GabinetePensamento.slots_certos -= 1

		card_manager_reference.padronizar_carta_para_mao(card_armazenado)
		card_manager_reference.player_hand_reference.add_card_to_hand(card_armazenado, 0.2)
