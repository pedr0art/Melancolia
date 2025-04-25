extends ScrollContainer

@onready var rich_text_label: RichTextLabel = $MarginContainer/RichTextLabel

@export_range(1,100000, 0.1) var credits_time: float = 1
@export_range(0,100000, 0.1) var margin_increment : float = 0

@onready var margin_container: MarginContainer = $MarginContainer

func _ready() -> void:
	var tween = create_tween()
	
	await get_tree().create_timer(0.01).timeout
	
	var text_box_size = rich_text_label.size.y
	
	var windows_size = DisplayServer.window_get_size().y
	#margin_container.add_theme_constant_override("margin_top", windows_size + margin_increment)
	#margin_container.add_theme_constant_override("margin_bottom",windows_size + margin_increment)

	var scroll_amount = ceil(text_box_size * 3/4 + windows_size + margin_increment)
	
	tween.tween_property(
		self,
		"scroll_vertical",
		scroll_amount,
		credits_time
	)
	
	tween.finished.connect(fim_creditos)
	tween.play()

func fim_creditos():
	get_tree().change_scene_to_file("res://cenas/main_menu.tscn")

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("esc"):
		get_tree().change_scene_to_file("res://cenas/main_menu.tscn")
