extends GridContainer

const MAX_SLOTS = 5  # Definindo o limite máximo de slots

func add_item(ID = "0"):
	print("Tentando adicionar item com ID: ", ID)  # Mensagem de debug
	var item_texture = load("res://Images/insight/" + ItemData.get_texture(ID))
	var item_pos = ItemData.get_pos(ID)
	
	print("Posição do item obtida: ", item_pos)  # Verificando a posição obtida
	
	var item_data = {"TEXTURE": item_texture, "POS": item_pos}
	
	var index = -1
	for i in get_children():
		if not i.filled:
			index = i.get_index()
			print("Encontrado slot vazio no índice: ", index)  # Mensagem de debug
			break

	if index != -1:  # Se encontramos um slot vazio
		get_child(index).set_property(item_data)
		print("Item adicionado no slot: ", index)  # Mensagem de confirmação
		check_all_filled()  # Verifica se todos os slots estão preenchidos após a adição
	else:
		print("Todos os slots estão preenchidos.")

# Função para verificar se todos os slots estão preenchidos
func are_all_filled() -> bool:
	for i in range(MAX_SLOTS):
		if not get_child(i).filled:
			return false
	return true

# Função que verifica se todos os slots estão preenchidos e imprime a mensagem
func check_all_filled():
	if are_all_filled():
		print("Todos os slots estão preenchidos!")  # Mensagem quando todos os slots estiverem cheios
		check_item_positions()  # Verifica as posições dos itens quando todos estão preenchidos

# Função para verificar e imprimir as posições dos itens nos slots
func check_item_positions():
	print("Verificando as posições dos itens nos slots:")
	for i in range(MAX_SLOTS):
		var child = get_child(i)
		if child.filled:
			print("Slot ", i, " - Posição do item: ", child.get("POS"))  # Acessando item_pos de forma genérica
		else:
			print("Slot ", i, " - Vazio")


