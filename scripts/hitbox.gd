extends Area2D



func _on_body_entered(body):
	if body.name == "character":
		print(body.name)
