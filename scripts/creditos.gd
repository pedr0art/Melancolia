extends ScrollContainer

@onready var rich_text_label: RichTextLabel = $MarginContainer/RichTextLabel
@onready var margin_container: MarginContainer = $MarginContainer

@export_range(1, 100000, 0.1) var credits_time: float = 1
@export_range(0, 100000, 0.1) var margin_increment : float = 0

func _ready() -> void:
	await get_tree().process_frame  # Garante que todos os nós estão no scene tree
	
	# Espera um segundo frame para garantir que o RichTextLabel calculou o tamanho corretamente
	await get_tree().process_frame
	
	# Garante que a rolagem está no topo
	scroll_vertical = 0
	
	# Calcula o valor máximo possível de rolagem
	var scroll_amount := get_v_scroll_bar().max_value
	
	# Cria e configura o tween de forma segura
	var tween := create_tween()
	tween.tween_property(self, "scroll_vertical", scroll_amount, credits_time)
	tween.finished.connect(fim_creditos)

func fim_creditos() -> void:
	get_tree().change_scene_to_file("res://cenas/main_menu.tscn")

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("esc"):
		get_tree().change_scene_to_file("res://cenas/main_menu.tscn")
