extends Label

func _process(delta):
	var sales_efficiency = Global_2.get_sales_efficiency()
	var percent = sales_efficiency * 100.0
	text = "%d%%" % percent
