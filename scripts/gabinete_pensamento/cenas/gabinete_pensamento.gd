extends CanvasLayer

var player_deck = [
	"funcdomes_yellow",
	"enzo_yellow",
	"mesapcvazio_yellow",
	"computador_red",
	"seloqualidade_red",
	"alice_red",
	"chefe_gray",
	"pontoeletronico_gray",
	"espelho_gray",
	"cafeteira_blue",
	"francisco_blue",
	"placeholder_blue",
	"folheto_orange",
	"poster_orange",
	"pilhapapeis_orange"
]
var slots_salvos = {}  # Exemplo: {0: "carta1", 1: "carta2"}

var compra = false
var item_atual = ""
var player_hand = []
var mao_string = []
var pode_avancar = false
var slots_certos = 0

var card_database = CardDatabase.CARDS

var avanco = false

var itens_coletados: Array = []
func _ready():
	visible = false
func _process(_delta):
	if Input.is_action_just_pressed("tab") and not Globals.is_chatting and not Globals.paused:
		alternar_gabinete()
		Globals.apertou = false
		Globals.novo = false
	if Globals.apertou:
		visible = true
		Globals.gabinete = true
		Globals.novo = false


func alternar_gabinete():
	visible = not visible
	Globals.gabinete = visible
	

		
func verificar_se_tudo_certo():
	var total_ocupados = 0
	var total_certos = 0
	
	for slot in get_tree().get_nodes_in_group("card_slots"):
		if slot.card_in_slot:
			total_ocupados += 1
			if slot.card_armazenado and slot.card_armazenado.certo_errado == "certo":
				total_certos += 1
	
	if total_ocupados == 5 and total_certos == 5:
		avanco = true
	else:
		avanco = false


func _on_botao_avanco_pressed() -> void:
	get_tree().change_scene_to_file("res://cenas/cutscene.tscn")


func _on_botao_voltar_pressed() -> void:
	visible = false
	Globals.gabinete = false
	Globals.apertou = false
