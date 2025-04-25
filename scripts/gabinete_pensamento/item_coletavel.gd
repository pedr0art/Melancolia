extends Node2D

@export var dialogo: String = ""
@export var item: String = ""

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var exclamation: Sprite2D = $exclamation

var jogador_na_area: bool = false
var item_coletado: bool = false
var resource
@onready var sfx_item: AudioStreamPlayer2D = $sfx_item

func _ready() -> void:
	visible = false
	resource = load("res://DialogueManager/" + dialogo + ".dialogue")
	if item in GabinetePensamento.itens_coletados:
		queue_free()  # Destrói o item antes mesmo de aparecer

func _process(_delta):
	if jogador_na_area and Input.is_action_just_pressed("ui_interact") and not item_coletado:
		item_coletado = true  # impede múltiplas execuções
		sfx_item.play()
		GabinetePensamento.compra = true
		GabinetePensamento.item_atual = item
		add_card_to_mao_string(item)
		Globals.mostra = "res://Images/Cards/" + item + ".png"
		DialogueManager.show_dialogue_balloon(resource, "start")
		Globals.novo = true
		if item != "" and item not in GabinetePensamento.itens_coletados:
			GabinetePensamento.itens_coletados.append(item)
		await sfx_item.finished
		queue_free()



func add_card_to_mao_string(card):
	if card not in GabinetePensamento.mao_string:
		GabinetePensamento.mao_string.insert(0, card)  # Insere a carta no início da lista


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		visible = true
		jogador_na_area = true
		exclamation.visible = true
		animation_player.play("exclamation")


func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		visible = false
		jogador_na_area = false
		exclamation.visible = false
		animation_player.stop()
