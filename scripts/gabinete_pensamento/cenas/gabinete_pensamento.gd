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
@onready var card_slot: Node2D = $CardSlots/CardSlot
@onready var card_slot_2: Node2D = $CardSlots/CardSlot2
@onready var card_slot_3: Node2D = $CardSlots/CardSlot3
@onready var card_slot_4: Node2D = $CardSlots/CardSlot4
@onready var card_slot_5: Node2D = $CardSlots/CardSlot5

var compra = false
var item_atual = ""
var player_hand = []
var mao_string = []
var pode_avancar = false
var slots_certos = 0

var card_database = CardDatabase.CARDS
@onready var button: Button = $Button

var slot_yellow = false
var slot_red = false
var slot_gray = false
var slot_blue = false
var slot_orange = false

func _ready():
	visible = false

func _process(_delta):
	if Input.is_action_just_pressed("tab"):
		visible = not visible
		Globals.gabinete = not Globals.gabinete
	if slots_certos == 5:
		$Button.disabled = false
		

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://cenas/cutscene.tscn")
		
