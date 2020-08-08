extends Label


func _process(delta):
	var max_storage = Global_2.get_max_storage()
	text = "%d" % max_storage
