extends Label

func _process(delta):
	var units = Global_2.units_in_storage
	text = "%d" % units
