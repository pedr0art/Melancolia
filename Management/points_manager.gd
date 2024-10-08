extends Control
@onready var contador = $container/contador_container/contador as Label


# Called when the node enters the scene tree for the first time.
func _ready():
	contador.text = str(Dialogic.VAR.pontos)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	contador.text = str(Dialogic.VAR.pontos)
