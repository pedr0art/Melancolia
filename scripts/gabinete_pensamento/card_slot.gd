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

		# Carrega e instancia a cena da carta
		var card_scene = preload("res://scripts/gabinete_pensamento/cenas/card.tscn")
		var carta_restaurada = card_scene.instantiate()

		# Configura visual e dados
		var card_image_path = "res://Images/Cards/%s.png" % nome_carta
		carta_restaurada.get_node("CardImage").texture = load(card_image_path)
		carta_restaurada.classe = GabinetePensamento.card_database[nome_carta][0]
		carta_restaurada.certo_errado = GabinetePensamento.card_database[nome_carta][1]
		carta_restaurada.name = "Card"

		# Adiciona no card manager
		card_manager_reference.add_child(carta_restaurada)
		carta_restaurada.position = position
		carta_restaurada.get_node("Area2D/CollisionShape2D").disabled = true
		card_armazenado = carta_restaurada
		card_in_slot = true
		carta_restaurada.was_placed_in_slot = true
		carta_restaurada.current_card_slot = self
		carta_restaurada.scale = Vector2(0.05, 0.05)
		carta_restaurada.z_index = 100

		if carta_restaurada.certo_errado == "certo":
			GabinetePensamento.slots_certos += 1

func _process(delta: float) -> void:
	if card_in_slot:
		$ReturnButton.visible = true
		# Quando a carta for colocada corretamente no slot
		GabinetePensamento.slots_salvos[slot_id] = card_armazenado.nome
	else:
		$ReturnButton.visible = false
	if card_armazenado != null and certo==true:
		if card_armazenado.certo_errado == "certo":
			GabinetePensamento.slots_certos += 1
			print(GabinetePensamento.slots_certos)
			certo = false
		else:
			pass
func _on_return_button_pressed() -> void:
	if card_armazenado.was_placed_in_slot:
		if card_armazenado.current_card_slot:
			card_armazenado.current_card_slot.card_in_slot = false  # Libera o slot
			GabinetePensamento.slots_salvos.erase(slot_id)
			if card_armazenado.certo_errado == "certo":
				GabinetePensamento.slots_certos -= 1
				print(GabinetePensamento.slots_certos)
			else:
				pass
			
		card_armazenado.was_placed_in_slot = false
		card_armazenado.current_card_slot = null
		card_armazenado.get_node("Area2D/CollisionShape2D").disabled = false  # Reativa colisão
		card_manager_reference.player_hand_reference.add_card_to_hand(card_armazenado, 0.2)
