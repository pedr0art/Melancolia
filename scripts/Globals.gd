extends Node

var is_chatting = false
var is_dragging = false
var is_correct = false
var is_wrong = false
var all_in = false
var segue = false
var primeiro = true 
var cuts = false
var restart = false
var alternat = false
var cena_atual = preload("res://cenas/ep_1/cenario1.tscn")
var carta_atual
var hand_full = false
var hand = []
var classe_hand = []
var classe_atual 

var player_deck =[
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
	"pilhapapeis_orange"]
