extends Node2D

@export var camera_zoom: Vector2 = Vector2(1.5, 1.5)
@export var camera_limit_top: int = -87
@export var camera_limit_bottom: int = 446
@export var camera_limit_left: int = 0
@onready var camera = $CharacterBody2D/Camera2D
@onready var animation := $CharacterBody2D/anim as AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready():
	NavigationManager.on_trigger_player_spawn.connect(_on_spawn)
	Dialogic.signal_event.connect(DialogicSignal)
	camera.zoom = camera_zoom
	camera.limit_top = camera_limit_top
	camera.limit_bottom = camera_limit_bottom
	camera.limit_left = camera_limit_left
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func run_dialogue(dialogue_string):
	Dialogic.start(dialogue_string)
	
func DialogicSignal(arg: String):
	if arg == "segue":
		Globals.segue = true
	elif arg == "ande":
		Globals.is_chatting = false
func play_anim (anim_name) -> void:
	animation.play(anim_name)

func _on_spawn(position: Vector2, direction: String):
	global_position = position

	match direction:
		"up":
			get_node("CharacterBody2D").last_dir = Vector2(0, -1)
			get_node("CharacterBody2D").animation.play("idle_up")
		"down":
			get_node("CharacterBody2D").last_dir = Vector2(0, 1)
			get_node("CharacterBody2D").animation.play("idle_front")
		"left":
			get_node("CharacterBody2D").last_dir = Vector2(-1, 0)
			get_node("CharacterBody2D").animation.play("idle_left")
		"right":
			get_node("CharacterBody2D").last_dir = Vector2(1, 0)
			get_node("CharacterBody2D").animation.play("idle_right")
