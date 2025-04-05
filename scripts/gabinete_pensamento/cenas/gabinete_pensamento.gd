extends CanvasLayer

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
var compra = false
var item_atual = ""
var player_hand = []
var mao_string = []
func _ready():
	visible = false

func _process(_delta):
	if Input.is_action_just_pressed("tab"):
		visible = not visible
