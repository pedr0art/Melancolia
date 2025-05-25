extends Node2D


# Define dois sinais personalizados:
# - hovered: emitido quando o mouse entra na área da carta.
# - hovered_off: emitido quando o mouse sai da área da carta.
const ESCALA_PADRAO_MAO = Vector2(0.2, 0.2)
const ESCALA_PADRAO_SLOT = Vector2(0.05, 0.05)
signal hovered
signal hovered_off
var was_placed_in_slot = false
var current_card_slot = null
var card_slot_reference
var classe = ""
var certo_errado = ""
var nome : String
# Armazena a posição inicial da carta. Pode ser usada para restaurar a posição caso o movimento seja cancelado.
var starting_position
# Função chamada quando o nó entra na árvore de cena pela primeira vez.
func _ready() -> void:
	card_slot_reference = preload("res://scripts/gabinete_pensamento/card_slot.gd")
	# IMPORTANTE: todas as cartas devem ser filhas do CardManager.
	# Aqui, conectamos os sinais da carta ao CardManager, que é o pai da carta.
	get_parent().connect_card_signals(self)

# Função chamada a cada frame. Aqui não está sendo usada.
func _process(delta: float) -> void:
	$Area2D/CollisionShape2D.disabled = (Globals.is_dragging and self != Globals.carta_atual) or current_card_slot != null


# Função chamada automaticamente quando o mouse entra na Area2D da carta.
# Emite o sinal hovered, passando a própria carta como parâmetro.
func _on_area_2d_mouse_entered() -> void:
	emit_signal("hovered", self)

# Função chamada automaticamente quando o mouse sai da Area2D da carta.
# Emite o sinal hovered_off, também passando a própria carta.
func _on_area_2d_mouse_exited() -> void:
	emit_signal("hovered_off", self)
