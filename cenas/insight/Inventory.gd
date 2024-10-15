extends GridContainer

const MAX_SLOTS = 5  # Definindo o limite máximo de slots


func add_item(ID = "0"):
	var item_texture = load("res://Images/insight/" + ItemData.get_texture(ID))
	var item_pos = ItemData.get_pos(ID)
	
	
	var item_data = {"TEXTURE": item_texture, "POS": item_pos}
	
	# Encontre o primeiro slot vazio
	var index = -1
	for i in get_children():
		if not i.filled:  # Verifique se o slot está vazio
			index = i.get_index()
			break

	if index != -1:  # Se encontramos um slot vazio
		get_child(index).set_property(item_data)
		check_all_filled()  # Verifica se todos os slots estão preenchidos após a adição
	else:
		pass

	
# Função para verificar se todos os slots estão preenchidos
func are_all_filled() -> bool:
	for i in range(MAX_SLOTS):
		if not get_child(i).filled:
			return false
	return true

# Função que verifica se todos os slots estão preenchidos e imprime a mensagem
func check_all_filled():
	if are_all_filled():
		Globals.all_in = true
