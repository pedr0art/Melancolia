extends Control


@onready var button = $Button  # Acesse o botão
@export var slots_container: Node  # Acesse o nó que contém os slots


func _on_confirmar_pressed():
	print("Verificando posições dos itens...")

	for i in range(5):  # Supondo que você tenha 5 slots
		var slot = slots_container.get_child(i)  # Referência ao container de slots
		
		if slot.filled:
			var item_position = slot.get_pos()
			print("Slot ", slot.num_slot, " - Posição do item: ", item_position)

			# Verificar se o num_slot e a posição do item são iguais
			if slot.num_slot == int(item_position):  # Altere 'x' conforme necessário
				Globals.is_correct = true # Se não forem iguais, defina como false
				
		else:
			print("Slot ", slot.num_slot, " - Vazio")
			Globals.is_correct = false  # Se um slot estiver vazio, também é incorreto

	# Verificação final
	if Globals.is_correct:
		print("Todos os slots estão corretos.")
	else:
		print("Alguns slots estão incorretos.")
