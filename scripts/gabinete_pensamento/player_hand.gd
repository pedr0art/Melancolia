extends Node2D

# Constantes para definir:
# - a largura entre cartas na mão
# - a posição vertical fixa da mão (eixo Y)
# - a velocidade padrão de animação
const CARD_WIDTH = 60
const HAND_Y_POSITION = 312
const DEFAULT_CARD_MOVE_SPEED = 0.1

# Lista que armazenará as cartas atualmente na mão do jogador
var player_hand = []

# Posição horizontal central da tela (em pixels)
var center_screen_x

# Função chamada quando o nó entra pela primeira vez na árvore da cena
func _ready() -> void:
	center_screen_x = 640 / 2  # Assume largura da tela como 640px, centraliza a mão horizontalmente

# Função usada para adicionar uma carta à mão do jogador
# Se ela já estiver na mão, anima de volta para sua posição original
func add_card_to_hand(card, speed):
	if card not in player_hand:
		player_hand.insert(0, card)  # Insere a carta no início da lista
		update_hand_positions(speed)  # Atualiza posições de todas as cartas com animação
	else:
		# Se já estiver na mão, retorna para a posição inicial
		animate_card_to_position(card, card.starting_position, DEFAULT_CARD_MOVE_SPEED)

# Atualiza a posição de cada carta na mão com base na quantidade de cartas e no índice
func update_hand_positions(speed):
	for i in range(player_hand.size()):
		# Calcula nova posição horizontal para a carta no índice `i`
		var new_position = Vector2(calculate_card_position(i), HAND_Y_POSITION)
		var card = player_hand[i]
		card.starting_position = new_position  # Armazena a nova posição como posição inicial da carta
		animate_card_to_position(card, new_position, speed)  # Anima a carta até a nova posição

# Calcula a posição X de uma carta com base no seu índice na mão
func calculate_card_position(index):
	var total_width = (player_hand.size() - 1) * CARD_WIDTH  # Largura total ocupada pela mão
	var x_offset = center_screen_x + index * CARD_WIDTH - total_width / 2  # Centraliza a mão na tela
	return x_offset

# Anima a carta até uma nova posição com uma Tween
func animate_card_to_position(card, new_position, speed):
	var tween = get_tree().create_tween()  # Cria uma nova animação Tween
	tween.tween_property(card, "position", new_position, speed)  # Move a carta suavemente para a nova posição

# Remove uma carta da mão e atualiza a disposição das cartas restantes
func remove_card_from_hand(card):
	if card in player_hand:
		player_hand.erase(card)  # Remove a carta da lista
		update_hand_positions(DEFAULT_CARD_MOVE_SPEED)  # Reorganiza as posições das cartas restantes
