extends CharacterBody2D

var is_chatting = false
###Movimentação do Personagem
@export var speed: int = 200
###@onready var animation_tree: AnimationTree = $AnimationTree

	

###Física do personagem
func _physics_process(delta):
	var direction : Vector2 = Input.get_vector("Left", "Right", "Up", "Down").normalized()

	if direction and !Globals.is_chatting:
		velocity = direction * speed
	else: 
		velocity = Vector2.ZERO
	move_and_slide() 
	
func player():
	pass
