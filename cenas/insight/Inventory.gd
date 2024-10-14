extends GridContainer



func add_item(ID = "0"):
	var item_texture = load("res://Images/insight/" + ItemData.get_texture(ID))
	
	var item_data = {"TEXTURE": item_texture}
	
	var index = 0
	for i in get_children():
		if i.filled == false:
			index = i.get_index()
			break
	get_child(index).set_property(item_data)
