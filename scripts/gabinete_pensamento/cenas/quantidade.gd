extends RichTextLabel


func _process(_delta):
	var total = 15
	var coletados = GabinetePensamento.itens_coletados.size()
	self.text = str(coletados) + "/" + str(total)
