extends Node2D

@export var dialogo: String = ""
@export var item: String = ""

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var exclamation: Sprite2D = $exclamation

var jogador_na_area: bool = false
var item_coletado: bool = false

func _ready() -> void:
	visible = false

func _process(_delta):
	if jogador_na_area and Input.is_action_just_pressed("ui_interact"):
		GabinetePensamento.compra = true
		GabinetePensamento.item_atual = item
		add_card_to_mao_string(item)
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
