extends Control

var prox_level = preload("res://cenas/main_menu.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_rejogar_pressed():
	get_tree().change_scene_to_packed(prox_level)
	Globals.restart = true
	GabinetePensamento.slots_salvos = {}  # Exemplo: {0: "carta1", 1: "carta2"}
	GabinetePensamento.itens_coletados = []
	GabinetePensamento.player_hand = []
	GabinetePensamento.mao_string = []
	GabinetePensamento.slots_certos = 0
	Globals.cuts = false
	Globals.segue = false
	GabinetePensamento.avanco = false
	NavigationManager.spawn_door_tag = null
	Globals.is_chatting = false
	Globals.gabinete = false
	Globals.marmita = false
	DialogoTracker.primeiraescolha = ""
	DialogoTracker.segundaescolha = ""
	DialogoTracker.terceiraescolha = ""
	DialogoTracker.quartaescolha = ""
	DialogoTracker.textofinal = ""
	DialogoTracker.juntetextos = false

func _on_sair_pressed():
	get_tree().quit()
