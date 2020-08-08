extends Label

func _process(delta):
	var acquisition_rate = Global_2.get_new_customers_rate()
	text = "%d" % acquisition_rate
