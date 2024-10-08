extends Node

var itemData = {}

var data_file_path = "res://Dados/Arquivos/Teste.json"

func _ready():
	itemData = load_json_file(data_file_path)
	
func load_json_file(filePath : String):
	if FileAccess.file_exists(filePath):
		
		var dataFile = FileAccess.open(filePath, FileAccess.READ)
		var parsedResult = JSON.parse_string(dataFile.get_as_text())
		
		return parsedResult

		
	else:
		print("arquivo não existe")
# Called when the node enters the scene tree for the first time.




