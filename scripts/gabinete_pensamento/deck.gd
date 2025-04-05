extends Node2D

# Caminho da cena de carta que será instanciada quando o jogador puxar uma carta
const CARD_SCENE_PATH = "res://scripts/gabinete_pensamento/cenas/card.tscn"

# Baralho do jogador contendo os nomes (identificadores) das cartas disponíveis
var player_deck = [
	"funcdomes_yellow",
	"enzo_yellow",
	"mesapcvazio_yellow",
	"computador_red",
	"seloqualidade_red",
	"alice_red",
	"chefe_grey",
	"pontoeletronico_grey",
	"espelho_grey",
	"cafeteira_blue",
	"francisco_blue",
	"placeholder_blue",
	"folheto_orange",
	"poster_orange",
	"pilhapapeis_orange"
]

# Referência ao banco de dados com informações adicionais das cartas (como ataque/vida)
var card_database_reference

# Velocidade com que a carta será adicionada à mão (tempo da animação)
const CARD_DRAW_SPEED = 0.5

# Função chamada quando o nó entra na árvore da cena
func _ready() -> void:
	player_deck.shuffle()  # Embaralha o baralho ao iniciar a cena

	# Carrega o script do banco de dados das cartas (informações extras, como atributos)
	card_database_reference = preload("res://scripts/gabinete_pensamento/card_database.gd")

	# Realiza o primeiro sorteio de carta
	draw_card()

# Função que sorteia uma carta do topo do baralho e a adiciona à mão do jogador
func draw_card():
	var card_drawn_name = player_deck[0]  # Pega o nome da primeira carta do baralho
	player_deck.erase(card_drawn_name)  # Remove a carta sorteada do baralho

	# Se o baralho estiver vazio após puxar a carta
	if player_deck.size() == 0:
		$Area2D/CollisionShape2D.disabled = true  # Desativa a colisão (impede novo sorteio)
		# $Sprite2D.visible = false  # Ocultaria a imagem do baralho (comentado)
		# $RichTextLabel.visible = false  # Ocultaria o contador (comentado)

	# Carrega a cena da carta
	var card_scene = preload(CARD_SCENE_PATH)
	var new_card = card_scene.instantiate()  # Cria uma instância da carta

	# Define a imagem da carta com base no nome sorteado
	var card_image_path = str("res://Images/Cards/" + card_drawn_name + ".png")
	new_card.get_node("CardImage").texture = load(card_image_path)

	# (Opcional) Preenchimento de atributos da carta, como ataque/vida (comentado)
	new_card.classe = card_database_reference.CARDS[card_drawn_name][0]
	new_card.certo_errado = card_database_reference.CARDS[card_drawn_name][1]

	# Adiciona a nova carta como filha do gerenciador de cartas
	$"../CardManager".add_child(new_card)
	new_card.name = "Card"  # Define o nome do nó (pode ajudar em buscas por nome)

	# Adiciona a carta na mão do jogador com animação
	$"../PlayerHand".add_card_to_hand(new_card, CARD_DRAW_SPEED)

	# Define um tamanho inicial pequeno para a carta (pode fazer parte de uma animação)
	new_card.get_node("CardImage").scale = Vector2(0.05, 0.05)
	# (Opcional) Toca a animação de virar carta ao entrar na mão (comentado)
	# new_card.get_node("AnimationPlayer").play("card_flip")
