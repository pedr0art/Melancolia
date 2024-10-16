extends Control


@onready var button = $Button  # Acesse o botão
@export var slots_container: Node  # Acesse o nó que contém os slots

func _process(delta):
	if !Globals.all_in:
		%confirmar.disabled = true
	else:
		%confirmar.disabled = false


func _on_confirmar_pressed():

	for i in range(5):  # Supondo que você tenha 5 slots
		var slot = slots_container.get_child(i)  # Referência ao container de slots
		
		if slot.filled:
			var item_position = slot.get_pos()

			# Verificar se o num_slot e a posição do item são iguais
			if slot.num_slot == int(item_position):  # Altere 'x' conforme necessário
				Globals.is_correct = true # Se não forem iguais, defina como false
				
		else:
			Globals.is_wrong = true  # Se um slot estiver vazio, também é incorreto

