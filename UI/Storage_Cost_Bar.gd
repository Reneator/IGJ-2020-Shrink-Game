extends PanelContainer


func _process(delta):
	var time_interval = Global_2.get_cost_interval()
	var current_time = Global_2.cost_current_time
	
	var cost = Global_2.get_cost()
	
	$TextureProgress.value = current_time
	$TextureProgress.max_value = time_interval
	
	$VBoxContainer/Progress_Label.text = "%d" % cost
