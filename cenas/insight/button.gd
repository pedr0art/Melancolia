extends Node2D

@export var objetos: Array[Node2D]
@export var slots: Array[Node]
var ativou = false
func _ready():
	pass

func _on_button_pressed():
	var all_aligned = true
	var first_value = null
	var all_equal = true
	var all_correct = true
	
	for i in range(objetos.size()):
		var obj = objetos[i]
		var slot = slots[i]
			
		if not obj.has_method("is_aligned") or not obj.is_aligned():
			all_aligned = false
			print(obj.name, "não está alinhado.")  # Obtém o slot correspondente
				
		if obj.num_obj != slot.num_plataforma:
			all_correct = false
			print(obj.name, "não corresponde ao slot", slot.num_plataforma)

	if all_aligned and all_correct:
			print("Tudo certo! Todos os objetos estão encaixados e correspondem aos slots.")
	elif not all_aligned:
			print("Alguns objetos não estão nencaixados corretamente.")
	else:
			print("Os objetos estão encaixados,mas não correspondem aos slots.")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	



func _on_area_2d_mouse_entered():
	scale = Vector2(3.05,3.05) # Replace with function body.


func _on_area_2d_mouse_exited():
	scale = Vector2(3,3) # Replace with function body.
