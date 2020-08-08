extends Label

func _process(delta):
	var sales_rate = Global_2.get_sales_rate()
	if sales_rate < 100:
		text = "%.2f" % sales_rate
	else:
		text = "%d" % sales_rate
		
