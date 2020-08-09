extends PanelContainer


func _process(delta):
	var units_remaining = Global_2.units_remaining_globally
	var start_value = Global_2.units_remaining_globally_start_value
		#uppermost progress-bar in green: Global remaining %
	$TextureProgress.value = floor(units_remaining)
	$TextureProgress.max_value = floor(start_value)
	
	var percent_value = ( units_remaining/start_value)   * 100.0
	$Progress_Label.text = "%d%%" % percent_value

