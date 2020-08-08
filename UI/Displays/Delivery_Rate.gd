extends Label


func _process(delta):
	var delivery_rate = Global_2.get_deliver_rate()
	text = "%d" % delivery_rate
