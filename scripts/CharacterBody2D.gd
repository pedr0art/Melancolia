extends CharacterBody2D

var is_chatting = false
###Movimentação do Personagem
var speed: float = 5500.0
###@onready var animation_tree: AnimationTree = $AnimationTree
@onready var hud_contador = $HUDContador
@onready var animation := $anim as AnimatedSprite2D

var is_moving:bool = false
var dir:Vector2
var last_dir:Vector2 = Vector2(0, 1) # Direção inicial de idle (frente)
enum States { IDLE, MOVE }
var currentState = States.IDLE

func _physics_process(delta):
	if !Globals.cuts and !Globals.is_chatting:
		handle_state_transitions()
		perform_state_actions(delta)
		move_and_slide()
	
func handle_state_transitions():
	if Input.is_action_pressed("Left") or Input.is_action_pressed("Right") or Input.is_action_pressed("Up") or Input.is_action_pressed("Down"):
		currentState = States.MOVE
	else:
		currentState = States.IDLE
			
func perform_state_actions(delta):
	match currentState:
		States.MOVE:
			dir.x = Input.get_axis("Left", "Right")
			dir.y = Input.get_axis("Up", "Down")
			dir = dir.normalized()
			
			# Atualizar a última direção em que o jogador estava se movendo
			if dir != Vector2.ZERO:
				last_dir = dir

			if Globals.is_chatting and last_dir.y < 0:
				animation.play("idle_up")
				
			elif dir.x < 0 and dir.y == 0:
				animation.play("walk_left")
				
			elif dir.x > 0 and dir.y == 0:
				animation.play("walk_right")

			elif dir.y < 0:
				animation.play("walk_up")
				
			elif dir.y > 0:
				animation.play("walk_front")
				

				
			velocity = dir * speed * delta
		
		States.IDLE:
			velocity = velocity.move_toward(Vector2.ZERO, speed * delta)

			# Usar a última direção para definir a animação de idle
			if last_dir.x < 0:
				animation.play("idle_left")
			elif last_dir.x > 0:
				animation.play("idle_right")
			elif last_dir.y < 0  or Globals.is_chatting:
				animation.play("idle_up")
			else:
				animation.play("idle_front")

		
###Física do personagem
#func _physics_process(delta):
	#var direction : Vector2 = Input.get_vector("Left", "Right", "Up", "Down").normalized()

	#if direction and !Globals.is_chatting:
		#velocity = direction * speed
	#else: 
		#velocity = Vector2.ZERO
	#move_and_slide() 
	
func player():
	pass
