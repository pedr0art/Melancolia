extends Node2D

# Caminho da cena de carta que será instanciada quando o jogador puxar uma carta
const CARD_SCENE_PATH = "res://scripts/gabinete_pensamento/cenas/card.tscn"

# Baralho do jogador contendo os nomes (identificadores) das cartas disponíveis

# Referência ao banco de dados com informações adicionais das cartas (como ataque/vida)
var card_database_reference

# Velocidade com que a carta será adicionada à mão (tempo da animação)
const CARD_DRAW_SPEED = 0.5

# Função chamada quando o nó entra na árvore da cena
func _ready() -> void:
	
	# Carrega o script do banco de dados das cartas (informações extras, como atributos)
	card_database_reference = preload("res://scripts/gabinete_pensamento/card_database.gd")
	if GabinetePensamento.mao_string.size() > 0:
		draw_cards_from_mao_string()

	# Realiza o primeiro sorteio de carta

func _process(delta: float) -> void:
	if GabinetePensamento.compra and GabinetePensamento.player_deck.size() > 0:
		draw_card()
# Função que sorteia uma carta do topo do baralho e a adiciona à mão do jogador
func draw_card():
	var card_drawn_name = GabinetePensamento.item_atual  # Usa diretamente o nome atual
	if not GabinetePensamento.player_deck.has(card_drawn_name):
		print("Carta não está no baralho: ", card_drawn_name)
		return  # Evita continuar se a carta não estiver disponível

	GabinetePensamento.player_deck.erase(card_drawn_name)  # Remove a carta do baralho

	if GabinetePensamento.player_deck.size() == 0:
		$Area2D/CollisionShape2D.disabled = true

	# Carrega a cena da carta
	var card_scene = preload(CARD_SCENE_PATH)
	var new_card = card_scene.instantiate()

	# Define a imagem da carta com base no nome
	var card_image_path = str("res://Images/Cards/" + card_drawn_name + ".png")
	new_card.get_node("CardImage").texture = load(card_image_path)

	# Atribui os atributos
	new_card.classe = card_database_reference.CARDS[card_drawn_name][0]
	new_card.certo_errado = card_database_reference.CARDS[card_drawn_name][1]

	# Adiciona ao CardManager
	$"../CardManager".add_child(new_card)
	new_card.name = "Card"

	# Adiciona à mão
	$"../PlayerHand".add_card_to_hand(new_card, CARD_DRAW_SPEED)

	new_card.get_node("CardImage").scale = Vector2(0.05, 0.05)

	GabinetePensamento.compra = false
func draw_cards_from_mao_string():
	for card_name in GabinetePensamento.mao_string:
		# Carrega a cena da carta
		var card_scene = preload(CARD_SCENE_PATH)
		var new_card = card_scene.instantiate()

		# Define a imagem da carta com base no nome
		var card_image_path = "res://Images/Cards/" + card_name + ".png"
		new_card.get_node("CardImage").texture = load(card_image_path)

		# Atribui os atributos da carta com base no banco de dados
		new_card.classe = card_database_reference.CARDS[card_name][0]
		new_card.certo_errado = card_database_reference.CARDS[card_name][1]

		# Adiciona ao CardManager
		$"../CardManager".add_child(new_card)
		new_card.name = "Card"

		# Adiciona à mão com animação
		$"../PlayerHand".add_card_to_hand(new_card, CARD_DRAW_SPEED)

		# Define o tamanho inicial (pode fazer parte da animação)
		new_card.get_node("CardImage").scale = Vector2(0.05, 0.05)
