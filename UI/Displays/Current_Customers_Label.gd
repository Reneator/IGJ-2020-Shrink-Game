extends Label


func _process(delta):
	var current_customers = Global_2.get_current_customers()
	text = "%d" % current_customers
