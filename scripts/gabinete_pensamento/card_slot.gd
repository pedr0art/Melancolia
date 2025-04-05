extends Node2D

@export var classe : String

var card_in_slot = false
var card_armazenado
var card_manager_reference

func _ready() -> void:
	card_manager_reference = $"../../CardManager"
func _process(delta: float) -> void:
	if card_in_slot:
		$ReturnButton.visible = true
	else:
		$ReturnButton.visible = false
func _on_return_button_pressed() -> void:
	if card_armazenado.was_placed_in_slot:
		if card_armazenado.current_card_slot:
			card_armazenado.current_card_slot.card_in_slot = false  # Libera o slot
		card_armazenado.was_placed_in_slot = false
		card_armazenado.current_card_slot = null
		card_armazenado.get_node("Area2D/CollisionShape2D").disabled = false  # Reativa colisão
		card_manager_reference.player_hand_reference.add_card_to_hand(card_armazenado, 0.2)
